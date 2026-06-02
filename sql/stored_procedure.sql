-- Syntax
CREATE PROCEDURE GetAllProducts
AS
BEGIN
SELECT * FROM Products; --SQL
END

EXEC GetAllProducts;

-- Delete procedure
DROP PROCEDURE GetAllProducts;


-- Paramaters
CREATE PROCEDURE GetOrdersByCustomer
  @CustomerID NVARCHAR(5)
AS
BEGIN
  SELECT * FROM Orders WHERE CustomerID = @CustomerID;
END;

EXEC GetOrdersByCustomer @CustomerID = 'ALFKI';


-- Get orders above a certain value
CREATE PROCEDURE GetOrdersAboveValue
  @MinValue DECIMAL(10,2)
AS
BEGIN
  SELECT 
    o.OrderID,
    SUM(od.Quantity * od.UnitPrice) AS Total
  FROM Orders o
  JOIN [Order Details] od
    ON o.OrderID = od.OrderID
  GROUP BY o.OrderID
  HAVING SUM(od.Quantity * od.UnitPrice) > @MinValue;
END;

EXEC GetOrdersAboveValue @MinValue = 13.00


-- Get individual customer spend
CREATE PROCEDURE GetCustomerSpend
  @CustomerID NVARCHAR(5)
AS
BEGIN
  SELECT 
    c.CompanyName,
    SUM(od.Quantity * od.UnitPrice) AS TotalSpend
  FROM Customers c
  JOIN Orders o
    ON c.CustomerID = o.CustomerID
  JOIN [Order Details] od
    ON o.OrderID = od.OrderID
  WHERE c.CustomerID = @CustomerID
  GROUP BY c.CompanyName;
END;

EXEC GetCustomerSpend @CustomerID = 'ALFKI'


