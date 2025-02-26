SELECT TOP 5 * 
  FROM Employees -- 1

SELECT DISTINCT ProductName 
  FROM Products -- 2

SELECT * FROM Products 
  WHERE Price > 100 -- 3

SELECT CustomerName 
  FROM Customers 
  WHERE CustomerName 
  LIKE 'A%' -- 4

SELECT * 
  FROM Products 
  ORDER BY Price 
  ASC -- 5

SELECT * 
  FROM Employees 
  WHERE Salary >= 5000 
  AND Department = 'HR' -- 6

SELECT EmployeeID, ISNULL(Email, 'noemail@example.com') 
  AS Email 
  FROM Employees--7

SELECT * 
  FROM Products 
  WHERE Price 
  BETWEEN 50 AND 100--8

SELECT DISTINCT Category, ProductName 
  FROM Products--9

SELECT * 
  FROM Products 
  ORDER BY ProductName 
  DESC--10

SELECT TOP 10 * 
  FROM Products 
  ORDER BY Price 
  DESC--11

SELECT EmployeeID, COALESCE(FirstName, LastName) AS FullName FROM Employees--12

SELECT DISTINCT Category, Price FROM Products--13

SELECT * 
  FROM Employees 
  WHERE (Age BETWEEN 30 AND 40) OR Department = 'Marketing'--14

SELECT * 
  FROM Employees 
  ORDER BY Salary 
  DESC OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY--15

SELECT * 
  FROM Products 
  WHERE Price <= 1000 AND Stock > 50 ORDER BY Stock ASC--16

SELECT * 
  FROM Products 
  WHERE ProductName 
  LIKE '%e%'--17

SELECT * 
  FROM Employees 
  WHERE Department 
  IN ('HR', 'IT', 'Finance')--18

SELECT * 
  FROM Employees 
  WHERE Salary > ANY (SELECT AVG(Salary) FROM Employees)--19


SELECT * 
  FROM customers 
  ORDER BY city ASC, postalCode DESC--20

SELECT TOP 10 * 
  FROM products 
  ORDER BY salesAmount DESC--21

SELECT employeeID, COALESCE(firstName + ' ' + lastName, lastName) AS fullName FROM employees--22

SELECT DISTINCT category, productName, price FROM products WHERE price > 50--23

SELECT * 
  FROM products 
  WHERE Price BETWEEN (SELECT AVG(Price) * 0.9 FROM products) 
              AND (SELECT AVG(Price) * 1.1 FROM products)-- 24

SELECT * 
  FROM employees 
  WHERE age < 30 AND department IN ('HR', 'IT') --25

SELECT * 
  FROM customers 
  WHERE Email LIKE '%@gmail.com%' --26

SELECT * 
FROM employees 
WHERE salary > ALL (
    SELECT salary 
    FROM employees 
    WHERE department = 'Sales'
) -- 27

SELECT * 
FROM Employees 
ORDER BY salary DESC 
OFFSET 0 ROWS 
FETCH NEXT 10 ROWS ONLY -- 28

SELECT * FROM Orders WHERE orderDate BETWEEN CURRENT_DATE - INTERVAL '30' DAY AND CURRENT_DATE -- 29

SELECT * FROM employees
WHERE salary > ANY (SELECT AVG(salary) FROM employees WHERE department = E.department) --30
