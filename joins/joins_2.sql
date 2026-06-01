-- 1. Find products that have never been sold.

SELECT * 
FROM Products p
LEFT JOIN [Order Details] od
    ON p.ProductID = od.ProductID
WHERE od.Quantity IS NULL


-- 2. Create a table showing:
-- OrderID
-- Customer Name
-- Product Name
-- Quantity
-- Unit Price
-- Any other columns you want to include

SELECT * FROM [Order Details]
SELECT * FROM orders
SELECT * FROM Customers
SELECT * FROM Products


SELECT 
    od.OrderID, 
    c.ContactName,
    p.ProductName,
    od.Quantity,
    od.UnitPrice
FROM [Order Details] od
INNER JOIN Orders o  
    ON od.OrderID = o.OrderID
INNER JOIN Customers c  
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p  
    ON p.ProductID = od.ProductID


-- 3. Advanced — Average Order Value per Customer
-- For each customer, show:
-- Number of orders
-- Total spend
-- Average order value
-- Employees with No Orders
-- Same pattern as customers with no orders

SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Employees

SELECT SUM(od.UnitPrice * od.Quantity) AS TotalSpend,
    SUM(od.UnitPrice * od.Quantity) / COUNT(o.OrderID) AS AvgOrderValue,
    C.CompanyName
FROM Customers c
INNER JOIN Orders o
    ON o.CustomerID = c.CustomerID
INNER JOIN [Order Details] od  
    ON od.OrderID = o.OrderID
GROUP BY c.CompanyName;


-- 4. Most Popular Product
-- Which product has been ordered the most (by quantity)?

SELECT * FROM [Order Details]
SELECT * FROM Products

SELECT TOP 1
    SUM(od.Quantity) AS TotalQuantity,
    p.ProductName
FROM [Order Details] od  
INNER JOIN Products p  
    ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantity DESC