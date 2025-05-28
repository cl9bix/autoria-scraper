from apscheduler.schedulers.blocking import BlockingScheduler
from core.scraper import scrape_auto_ria
from core.utils import dump_database
from core.config import settings
import logging
logging.basicConfig(level=logging.INFO)

scheduler = BlockingScheduler()
@scheduler.scheduled_job("cron", hour=int(settings.SCRAPE_TIME.split(":")[0]), minute=int(settings.SCRAPE_TIME.split(":")[1]))
def scheduled_scrape():
    import asyncio
    asyncio.run(scrape_auto_ria())

@scheduler.scheduled_job("cron", hour=int(settings.DUMP_TIME.split(":")[0]), minute=int(settings.DUMP_TIME.split(":")[1]))
def scheduled_dump():
    dump_database()

if __name__ == "__main__":
    scheduler.start()



# TEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRON
# TEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRON
# TEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRON
# TEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRONTEST MODE WITHOUT CRON
# if __name__ == "__main__":
#     import asyncio
#     asyncio.run(scrape_auto_ria())
#
#     scheduler.start()
