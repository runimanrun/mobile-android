import os
import random
from datetime import datetime, timedelta

def campaignId_generator():
    campaignId = random.randint(10000, 99999)
    return campaignId

def getEpochTime(day):
    tomorrow = datetime.now() + timedelta(days=day)
    tomorrow_formatted = tomorrow.strftime('%d/%m/%Y')
    dt_string = tomorrow.strftime("%Y-%m-%d %H:%M:%S")

    return dt_string
