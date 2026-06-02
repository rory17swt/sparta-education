`db.characters.find({name: "Chewbacca"}, {name: 1, eye_color: 1})`
```
 {
  _id: ObjectId('6a1eab75452c93b3fd31cabc'),
  name: 'Chewbacca',
  eye_color: 'blue'
}
```
---
`db.characters.find({name: "Chewbacca"}, {name: 1, eye_color: 1, _id: 0})`
```
{
  name: 'Chewbacca',
  eye_color: 'blue'
}
```
---
`db.characters.find({name: "Ackbar"}, {name: 1, "species.name" : 1, _id: 0})`
```
{
  name: 'Ackbar',
  species: {
    name: 'Mon Calamari'
  }
}
```
---
```
db.characters.find(
  {
    "species.name": "Human"
  }, 
  {
    name: 1,
    "homeworld.name": 1,
    _id: 0
  }
)
```
```
{
  name: 'Jango Fett',
  homeworld: {
    name: 'Concord Dawn'
  }
}
{
  name: 'Anakin Skywalker',
  homeworld: {
    name: 'Tatooine'
  }
}
  // etc
```
--- 
```
db.characters.find(
  {
    eye_color: {
      $in: ["yellow", "orange"]
    }
  },
  {
    name: 1,
    eye_color: 1,
    _id: 0
  }
)
```
```
{
  name: 'Ackbar',
  eye_color: 'orange'
}
{
  name: 'Darth Maul',
  eye_color: 'yellow'
}
// etc
```
---
```
db.characters.find(
  {
    $and: [
      {eye_color: "blue"},
      {gender: "female"}
    ]
  }, 
  {
    name: 1,
    eye_color: 1,
    gender: 1,
    _id: 0
  }
)
```
```
{
  name: 'Adi Gallia',
  eye_color: 'blue',
  gender: 'female'
}
{
  name: 'Mon Mothma',
  eye_color: 'blue',
  gender: 'female'
}
```
---
```
db.characters.find(
  {
    $or: [
      {eye_color: "blue"},
      {gender: "female"}
    ]
  }, 
  {
    name: 1,
    eye_color: 1,
    gender: 1,
    _id: 0
  }
)
```
```
{
  name: 'Adi Gallia',
  eye_color: 'blue',
  gender: 'female'
}
{
  name: 'Anakin Skywalker',
  eye_color: 'blue',
  gender: 'male'
}
{
  name: 'R4-P17',
  eye_color: 'red, blue',
  gender: 'female'
}
{
  name: 'Rey',
  eye_color: 'hazel',
  gender: 'female'
}
```
---
```
db.characters.updateMany(
  {height: "unknown"},
  {$unset: {height: ""}}
)


db.characters.updateMany(
  {},
  [{$set: {height: {$toInt: "$height"}}}]
)
```
```
db.characters.find({ height: { $gt: 200 } })
```
---
Put image of mongosh operators
---
```
db.characters.aggregate([
  {$match: {"species.name": "Human"}},
  {$group: {_id: "$gender", total: {$sum: "$height"}}}
])
```
```
{
  _id: 'male',
  total: 4194
}
{
  _id: 'female',
  total: 1282
}
```
---
```
db.characters.distinct("species.name")
```
```
[
  'Aleena',     'Besalisk',  'Cerean',
  'Chagrian',   'Clawdite',  'Droid',
  'Dug',        'Ewok',      'Geonosian',
  'Gungan',     'Human',     'Hutt',
  'Iktotchi',   'Kaleesh',   'Kaminoan',
  'Kel Dor',    'Mirialan',  'Mon Calamari',
  'Muun',       'Nautolan',  'Neimodian',
  "Pau'an",     'Quermian',  'Rodian',
  'Skakoan',    'Sullustan', 'Tholothian',
  'Togruta',    'Toong',     'Toydarian',
  'Trandoshan', "Twi'lek",   'Vulptereen',
  'Wookiee',    'Xexto',     "Yoda's species",
  'Zabrak'
]
```
---
`db.characters.countDocuments({})`

`87`
---
`db.characters.countDocuments({"species.name": "Human"})`

`35`
---
`db.characters.estimatedDocumentCount({"species.name": "Human"})`

`87`
---
**Task 1**:

Convert mass to be double data type

```
db.characters.updateMany(
  {},
  [{
    $set: {
      mass: {
        $convert: {
          input: "$mass",
          to: "double",
          onError: null
        }
      }
    }
  }]
)
```
```
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 87,
  modifiedCount: 82,
  upsertedCount: 0
}
```
---

**Task 2**: 

Find the maximum height per homeworld

```
db.characters.aggregate([
  {
    $group: {
      _id: "$homeworld.name",
      maxHeight: { $max: "$height" }
    }
  }
])
```
```
{
  _id: 'Stewjon',
  maxHeight: 182
}
{
  _id: 'Dorin',
  maxHeight: 188
}
// etc
```