import re
import os
import subprocess
from datetime import datetime
from dotenv import load_dotenv
from loguru import logger

load_dotenv()


def parse_odometer(text: str) -> int:
    if ["тис", "тыс"] in text:
        num = re.findall(r'\d+', text)
        if num:
            return int(num[0]) * 1000
    else:
        num = re.findall(r'\d+', text)
        if num:
            return int(''.join(num))
    return 0


def dump_database():
    db_url = os.getenv("DATABASE_URL")
    if not db_url:
        logger.error("DATABASE_URL not found in .env")
        return

    now = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    dump_file = f"dumps/dump_{now}.sql"

    match = re.match(r".*//(.*?):(.*?)@(.*?):(\d+)/(.*)", db_url)
    if not match:
        logger.error("DATABASE_URL format is invalid")
        return

    user, password, host, port, dbname = match.groups()

    cmd = [
        "pg_dump",
        f"--username={user}",
        f"--host={host}",
        f"--port={port}",
        "--no-password",
        "--format=plain",
        "--encoding=UTF8",
        "--verbose",
        "--file", dump_file,
        dbname,
    ]

    env = os.environ.copy()
    env["PGPASSWORD"] = password

    try:
        subprocess.run(cmd, check=True, env=env)
        logger.info(f"[dump_database] Dump saved to {dump_file}")
    except Exception as e:
        logger.error(f"[dump_database] Dump failed: {e}")
