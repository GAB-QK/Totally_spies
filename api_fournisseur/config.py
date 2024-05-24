import os

class Config:
    SQLALCHEMY_DATABASE_URI = os.environ.get('sqlite:///human_bot.db')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
