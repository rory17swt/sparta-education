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