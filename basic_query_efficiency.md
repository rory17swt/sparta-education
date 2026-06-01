# Basic SQL Quesry Performance

## Aims

- Write mmore efficient quesries
- Implement good JOIN stratagy
- Use indexes when possible

## What make a quesry slow?

- Reapeated lookups
- Too mush data scanned
- poor JOINS
- Not using a limit when applicable
- Not using filtering when applicable
    - Bad filtering logic can be a bad thing
- Be careful with use of sub-quiries
- Not implementing DRY
- Not defining indexes
    - Particulaly on commonly used/accessed tables

An easy/simple way to think of it is it:

"More rows touched, more work for SQL to do".

## Super common query performance problems

1. Basic SELECT

Bad:
```sql
SELECT *
FROM Orders;
```

Better:
```sql
SELECT OrderID, CustomerID, OrderDate
FROM Orders;
```

2. Using `WHERE`

Bad:
```sql
SELECT OrderID, CustomerID, OrderDate
FROM Orders;
```

Better:
```sql
SELECT OrderID, CustomerID, OrderDate
FROM Orders;
WHERE OrderDate >= '1997-01-01'
AND OrderDate < '1998-01-01';
```

3. Unnecessary `DISTINCT`

Bad:
```sql
SELECT DISTINCT CustomerID
FROM Orders;
```