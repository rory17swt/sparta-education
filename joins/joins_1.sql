SELECT *
FROM Customers
INNER JOIN Orders 
    ON Customers.CustomerID = Orders.CustomerID;


SELECT ProductName, Quantity
FROM Orders
INNER JOIN [Order Details]
    ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products
    ON [Order Details].ProductID = Products.ProductID;


SELECT Orders.OrderID, SUM([Order Details].UnitPrice * [Order Details].Quantity) AS TotalValue
FROM Orders
INNER JOIN [Order Details]
    ON Orders.OrderID = [Order Details].OrderID
GROUP BY Orders.OrderID;


SELECT 
    Customers.CompanyName,
    SUM([Order Details].UnitPrice * [Order Details].Quantity) AS TotalSpend,
    COUNT(Orders.OrderID) AS NumberOfOrders
FROM Customers
INNER JOIN Orders 
    ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details]
    ON Orders.OrderID = [Order Details].OrderID
GROUP BY Customers.CompanyName;


SELECT TOP 5 CustomerID, 
    SUM(UnitPrice * Quantity) AS TotalSpend 
FROM [Order Details] 
JOIN Orders 
    ON [Order Details].OrderID = Orders.OrderID 
GROUP BY CustomerID
ORDER BY TotalSpend DESC;


SELECT
    c.CustomerID,
    c.CompanyName,
    o.OrderID
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


SELECT 
  o.OrderID,
  c.CompanyName,
  e.FirstName + ' ' + e.LastName AS EmployeeName
FROM Orders o
INNER JOIN Customers c
  ON o.CustomerID = c.CustomerID
INNER JOIN Employees e
  ON o.EmployeeID = e.EmployeeID;


SELECT
    o.OrderID,
    s.CompanyName AS Shipper
FROM Orders o 
INNER JOIN Shippers s  
    ON o.ShipVia = s.ShipperID


SELECT 
  cat.CategoryName,
  SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM Categories cat
INNER JOIN Products p
  ON cat.CategoryID = p.CategoryID
INNER JOIN [Order Details] od
  ON p.ProductID = od.ProductID
GROUP BY cat.CategoryName;


SELECT 
  o.OrderID,
  c.CompanyName,
  p.ProductName,
  od.Quantity,
  od.UnitPrice
FROM Orders o
INNER JOIN Customers c
  ON o.CustomerID = c.CustomerID
INNER JOIN [Order Details] od
  ON o.OrderID = od.OrderID
INNER JOIN Products p
  ON od.ProductID = p.ProductID;