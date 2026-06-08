import requests
from pymongo import MongoClient

url = "https://api.open-meteo.com/v1/forecast?latitude=51.5,48.85,52.52,40.42&longitude=-0.12,2.35,13.41,-3.70&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m&timezone=Europe%2FLondon"

response = requests.get(url)
data = response.json()

client = MongoClient("mongodb://localhost:27017/")
db = client["weather_db"]
collection = db["forecasts"]

collection.insert_many(data)
print(f"Successful")