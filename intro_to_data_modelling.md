# Intro to Data Modelling

## Data Modelling

When we need to store data we need to think about the different options and how we are going to plan out this storage.

Assuming we need a relational database, the main thing we need to think about is out tables and the relationships between them.

## The scenario

Our scenario will be:

- We run an online shop
- We have customers, orders and products
- Orders can contain multiple products

The question is: "How should we store this data in a table or tables?"

## Core data modelling concepts

Entities = essentaily "things"

In our case thats:
- Customers
- Orders
- Products
- Etc.

Relationships = Links betweenEntities

- Customers to Orders (1-to-many)
- Orders to pruducts (many-to-many)

Kets = Anchor points for realtioships between tables

- Primary Key = Unique Identifier (Usually an ID or Numeric Value)
- Foreing Key = Column from another table, is the link/relationship between the two tables. Links two tables together.

## Building a model example

Step 1 - Customers Table

| CustomerID (PK) | Name | Email |

Step 2 - Orders

| OrderID (PK)  CustomerID (FK) | OrderDtae |

Step 3 - Products

| ProductID (PK) | ProductsName | Price |

## Bridge Tables

We need a bridge table that will have our many-to-amnay relationships, We will call it "OrderDetails".

! OrderID (FK) | ProductsID (FK) | Quantity |

## Final Schema example

- Customers
- Orders
- OrderDetails
- Products

## SQL Example

If we made a blank DB with this schema, an esample JOIN would be:

```sql
SELECT *
FROM Orders o  
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProdductID = p.ProductID;
```

## Practical Normalisation

Rule 1 - No repeating columns

Bad:
```
Product1, Product2, Product
```

Good:
```
Products
```

Rule 2 - Each table shuld contain a single "Entity" or "thing"

Rule 3 - No duplicated data

e.g CustomerName is not repeated on every order