select * from customers where ContactTitle like 'sales%' and country in ('germany','france');
select * from customers where ContactTitle NOT LIKE 'Sales%' and country NOT IN ('Germany', 'France');
select lastname, title, TitleOfCourtesy from Employees where (TitleOfCourtesy IN ('Ms.', 'Mrs.') and Title = 'sales representative') or (TitleOfCourtesy IN ('Dr.', 'Mr.') and Title= 'sales manager');
select CompanyName, ContactName from Customers where ContactName LIKE 'a%' or ContactName LIKE '%a';
select CompanyName from Customers where fax IS NULL;
select * from Products where ProductName IN ('chai', 'tofu', 'konbu') order by ProductName desc;
select * from orders where ShippedDate BETWEEN '1995/09/08' AND '1995/10/09';
select ProductName, QuantityPerUnit, UnitsInStock from products where (QuantityPerUnit LIKE '10 %' or QuantityPerUnit LIKE '32 %') and UnitsInStock > 10; // WATCH OUT DOING 10% because 100 will also appear.