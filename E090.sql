select companyname, contactname, contacttitle, 'customer ' as type_of_contract, phone, fax from customers 
union 
select companyname, contactname, contacttitle, 'supplier', phone, fax from Suppliers;

select country,region from customers 
where region is not null 
intersect 
select country, region from suppliers;

select productname, UnitsInStock  
from products 
union 
select 'zz TOTAL', sum(UnitsInStock) 
from products;

select country, region 
from suppliers 
where region is not null 
except 
select country, region 
from customers;

select concat(firstname, ' ',lastname) as 'Naam', orderdate, city, 'E' as 'type' 
from employees join orders on Employees.EmployeeID = orders.EmployeeID 
union 
select companyname, orderdate, city, 'C' 
from customers join orders on customers.CustomerID = orders.CustomerID 
order by 3;

select companyname, productname, categoryname 
from suppliers join products on suppliers.SupplierID = products.SupplierID 
join categories on products.CategoryID = Categories.CategoryID 
where Categories.CategoryID < 3 
order by 1;

select companyname 
from suppliers join products on suppliers.SupplierID = products.SupplierID 
join categories on products.CategoryID = Categories.CategoryID 
where products.CategoryID = 1 
intersect 
select companyname 
from suppliers join products on suppliers.SupplierID = products.SupplierID 
join categories on products.CategoryID = Categories.CategoryID 
where products.CategoryID = 2;

select companyname 
from suppliers join products on suppliers.SupplierID = products.SupplierID 
join categories on products.CategoryID = Categories.CategoryID 
where products.CategoryID = 1 
except 
select companyname 
from suppliers join products on suppliers.SupplierID = products.SupplierID 
join categories on products.CategoryID = Categories.CategoryID 
where products.CategoryID = 2;

select distinct lastname 
from employees join orders on orders.EmployeeID = Employees.EmployeeID 
join [order details] on [Order Details].OrderID = orders.OrderID 
where [Order Details].ProductID in ( 
select productID from Products where ProductName IN('Chai') 
) 
intersect 
select distinct lastname 
from employees join orders on orders.EmployeeID = Employees.EmployeeID 
join [order details] on [Order Details].OrderID = orders.OrderID 
where orders.ShipCity IN('Charleroi');

select 'Customers' as 'Groep', count(*) as 'Aantal' from customers 
union 
select 'Employees', count(*) from employees 
union 
select 'Product', count(*) from products;