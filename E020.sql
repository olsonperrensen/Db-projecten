SELECT DISTINCT UnitPrice FROM `order details` WHERE ProductID = '1';
SELECT LastName AS 'ln', FirstName AS 'fn' FROM Employees WHERE TitleOfCourtesy LIKE 'Mr.';
SELECT * FROM Orders WHERE OrderDate > '2016-07-10';
SELECT * FROM Orders WHERE OrderDate > '2016-07-10' ORDER BY CustomerID;
SELECT CompanyName from Customers WHERE City = 'Paris' ORDER BY CompanyName ASC;
SELECT lastname, TitleofCourtesy AS 'Title', hiredate FROM Employees WHERE HireDate > '2014-01-14'
SELECT * FROM `order details` INNER JOIN orders ON (`order details`.OrderID, orders.OrderID) WHERE `order details`.OrderID = 11074;
SELECT LastName, FirstName FROM Employees WHERE region IS NULL;
SELECT CompanyName, Address, PostalCode, Country FROM Customers where PostalCode LIKE 'W%';
SELECT CompanyName, Address, PostalCode, Country FROM Customers where PostalCode LIKE '_A%' OR PostalCode LIKE '_X%' SORT BY Country, PostalCode;
SELECT CompanyName FROM Suppliers WHERE Fax IS NULL ORDER BY CompanyName DESC;
SELECT CompanyName FROM Suppliers WHERE Fax IS NOT NULL ORDER BY CompanyName DESC;