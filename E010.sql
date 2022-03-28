SELECT * FROM PRODUCTS;
SELECT * FROM CUSTOMERS;
SELECT CompanyName, ContactName, Country FROM Customers;
SELECT * FROM Shippers ORDER BY CompanyName;
SELECT CompanyName, Country, City FROM Customers ORDER BY Country, City;
SELECT * FROM Categories LIMIT 3; / SELECT TOP 3 * FROM Categories;
SELECT DISTINCT Country FROM Suppliers;
SELECT DISTINCT Country, ContactTitle FROM Suppliers;
SELECT DISTINCT OrderDate from Orders;
SELECT FirstName, LastName FROM Employees ORDER BY Country DESC, City ASC;