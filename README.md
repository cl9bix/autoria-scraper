# Autoria Parser

Це асинхронний парсер для платформи **AutoRia**, який автоматично збирає дані про б/у автомобілі.

---

## Tech Stack

- **Core:** Python 3.12, asyncio, Playwright  
- **Scraping & Parsing:** Playwright, BeautifulSoup (bs4)  
- **Database:** PostgreSQL, SQLAlchemy, Alembic  
- **Scheduling:** APScheduler  
- **Environment Management:** python-dotenv  
- **Containerization:** Docker, Docker Compose  
- **Logging:** logging (вбудований модуль)  
- **Інше:** pip, .env конфігурація, asyncpg

---

## Встановлення

1. Клонуйте репозиторій:

```bash
git clone https://github.com/cl9bix/autoria-scraper.git
cd autoria-scraper
```

2. Створіть `.env` файл у корені проєкту зі вмістом:

```env
DATABASE_URL=postgresql+asyncpg://postgres:54321@db:5432/autoria_db
START_URL=https://auto.ria.com/car/used/
SCRAPE_TIME=18:09
DUMP_TIME=18:30
SCRAPE_PAGE_NUM=1
BASE_URL=https://auto.ria.com
```

3. Запустіть додаток через Docker:

```bash
docker-compose up --build
```

Це підніме такі сервіси:

- `scraper` – асинхронний скрейпер, що запускає модуль `scheduler`  
- `db` – PostgreSQL база даних

---

## Environment Variables

| Назва              | Опис                                      | Приклад                                                 |
|--------------------|-------------------------------------------|----------------------------------------------------------|
| `DATABASE_URL`     | URL підключення до PostgreSQL             | `postgresql+asyncpg://postgres:54321@localhost:5432/autoria_db` |
| `START_URL`        | Початковий URL для скрапінгу              | `https://auto.ria.com/car/used/`                         |
| `BASE_URL`         | Базовий URL сайту                         | `https://auto.ria.com`                                   |
| `SCRAPE_TIME`      | Час щоденного запуску парсингу            | `18:09`                                                  |
| `DUMP_TIME`        | Час щоденного дампу бази                  | `18:30`                                                  |
| `SCRAPE_PAGE_NUM`  | Кількість сторінок для сканування         | `1`                                                      |

---

## Структура проєкту

```bash
autoria-scraper/
│
├── core/
│   ├── config.py          # Налаштування додатку
│   ├── crud.py            # Допіжні функції для парсингу
│   ├── db.py              # Підключення до бази даних
│   ├── scraper.py         # Основна логіка парсингу
│   ├── imitation.py       # BrowserManager (Playwright)
│   ├── utils.py           # Допоміжні функції (дамп бази даних)
│   └── models.py          # SQLAlchemy-моделі
│
├── alembic/               # Міграції БД 
├── dumps/                 # Папка для дампів бази
├── .env                   # Змінні середовища
├── main.py                # Точка входу (скрейпінг + планувальник)
├── requirements.txt       # Python-залежності
├── Dockerfile             # Docker-інструкції
├── docker-compose.yml     # Контейнери (scraper + db)
└── README.md             
```

---

## Використання

Після запуску додатку (`docker-compose up`), парсинг буде виконуватись щодня автоматично відповідно до `SCRAPE_TIME`.

Щоденний дамп бази зберігається у папці `dumps/` відповідно до `DUMP_TIME`.

---

## Дані, що зберігаються

| Поле             | Тип       | Опис                                        |
|------------------|-----------|---------------------------------------------|
| `url`            | string    | Посилання на оголошення                     |
| `title`          | string    | Назва авто                                  |
| `price_usd`      | number    | Ціна у доларах США                          |
| `odometer`       | number    | Пробіг у км (наприклад, `95000`)            |
| `username`       | string    | Ім’я продавця                               |
| `phone_number`   | string    | Телефон продавця (у форматі +380…)          |
| `image_url`      | string    | URL головного зображення                    |
| `images_count`   | number    | Кількість фото                              |
| `car_number`     | string    | Державний номер авто                        |
| `car_vin`        | string    | VIN-код автомобіля                          |
| `datetime_found` | datetime  | Дата та час збору оголошення                |