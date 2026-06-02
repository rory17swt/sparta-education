-- 1. Create your first index for the northwind database (Orders table, CustomerID)
CREATE INDEX idx_orders_customerid 
ON Orders(CustomerID);

SELECT *
FROM Orders
WHERE CustomerID = 'ALFKI';


-- 3. Create a second Index (Orders table, CustomerID and OrderDate)
CREATE INDEX idx_orders_customerid_orderdate
ON Orders(CustomerID, OrderDate)

SELECT *
FROM Orders
WHERE CustomerID = 'ALFKI'
ORDER BY OrderDate


-- 4. Find out to run a cache wipe
CHECKPOINT;
DBCC DROPCLEANBUFFERS;
DBCC FREEPROCCACHE;
-- Mainly for testing index performance.
-- If SQL Server has already cached your query results, it'll 
-- return them fast regardless of whether your index is helping. 
-- Wiping the cache forces a fresh run so you can accurately measure the difference an index makes.


-- 6. Research [Table Scan] vs [Index Seek]
-- Table Scan:
-- A table scan touches every row in the table whether or not it qualifies.
-- The cost is proportional to the total number of rows in the table. 
-- Think of it like reading every page of a book to find one word — it works, but it's slow on large tables.

-- Index Seek:
-- SQL Server jumps directly to the exact rows it needs using the index.
-- It happens when your query filter is fully supported by the index
-- Think of it like using the index at the back of a book — jumps straight to the right page.


-- 7. Why does order of your query matter, especially with indexing.
-- How you write your WHERE clause:
-- ❌ Can't use index
WHERE YEAR(OrderDate) = 1996

-- ✅ Can use index
WHERE OrderDate >= '1996-01-01' AND OrderDate < '1997-01-01'

-- Column order in composite indexes:
-- For the index (CustomerID, OrderDate) — SQL uses the first column to seek, 
-- then narrows by the second. If your query filters by CustomerID first, the index works perfectly.
-- If the index was (OrderDate, CustomerID) but your query filters by CustomerID — SQL can't use it efficiently.
