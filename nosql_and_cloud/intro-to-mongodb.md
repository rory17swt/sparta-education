# Intro to MongoDB

MongoDB is a document database that stores JSON-like documents, which allows you to store data with flexible schema and provides querying and aggregation tools for access and analysis.

## MongoDB Use Cases and Advanatges/Disadvatages

**Advatages**:
- Document Oriented Storage
- Easy Scaling (Horizontal)
- Fast/Efficient
- "Open Source"
    - Publically available
    - Source code can be edited/changed at will
    - Free to use at scale --> no liccense fees etc.
    - Code can be distributed at will
- Flexible

**DisAdvanatges**:
- High memory usage and data redundancy
- Can be inconsistment
- Unsupported transactions

**Use Cases**:
- Social Media posts/data
- API data (JSON)
- Mobile App Backend
- Caching
    - E.g. shopping cart
- Product info
- Media files/data
- CMS systems
- CRM systems
    - Heavy text aspects
- IoT and sensor data
- Logs and monitoring data
- Gaming data
- Chat systems/apps

## Connecting to MongoDB locally using Compass

**Localhost**:

Localhost refers to you own machine, it points to your local IP (127.0.0.1)

**Ports**:

- A port is a communication endpoint on your machine
- MongoDB's default port is `27017`
- When compass connects to `mongodb://localhost:27017`, it connects to your own machine.

**Steps**:

1. Open Compass - it will attempt to connect to `localhost:27017` automatically
2. Click Connect
3. Open the mongosh tab by clicking on `>_`
4. You are now in the shell (it defaults to the `test` database)

## MongoShell

By default mongosh will open with `test`

We can create and switch to a an new database with the `use` command:

```
use sparta
```

Once we run this command , the test> database indicator should change to sparta>. We can alsoi use the db command to show the active database.

```
db.createCollection("institute")
```

To insert data into our colllection

```
db.institute.insertOne({name: "New document"})
```

Add multiple documents in one command:

```
db.institute.insertMany([{course: "Data Engineering"}, {cousre: "Data Analysis"}])
```

How to view documents in a collection in mongosh:

```
db.institute.find()
```

## Example Task

Insert data about yourself to the institute collection.

Think about the fields you would want to include.

```
db.institute.insertOne({
  name: "Rory Swietlicki",
  course: "Data Engineering with AI",
  background: "Full-stack developer",
  location: "London",
})
```

## Validation

MongoDB allows you to enforce rules on documents in a collection using **schema validation**.

To set this up in Compass you can via the **Validation** tab on a collection (you can also use mongosh).

- **Action: Error** - MongoDB will reject any invalid documents
- **Level: Strict** - Validation applies to all inserts and updates

### Creating the Students Collection with Validation

```
{
  $jsonSchema: {
    bsonType: 'object',
    required: [
      'name',
      'age',
      'course'
    ],
    properties: {
      name: {
        bsonType: 'string'
      },
      age: {
        bsonType: 'int'
      },
      course: {
        bsonType: 'string'
      }
    }
  }
}
```

- `$jsonSchema` - the standard used to define the rules
- `bsonType: "object"` - every document must be an object
- `required` - fields that must be present on every document
- `properties` - defines the expected data type for each field

### Invalid Insert

Here I attempted to insert a document where `age` is a `str` instead of an `int`:

```
db.students.insertOne({
  name: "John Doe",
  age: "twenty",
  course: "Data Engineering"
})
```

**Output**: `MongoServerError: Document failed validation`

### Valid Insert

Inserting a document that meets all the validation rules:

```
db.students.insertOne({
  name: "John Doe",
  age: 22,
  course: "Data Engineering"
})
```

**Output**: `{ acknowledged: true, insertedId: ObjectId('6a1da35c9ebb8982e632d0a7') }`