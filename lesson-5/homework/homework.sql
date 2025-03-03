-- 1. Rename the ProductName column as Name
SELECT ProductName AS Name FROM Products;

-- 2. Rename the Customers table as Client
SELECT * FROM Customers AS Client;

-- 3. Use UNION to combine ProductName from Products and Products_Discontinued
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discontinued;

-- 4. Find the intersection of Products and Products_Discontinued
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discontinued;

-- 5. Use UNION ALL to combine Products and Orders (assuming same structure)
SELECT * FROM Products
UNION ALL
SELECT * FROM Orders;

-- 6. Select distinct CustomerName and their corresponding Country
SELECT DISTINCT CustomerName, Country FROM Customers;

-- 7. Use CASE to create a conditional column based on Price
SELECT ProductName,
       Price,
       CASE WHEN Price > 100 THEN 'High' ELSE 'Low' END AS PriceCategory
FROM Products;

-- 8. Filter Employees by Department and group them by Country
SELECT Country, Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Country, Department;

-- 9. Find the number of products in each Category
SELECT CategoryID, COUNT(ProductID) AS ProductCount
FROM Products
GROUP BY CategoryID;

-- 10. Use IIF to create a column showing Stock status
SELECT ProductName,
       Stock,
       IIF(Stock > 100, 'Yes', 'No') AS StockStatus
FROM Products;

-- 11. Join Orders and Customers using INNER JOIN and alias CustomerName as ClientName
SELECT O.OrderID, C.CustomerName AS ClientName
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID;

-- 12. Use UNION to combine ProductName from Products and OutOfStock tables
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM OutOfStock;

-- 13. Return the difference between Products and DiscontinuedProducts using EXCEPT
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM DiscontinuedProducts;

-- 14. Use CASE to assign 'Eligible' to customers who placed more than 5 orders
SELECT CustomerID,
       COUNT(OrderID) AS OrderCount,
       CASE WHEN COUNT(OrderID) > 5 THEN 'Eligible' ELSE 'Not Eligible' END AS Status
FROM Orders
GROUP BY CustomerID;

-- 15. Use IIF to categorize Price as 'Expensive' or 'Affordable'
SELECT ProductName,
       Price,
       IIF(Price > 100, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;

-- 16. Count the number of orders per CustomerID using GROUP BY
SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID;

-- 17. Find employees with Age < 25 or Salary > 6000
SELECT * FROM Employees
WHERE Age < 25 OR Salary > 6000;

-- 18. Find total sales per Region using GROUP BY
SELECT Region, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY Region;

-- 19. Use LEFT JOIN to combine Customers and Orders, alias OrderDate
SELECT C.CustomerName, O.OrderID, O.OrderDate AS Order_Date
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;

-- 20. Use IF to update salary based on department
IF EXISTS (SELECT * FROM Employees WHERE Department = 'HR')
BEGIN
    UPDATE Employees
    SET Salary = Salary * 1.1
    WHERE Department = 'HR';
END;
-- 21. Use UNION ALL to combine Sales and Returns, calculating total sales and returns per product
SELECT ProductID, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY ProductID
UNION ALL
SELECT ProductID, SUM(ReturnAmount) AS TotalReturns
FROM Returns
GROUP BY ProductID;

-- 22. Use INTERSECT to show products common between Products and DiscontinuedProducts
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM DiscontinuedProducts;

-- 23. Use CASE to assign sales tiers based on TotalSales
SELECT CustomerID,
       TotalSales,
       CASE 
           WHEN TotalSales > 10000 THEN 'Top Tier'
           WHEN TotalSales BETWEEN 5000 AND 10000 THEN 'Mid Tier'
           ELSE 'Low Tier' 
       END AS SalesTier
FROM Sales;

-- 24. Use IF and WHILE to update employee salaries based on criteria
DECLARE @EmployeeID INT = (SELECT MIN(EmployeeID) FROM Employees);
WHILE @EmployeeID IS NOT NULL
BEGIN
    IF (SELECT Salary FROM Employees WHERE EmployeeID = @EmployeeID) < 5000
    BEGIN
        UPDATE Employees SET Salary = Salary * 1.2 WHERE EmployeeID = @EmployeeID;
    END;
    SET @EmployeeID = (SELECT MIN(EmployeeID) FROM Employees WHERE EmployeeID > @EmployeeID);
END;

-- 25. Use EXCEPT to find customers who placed orders but are not in Invoices
SELECT CustomerID FROM Orders
EXCEPT
SELECT CustomerID FROM Invoices;

-- 26. Use GROUP BY on CustomerID, ProductID, and Region to calculate total sales
SELECT CustomerID, ProductID, Region, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID, ProductID, Region;

-- 27. Use CASE to apply discounts based on Quantity purchased
SELECT ProductID, Quantity,
       CASE
           WHEN Quantity >= 100 THEN 20
           WHEN Quantity BETWEEN 50 AND 99 THEN 10
           ELSE 0
       END AS Discount
FROM Orders;

-- 28. Use UNION and INNER JOIN to find all products in Products or DiscontinuedProducts and check stock
SELECT P.ProductID, P.ProductName, 'In Stock' AS Status
FROM Products P
UNION
SELECT D.ProductID, D.ProductName, 'Discontinued' AS Status
FROM DiscontinuedProducts D;

-- 29. Use IIF to create a StockStatus column
SELECT ProductID, ProductName,
       IIF(Stock > 0, 'Available', 'Out of Stock') AS StockStatus
FROM Products;

-- 30. Use EXCEPT to find customers in Customers but not in VIP_Customers
SELECT CustomerID FROM Customers
EXCEPT
SELECT CustomerID FROM VIP_Customers;
