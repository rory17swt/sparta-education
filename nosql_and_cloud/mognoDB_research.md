# MongoDB & Compass Research

## Types of NoSQL Databases

- **Document** - stores data as JSON-like documents (e.g.MongoDB)
- **Key-Value** - stores data as simple key/value pairs (e.g.Redis)
- **Column-Family** - stores data in columns rather than rows (e.g.Cassandra)
- **Graph** - stores data as nodes and relationships (e.g.Neo4j)

## What Type of Database is MongoDB

MongoDB is a **document database**. Instead of storing data in tables and rows like SQL, it stores data as docuemtns in a JSON-like-format called BSON (Binary JSON).

## How does MongoDB Work

- Data is organised into **databases**, which contain **collections** (equivalent to table in SQL)
- Each collection contains **documents** (equivalent to rows in SQL)
- Documents are flexible, they don't need to follow a fixed schema, meaning each document in a collection can have different fields
- Queries are written in MongoDB's own syntax rather than SQL

**SQL vs MongoDB comparison:**
```
SQL:      Database → Tables  → Rows
MongoDB:  Database → Collections → Documents
```

## Why is MongoDB So Popular

- **Schema flexibility**: no need to define a rigid structure upfront, great for evolving data
- **Scalability**: designed to scale horizontally across many servers
- **Dev freindly**: documents map naturally to objects in JS and python
- **Speed**: fast reads and writes for large volumes of unstructured data
- **Wide adoption**: large community, lots of support and documentation

## Use Cases

- Real-time applications (chat apps, live feeds)
- CMS's
- User profiles and personalisation
- Product catalogues (e.g.e-commerce)
- Mobile app backends

# MognoDB Compass

## What is MongoDB Compass

MongoDB Compass is the offical GUI for MongoDB. It alows you to:

- Visually browse databases and collections
- Write and run queries wihtout code
- Insert, update and delete documents
- Analyse data and indexes

## Replica Sets

A replica set is a group of MongoDB servers tht all hold copies of the same data. If the primary server goes down, one of the others automatically takes over, ensuring no data loss and no downtime.

## Sharding

Sharding is how MongoDB handles very large datasets by splitting data across multiple servers (shards). Each shard holds a portion of the data, allowing the database to sclae horizontally and handle more traffic than a single server could manage.