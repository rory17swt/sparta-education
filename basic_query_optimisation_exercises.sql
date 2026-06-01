-- 1. Basic Filter

-- SELECT *
-- FROM Orders
-- WHERE CustomerID = 'ALFKI';

-- Solution hint - add index and remove wildcard:
CREATE INDEX idx_orders_customerid 
ON Orders(CustomerID);

SELECT CustomerID, OrderID, OrderDate
FROM Orders
WHERE CustomerID = 'ALFKI';


-- 2. Function Issue
-- SELECT *
-- FROM Orders
-- WHERE YEAR(OrderDate) = 1997;

-- Solution hint - Tighten the filter
CREATE INDEX idx_orders_OrderID_OrderDate
ON Orders(OrderID, OrderDate);

SELECT 
    OrderID,
    OrderDate
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31';

-- BETWEEN is faster than YEAR() becuase a function like YEAR() can't use an index


-- 3. Sorting Bottleneck
-- SELECT *
-- FROM Orders
-- WHERE CustomerID = 'ALFKI'
-- ORDER BY OrderDate;

-- Solution hint - Create an Index to avoid table scan:
CREATE INDEX idx_Orders_CustomerID_OrderDate
ON Orders(CustomerID, OrderDate);

SELECT 
    CustomerID,
    OrderDate 
FROM Orders
WHERE CustomerID = 'ALFKI'
ORDER BY OrderDate;


-- 4. JOIN Performance
-- SELECT *
-- FROM Orders o
-- JOIN Customers c
-- ON o.CustomerID = c.CustomerID;

-- Solution hint - Make Indexes to help with Index Seek
CREATE INDEX idx_Orders_CustomerID
ON Orders(CustomerID);

SELECT 
    o.ShipCity,
    o.CustomerID,
    c.CompanyName
FROM Orders o   
INNER JOIN Customers c   
    ON o.CustomerID = c.CustomerID;


-- 5. Covering Index:
-- SELECT CustomerID, OrderDate
-- FROM Orders
-- WHERE CustomerID = 'ALFKI';

-- Solution hint - Avoid Key Lookups, create a covering index, using the INCLUDE key ord
CREATE INDEX idx_Orders_CustomerID_OrderDate
ON Orders(CustomerID)
INCLUDE (OrderDate);

SELECT 
    CustomerID,
    OrderDate
FROM Orders
WHERE CustomerID = 'ALFKI';



-- 6. Aggregation
-- SELECT CustomerID, COUNT(*)
-- FROM Orders
-- GROUP BY CustomerID;

-- Solution hint - Create Index to remove need for GROUP BY in SELECT statement:
CREATE INDEX idx_Orders_CustomerID
ON Orders(CustomerID);

SELECT 
    CustomerID,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY CustomerID;



-- 7. Broken Search Pattern
-- SELECT *
-- FROM Customers
-- WHERE CompanyName LIKE '%market%';

-- Solution hint - Remove wildcard as it prevents Index use
CREATE INDEX idx_Customer_CompanyName
ON Customers(CompanyName);

SELECT
    CompanyName
FROM Customers
WHERE CompanyName LIKE '%market%';