import pymongo
from pprint import pprint

client = pymongo.MongoClient()
db = client['starwars']

# luke = db.characters.find_one({"name": "Luke Skywalker"})
# print(type(luke))

# droids = db.characters.find({"species.name": "Droid"})
# for droid in droids:
#     print(droid["name"])



# 1 find darth vader
print(db.characters.find_one(
    {"name": "Darth Vader"},
    {"name":1, "height":1, "_id":0}
    )
)


# 2 Characters with yellow eyes
for doc in db.characters.find({"eye_color": "yellow"}):
    print(doc["name"])


# 3 First 3 male entries
for man in db.characters.find({"gender": "male"}).limit(3):
    pprint(man)


# 4 All Humans from Alderaan
for human in db.characters.find({"species.name": "Human", "homeworld.name": "Alderaan"}):
    print(human["name"])

    nosql_and_cloud\pymongo\testing_pymongo.py
