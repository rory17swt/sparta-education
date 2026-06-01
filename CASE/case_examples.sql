-- Simple case statement use
SELECT 
  ProductName,
  UnitPrice,
  CASE 
    WHEN UnitPrice > 20 THEN 'Expensive'
    WHEN UnitPrice > 10 THEN 'Mid-raange'
    ELSE 'Affordable'
  END AS PriceCategory
FROM Products;


-- Example syntax:
CASE
  WHEN condition THEN result
  WHEN condition THEN result
  ELSE result
END

CASE 
  WHEN Quantity > 10 THEN 'Large'
  WHEN Quantity > 5 THEN 'Medium'
  ELSE 'Small'
END

SELECT 
  ProductName,
  CASE WHEN UnitPrice > 20 THEN 'High' ELSE 'Low' END AS PriceBand
FROM Products;

ORDER BY 
  CASE WHEN UnitPrice > 20 THEN 1 ELSE 2 END;

 GROUP BY 
 CASE WHEN UnitPrice > 20 THEN 'High' ELSE 'Low' END;


 -- Price Catgegories
 SELECT 
    ProductName,
    UnitPrice,
    CASE
        WHEN UnitPrice < 10 THEN 'Cheap'
        WHEN UnitPrice BETWEEN 10 AND 20 THEN 'Mid-range'
        ELSE 'Expensive'
    END AS PriceCategory
FROM Products;


-- Order Size
SELECT
    OrderID,
    Quantity,
    CASE
        WHEN Quantity >= 10 THEN 'Large'
        ELSE 'Small'
    END AS OrderSize
FROM [Order Details];


-- Customer type based on spend
SELECT 
  c.CompanyName,
  SUM(od.Quantity * od.UnitPrice) AS TotalSpend,
  CASE 
    WHEN SUM(od.Quantity * od.UnitPrice) > 1000 THEN 'High Value'
    ELSE 'Standard'
  END AS CustomerType
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName;

-- Expesnsive products --> conditional aggregation, e.g. sum when this is true
SELECT
    c.CategoryName,
    SUM(CASE WHEN p.UnitPrice > 10 THEN 1 ELSE 0 END) AS ExpensiveProducts
FROM Categories c  
INNER JOIN Products p  
    ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;