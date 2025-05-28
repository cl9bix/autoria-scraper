import os
from dotenv import load_dotenv
load_dotenv()

class Settings:
    START_URL = os.getenv("START_URL")
    SCRAPE_TIME = os.getenv("SCRAPE_TIME", "12:00")
    DUMP_TIME = os.getenv("DUMP_TIME", "12:10")
    DB_URL = (f"postgresql+asyncpg://{os.getenv('POSTGRES_USER')}:{os.getenv('POSTGRES_PASSWORD')}"
              f"@{os.getenv('POSTGRES_HOST')}:{os.getenv('POSTGRES_PORT')}/{os.getenv('POSTGRES_DB')}")
    SCRAPE_PAGE_NUM = int(os.getenv("SCRAPE_PAGE_NUM", 30))
    CONCURRENT_REQUESTS = 5


settings = Settings()