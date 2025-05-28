from sqlalchemy import String, Integer, DateTime
from sqlalchemy.orm import Mapped, mapped_column
from datetime import datetime
from core.db import Base


class Car(Base):
    __tablename__ = "cars"

    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    url: Mapped[str] = mapped_column(String(500), unique=True, nullable=False)
    title: Mapped[str] = mapped_column(String(255), nullable=True)
    price_usd: Mapped[int] = mapped_column(Integer, nullable=True)
    odometer: Mapped[int] = mapped_column(Integer, nullable=True)
    username: Mapped[str] = mapped_column(String(100), nullable=True)
    phone_number: Mapped[str] = mapped_column(String(30), nullable=True)
    image_url: Mapped[str] = mapped_column(String(500), nullable=True)
    images_count: Mapped[int] = mapped_column(Integer, nullable=True)
    car_number: Mapped[str] = mapped_column(String(50), nullable=True)
    car_vin: Mapped[str] = mapped_column(String(100), nullable=True)
    datetime_found: Mapped[datetime] = mapped_column(DateTime, default=datetime.utcnow, nullable=False)
