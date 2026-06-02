

-- 1. Orders per customer
SELECT * FROM Orders
SELECT * FROM Customers

SELECT 
  CustomerID,
  COUNT(*) AS NumberOfOrders
FROM Orders
GROUP BY CustomerID
ORDER BY NumberOfOrders DESC;


-- 2. Total Revenue (whole database)
SELECT * FROM [Order Details]

SELECT 
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM [Order Details];


-- 3. Revenue per order
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT 
    o.OrderID,
    SUM(od.Quantity * od.UnitPrice) AS OrderRevenue
FROM Orders o
INNER JOIN [Order Details] od  
    ON o.OrderID = od.OrderID
GROUP BY o.OrderID
ORDER BY OrderRevenue DESC;


-- 4. Revenue per customer
SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM [Order Details]

SELECT 
    c.CompanyName,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Customers c
INNER JOIN Orders o  
    ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] od  
    ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
ORDER BY TotalRevenue DESC;


-- 5. Count total number of products
SELECT * FROM Products

SELECT 
    COUNT(*) AS TotalProducts
FROM Products;


-- 6. Find the most expensive product
SELECT * FROM Products

SELECT TOP 1
    ProductName,
    UnitPrice
FROM Products
ORDER BY UnitPrice DESC;


-- 7. Total quantity sold per product
SELECT * FROM [Order Details]
SELECT * FROM Products

SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM Products p
INNER JOIN [Order Details] od 
    ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC;


-- 8. Customers who made more than 5 orders
SELECT * FROM Customers
SELECT * FROM Orders

SELECT 
    c.CompanyName, 
    COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
HAVING COUNT(o.OrderID) > 5
ORDER BY NumberOfOrders DESC;


-- 9. Top 3 orders by total value
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT TOP 3
    o.OrderID, 
    SUM(od.Quantity * od.UnitPrice) AS TotalValue
FROM Orders o
INNER JOIN [Order Details] od 
    ON o.OrderID = od.OrderID
GROUP BY o.OrderID
ORDER BY TotalValue DESC;