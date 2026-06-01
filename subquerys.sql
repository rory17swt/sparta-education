-- Scalar --> single value as output
SELECT
    AVG(UnitPrice) AS AvarageUnitPrice
FROM Products;


-- Multi-row --> multiple rows as output
SELECT
    ProductID
FROM [Order Details]
WHERE Quantity > 10;


-- Correlated --> Runs once per row
SELECT *
FROM Products p
WHERE UnitPrice > (
  SELECT AVG(UnitPrice)
  FROM Products
  WHERE CategoryID = p.CategoryID
);


-- Customers with more than 5 orders
SELECT CustomerID
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 5;

SELECT *
FROM Customers
WHERE CustomerID 
    IN (
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    HAVING COUNT(*) > 5
);


-- Products above avg price
SELECT 
    ProductName,
     UnitPrice
FROM Products
WHERE UnitPrice > (
  SELECT 
    AVG(UnitPrice)
  FROM Products
);


-- Orders above average order value
SELECT OrderID, OrderTotal
FROM (
  SELECT 
    OrderID,
    SUM(Quantity * UnitPrice) AS OrderTotal
  FROM [Order Details]
  GROUP BY OrderID
) TempOrdersTable
WHERE OrderTotal > (
  SELECT 
    AVG(Quantity * UnitPrice)
  FROM [Order Details]
);



-- Products that have been ordered
SELECT ProductName
FROM Products
WHERE ProductID IN (
  SELECT ProductID
  FROM [Order Details]
);


-- Products that have never been ordered
SELECT ProductName
FROM Products
WHERE ProductID NOT IN (
  SELECT ProductID
  FROM [Order Details]
);



-- Customers that have spent above avg
SELECT c.CompanyName
FROM Customers c
WHERE c.CustomerID IN (
  SELECT o.CustomerID
  FROM Orders o
  JOIN [Order Details] od
    ON o.OrderID = od.OrderID
  GROUP BY o.CustomerID
  HAVING SUM(od.Quantity * od.UnitPrice) > (
    SELECT AVG(OrderTotal)
    FROM (
      SELECT 
        OrderID,
        SUM(Quantity * UnitPrice) AS OrderTotal
      FROM [Order Details]
      GROUP BY OrderID
    ) t
  )
);



-- Products that are above avg price for their category
-- Example correlated subquery
SELECT ProductName, UnitPrice, CategoryID
FROM Products p
WHERE UnitPrice > (
  SELECT AVG(UnitPrice)
  FROM Products
  WHERE CategoryID = p.CategoryID
);