
-- 1. Create a Query that uses CASE to sort Orders into "revenue buckets of "Low", "Medium" and "High"
SELECT * FROM Orders
SELECT * FROM [Order Details]

SELECT
    o.OrderID,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue,
    CASE
        WHEN SUM(od.Quantity * od.UnitPrice) < 500 THEN 'Low'
        WHEN SUM(od.Quantity * od.UnitPrice) BETWEEN 500 AND 2000 THEN 'Medium'
        ELSE 'High'
    END AS RevenueBucket
FROM Orders o  
INNER JOIN [Order Details] od  
    ON o.OrderID = od.OrderID
GROUP BY o.OrderID
ORDER BY TotalRevenue DESC;


-- 2. Output ProductName, UnitsInStock and a custom column called "Stock Status" that reflects the level of stock of that item
SELECT * FROM Products

SELECT
    ProductName,
    UnitsInStock,
    CASE 
        WHEN UnitsInStock < 10 THEN 'Low'
        WHEN UnitsInStock BETWEEN 10 AND 25 THEN 'Medium'
        ELSE 'High'
    END AS StockStatus
FROM Products
ORDER BY UnitsInStock;


-- 3. Product Price Categories (CASE + Aggregation)
-- Count how many products fall into each price category:
-- Cheap (< 10)
-- Mid (10–20)
-- Expensive (> 20)
SELECT * FROM Products

SELECT
    COUNT(CASE WHEN UnitPrice < 10 THEN 1 END) AS Cheap,
    COUNT(CASE WHEN UnitPrice BETWEEN 10 AND 20 THEN 1 END) AS Mid,
    COUNT(CASE WHEN UnitPrice > 20 THEN 1 END) AS Exspensive
FROM Products;


-- 4. Customer Order Count with Labels (CASE + GROUP BY)
-- Show each customer and label them:
-- “Frequent” (> 10 orders)
-- “Occasional” (≤ 10)
SELECT * FROM Customers
SELECT * FROM Orders

SELECT
    c.CompanyName,
    CASE  
        WHEN COUNT(o.OrderID) > 10 THEN 'Frequent'
        ELSE 'Occasional'
    END AS CustomerLabel
FROM Customers c  
INNER JOIN Orders o  
    ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName;


-- 5. Product Sales Buckets (CASE + Aggregation + JOIN)
-- For each product, calculate total quantity sold and categorise:
-- Low (< 50)
-- Medium (50–200)
-- High (> 200)
SELECT * FROM [Order Details]
SELECT * FROM Products

SELECT
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantity,
    CASE 
        WHEN SUM(od.Quantity) < 50 THEN 'Low'
        WHEN SUM(od.Quantity) BETWEEN 50 AND 200 THEN 'Medium'
        ELSE 'High'
    END AS TotalQuantitySold
FROM Products p  
INNER JOIN [Order Details] od  
    ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantity;