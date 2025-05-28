import asyncio
import httpx
import logging
import re
from datetime import datetime
from selectolax.parser import HTMLParser
from sqlalchemy import select
from core.models import Car
from core.db import AsyncSessionLocal
import os
import httpx
from bs4 import BeautifulSoup
from core.config import settings
import html as html_lib
from html import unescape as html_unescape
from urllib.parse import urljoin
import json
from playwright.async_api import async_playwright

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)

SCRAPE_PAGE_NUM = settings.SCRAPE_PAGE_NUM
CONCURRENT_REQUESTS = settings.CONCURRENT_REQUESTS

BASE_URL = "https://auto.ria.com"
PHONE_REGEX = re.compile(r"\(?\d{3}\)?\s?\d{3}[-\s]?\d{2}[-\s]?\d{2}")


def get_text(node):
    return node.text(strip=True) if node else ""


def normalize_odometer(text):
    return int(re.sub(r"\D", "", text)) if text else 0


def parse_price(text: str):
    try:
        clean = text.replace(" ", "").replace("\xa0", "").replace("&nbsp;", "")
        clean = clean.replace("$", "").replace("€", "").replace("грн", "")
        return int(re.sub(r"[^\d]", "", clean))
    except (ValueError, AttributeError):
        return None


async def is_exists(session, url: str) -> bool:
    stmt = select(Car).where(Car.url == url)
    result = await session.execute(stmt)
    return result.scalar_one_or_none() is not None


def convert_phone(formatted_phone: str) -> str:
    digits = re.sub(r"\D", "", formatted_phone)
    if len(digits) == 10 and digits.startswith("0"):
        return f"+380{digits[1:]}"

    if len(digits) == 12 and digits.startswith("380"):
        return f"+{digits}"

    return f"+{digits}"


async def extract_first_phone_number(url: str) -> str | None:
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True, args=["--no-sandbox"])
        context = await browser.new_context()
        page = await context.new_page()

        await page.goto(url, wait_until="domcontentloaded")

        try:
            await page.click("button.fc-cta-consent", timeout=2000)
        except:
            pass
        try:
            await page.wait_for_selector(".fc-consent-root", state="detached", timeout=2000)
        except:
            await page.evaluate("""() => {
                const el = document.querySelector('.fc-consent-root');
                if (el) el.remove();
            }""")

        try:
            item = page.locator(".phones_item").first
            show_btn = item.locator("a.phone_show_link")
            if await show_btn.count() == 0:
                return None
            await show_btn.click()
            await page.wait_for_timeout(1000)
            raw_number = await item.inner_text()
            return convert_phone(raw_number.strip())
        except:
            return None
        finally:
            await browser.close()


async def fetch_page_with_phone(url: str) -> tuple[str, str | None]:
    from playwright.async_api import async_playwright

    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True, args=["--no-sandbox"])
        context = await browser.new_context()
        page = await context.new_page()
        await page.goto(url, wait_until="domcontentloaded")

        try:
            await page.click("button.fc-cta-consent", timeout=2000)
        except:
            pass
        try:
            await page.wait_for_selector(".fc-consent-root", state="detached", timeout=2000)
        except:
            await page.evaluate("""() => {
                const el = document.querySelector('.fc-consent-root');
                if (el) el.remove();
            }""")

        phone_number = None
        try:
            item = page.locator(".phones_item").first
            show_btn = item.locator("a.phone_show_link")
            if await show_btn.count() > 0:
                await show_btn.click()
                await page.wait_for_timeout(1000)
                raw_number = await item.inner_text()
                phone_number = convert_phone(raw_number.strip())
        except:
            pass

        html = await page.content()
        await browser.close()
        return html, phone_number


async def fetch_page(client: httpx.AsyncClient, url: str, retries=3, timeout=30) -> str:
    if not url.startswith("http"):
        url = f"{BASE_URL}{url}"
    for attempt in range(1, retries + 1):
        try:
            resp = await client.get(url, timeout=timeout)
            resp.raise_for_status()
            return resp.text
        except (httpx.ReadTimeout, httpx.ConnectTimeout):
            logger.warning(f"[fetch_page] Timeout on {url}, attempt {attempt}/{retries}")
        except httpx.HTTPStatusError as e:
            logger.error(f"[fetch_page] HTTP error on {url}: {e}")
            break
        except Exception as e:
            logger.error(f"[fetch_page] Unexpected error on {url}: {e}")
        await asyncio.sleep(2 * attempt)
    return ""


async def parse_car_task(client: httpx.AsyncClient, url: str, semaphore: asyncio.Semaphore):
    if not url.startswith("http"):
        url = urljoin(BASE_URL, url)

    async with semaphore:
        async with AsyncSessionLocal() as session:
            if await is_exists(session, url):
                logger.debug(f"[parse_car] Already exists: {url}")
                return None

            try:
                html_content, phone_number = await fetch_page_with_phone(url)
            except Exception as e:
                logger.error(f"[parse_car] Failed playwright fetch: {url}: {e}")
                return None

            if not html_content:
                logger.warning(f"[parse_car] Empty content for {url}")
                return None

            tree = HTMLParser(html_content)
            car_type = "new" if "/newauto/" in url else "used"

            try:
                if car_type == "new":
                    title_node = tree.css_first("h1.auto-content_title") or tree.css_first("h1") or tree.css_first(
                        "h3.auto-content_title")
                    price_node = tree.css_first("strong.common-text.ws-pre-wrap.titleL") or tree.css_first(
                        "span.price_value strong")
                    vin_node = tree.css_first("div.auto-info span.label-vin")
                    odo_node = tree.css_first("div.line > span:contains('Пробіг') + span")
                    username_node = tree.css_first("div.seller_info_name") or tree.css_first(
                        'common-text ws-pre-wrap titleM')

                    phone_number = await extract_first_phone_number(url)
                    car_number_node = 'Немає номеру'
                    img_count = len(tree.css("div.photo-item img"))
                else:
                    title_node = tree.css_first("h1.head") or tree.css_first("h3.auto-content_title") or tree.css_first(
                        "h1.auto-content_title")
                    price_node = tree.css_first("strong.common-text.ws-pre-wrap.titleL") or tree.css_first(
                        "span.price_value strong")
                    vin_node = tree.css_first("span.label-vin")
                    odo_node = tree.css_first('div.bold.dhide[style*="margin-bottom"]')
                    username_node = tree.css_first("div.seller_info_name") or tree.css_first(
                        'common-text ws-pre-wrap titleM')

                    phone_number = await extract_first_phone_number(url)

                    car_number_node = tree.css_first("div.t-check span.state-num.ua")
                    img_count = len(tree.css(".photo-620x465 img"))

                title = get_text(title_node)
                if not title:
                    logger.warning(f"[parse_car] EMPTY TITLE for {url}")

                username = get_text(username_node)

                price_usd = None
                try:
                    comment_usd_match = re.search(r"<!--\[-->([\d\s\u00a0&;]+)\$<!--\]-->", html_content)
                    if comment_usd_match:
                        raw_price = comment_usd_match.group(1)
                        price_text = html_lib.unescape(raw_price)
                        price_usd = int(re.sub(r"[^\d]", "", price_text))
                        logger.debug(f"[parse_car] Price in USD from comment: '{price_text}' -> {price_usd}")
                    else:

                        comment_uah_match = re.search(r"<!--\[-->([\d\s\u00a0&;]+)грн<!--\]-->", html_content)
                        if comment_uah_match:
                            raw_price_uah = comment_uah_match.group(1)
                            price_text_uah = html_lib.unescape(raw_price_uah)
                            price_uah = int(re.sub(r"[^\d]", "", price_text_uah))
                            price_usd = round(price_uah / 42.5)
                            logger.debug(
                                f"[parse_car] Price in UAH from comment: '{price_text_uah}' -> {price_uah}, converted to USD -> {price_usd}")

                except Exception as e:
                    logger.warning(f"[parse_car] Error parsing price from comment: {e}")

                if price_usd is None and price_node:
                    try:
                        price_text = get_text(price_node)
                        price_text = html_lib.unescape(price_text)
                        match_usd = re.search(r"([\d\s\u00a0&;]+)\$", price_text)
                        if match_usd:
                            price_usd = int(re.sub(r"[^\d]", "", match_usd.group(1)))
                            logger.debug(f"[parse_car] Price in USD from price_node: '{price_text}' -> {price_usd}")
                        else:
                            match_uah = re.search(r"([\d\s\u00a0&;]+)грн", price_text)
                            if match_uah:
                                price_uah = int(re.sub(r"[^\d]", "", match_uah.group(1)))
                                price_usd = round(price_uah / 42.5)
                                logger.debug(
                                    f"[parse_car] Price in UAH from price_node: '{price_text}' -> {price_uah}, converted to USD -> {price_usd}")
                    except Exception as e:
                        logger.warning(f"[parse_car] Error parsing price_node: {e}")

                if price_usd is None:
                    with open(f"debug/debug_price_{url.split('/')[-1]}.html", "w", encoding="utf-8") as f:
                        f.write(html_content)

                car_vin = get_text(vin_node)

                odometer = 0
                if odo_node:
                    odo_text = odo_node.text() if hasattr(odo_node, "text") else str(odo_node)

                    match = re.search(r"([\d\s]+)\s*тис", odo_text)
                    if match:
                        odometer = int(match.group(1).replace(" ", "")) * 1000
                    else:
                        match = re.search(r"([\d\s]+)", odo_text)
                        if match:
                            odometer = int(match.group(1).replace(" ", ""))

                    car_number = 'Немає номеру'
                if car_number_node:
                    car_number = get_text(car_number_node).replace(" ", "")[:8]
                    match = re.search(r'[A-ZА-ЯІЇЄ]{2}\s?\d{4}\s?[A-ZА-ЯІЇЄ]{2}', car_number)
                    car_number = match.group(0) if match else car_number[:50]

                img_node = (
                        tree.css_first("div.photo-620x465 picture img") or
                        tree.css_first("div.photo-item picture img") or
                        tree.css_first("picture img") or
                        tree.css_first("img")
                )
                image_url = img_node.attributes.get("src") if img_node else None

                if not image_url:
                    og_img = tree.css_first("meta[property='og:image']")
                    if og_img:
                        image_url = og_img.attributes.get("content")

                if not image_url:
                    logger.warning(f"[parse_car] EMPTY IMAGE for {url}")

                car = Car(
                    url=url,
                    title=title,
                    price_usd=price_usd,
                    car_vin=car_vin,
                    odometer=odometer,
                    username=username,
                    phone_number=phone_number,
                    car_number=car_number,
                    images_count=img_count,
                    image_url=image_url,
                    datetime_found=datetime.utcnow()
                )
                session.add(car)
                await session.commit()
                logger.info(f"[parse_car] Car added: {url}")
                return car
            except Exception as e:
                logger.error(f"[parse_car] Error processing {url}: {e}")
                return None


async def scrape_auto_ria():
    start_url = "https://auto.ria.com/uk/car/used/"
    semaphore = asyncio.Semaphore(CONCURRENT_REQUESTS)

    async with httpx.AsyncClient() as client:
        page_tasks = [fetch_page(client, f"{start_url}?page={page}") for page in range(1, SCRAPE_PAGE_NUM + 1)]
        logger.info(f"[scrape_auto_ria] Fetching {SCRAPE_PAGE_NUM} pages concurrently")
        pages = await asyncio.gather(*page_tasks)

        car_urls = set()
        for page, h in enumerate(pages, start=1):
            if not h:
                logger.warning(f"[scrape_auto_ria] Empty page {page}")
                continue

            tree = HTMLParser(h)
            links = tree.css("section.ticket-item a.address")
            for link in links:
                href = link.attributes.get("href")
                if href:
                    if not href.startswith("http"):
                        href = f"{BASE_URL}{href}"
                    car_urls.add(href.split("?")[0])

        logger.info(f"[scrape_auto_ria] Found {len(car_urls)} unique car links")

        parse_tasks = [parse_car_task(client, url, semaphore) for url in car_urls]
        results = await asyncio.gather(*parse_tasks)

        new_cars = [car for car in results if car is not None]
        logger.info(f"[scrape_auto_ria] Successfully added {len(new_cars)} new cars")
