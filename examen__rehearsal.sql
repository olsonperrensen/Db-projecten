select distinct unitprice from [order details] where productid in (select productid from products where productname = 'Chai');
select lastname, firstname  from employees where TitleOfCourtesy = 'Mr.';
select * from Orders where OrderDate > '2016-07-10';
select companyname from customers where city IN ('Paris') order by 1 asc;
select lastname, title, hiredate from employees where year(hiredate) >= 2014;
select * from [order details] where orderID IN (select orderID from orders where OrderDate IN ('2016-10-04'));
select lastname, firstname, region from employees where region IS NULL;
select * from customers where postalcode like 'W%';
select CompanyName, [address], postalcode, country from customers where postalcode like '_A%' or PostalCode like '_X%' order by 4, 3;
select companyname from suppliers where fax is null order by 1 desc;
select companyname from suppliers where fax is not null order by 1 desc;
E030
----
select * from customers where ContactTitle like 'Sales%' and country in ('Germany','France');
select * from customers where ContactTitle not like 'Sales%' and country not in ('Germany','France');
select lastname, title, titleofcourtesy from employees where (title = 'Sales Representative' AND TitleOfCourtesy in('Mrs.','Ms.')) 
or (title = 'Sales Manager' and TitleOfCourtesy IN ('Dr.','Mr.'));
select companyname, contactname from customers where contactname like '%A' or contactname like 'A%';
select * from customers where fax is null or phone is null;
select * from products where productname in('tofu','konbu','chai') order by productname desc;
select * from orders where ShippedDate between '2016-09-08' and '2016-10-09';
select ProductName, QuantityPerUnit, UnitsInStock from products where UnitsInStock > 10 and (QuantityPerUnit like '32 %' or quantityperunit like '10 %');
E040
----
select count(*) from customers;
select count(*) from customers where country IN('Germany');
select sum(UnitsOnOrder) from products;
select avg(CurrentUnitCost) from products where UnitsOnOrder = 0;
select round(sum((UnitPrice*Quantity)-Discount),0) from [Order Details];
select orderid, unitprice, quantity, (unitprice*Quantity)turnover from [Order Details];
select lastname, firstname, (year(hiredate)-year(BirthDate))AgeHired from Employees;
select productname, currentunitprice, (currentunitprice * 1.02) newprice from products;
select productname, currentunitprice, round((currentunitprice * 1.02),2)newprice from products;
select productname, currentunitprice, round((currentunitprice * 1.02),0) newprice from products where (currentunitprice * 1.02) > 60;
select count(region) from employees;
select upper(concat(left(lastname,2),left(firstname,1)))alias from employees;
E050
----
select title, min(HireDate) from employees group by title order by 2 asc;
select productID, avg(UnitPrice), avg(Quantity) from [Order Details] group by productID;
select country, count(*) from suppliers group by country having country in('USA','Japan') order by 2 desc;
select city, count(*) from employees group by city having count(*) > 1 order by 2 desc;
select categoryID, max(CurrentUnitPrice), min(CurrentUnitPrice) from products group by categoryID;
select categoryID, avg(unitsinstock) from products where CurrentUnitPrice > 10 group by categoryID having avg(unitsinstock) > 40;
select customerID, count(*) from orders group by customerID having count(*) >= 10 order by 2 desc;
select top 3 customerID, count(*) from orders group by customerID having count(*) >= 10 order by 2 desc;
select orderdate, count(*) from orders where datepart(yy,OrderDate) = '2016' group by orderdate having count(*) > 1 order by 2 desc;
select top 1 DATENAME(mm,orderdate), count(*) from orders where datepart(yy,OrderDate) = '2018' group by DATENAME(mm,orderdate) order by 2 desc;
E060
----
select * into tmpProducts from products;
select * into Orders2 from Orders;
delete from orders2 where shipcountry IN ('Belgium');
select productname, currentunitprice into foodstuffs from products where CategoryID IN (select categoryID from Categories where CategoryName IN('seafood','beverages'));
insert into foodstuffs(productname, currentunitprice) select productname, currentunitprice from products where CategoryID IN (select CategoryID from Categories where CategoryName IN('Condiments'));
update orders2 set shippeddate = dateadd(dd,10,shippeddate) where (orderdate >= '2017-08-01' and orderdate <= '2017-08-31');
select * into tmpe from employees;
alter table tmpe add salary int;
update tmpe set salary = 60000;
update tmpe set salary = salary * 1.2 where title in('sales manager');
update tmpe set salary = salary * 0.1 where lastname in('Dodsworth');
insert into foodstuffs(productname, currentunitprice) values('meatballs',12);
insert into orders2(customerID, employeeID, orderdate, shippeddate) values ('ANATR',3,'2018-10-30','2018-11-30');
update products2 set currentunitprice = currentunitprice * 1.10;
E070
----
select productID, productname from products where supplierID in (select supplierid from suppliers where companyname in('Pavlova, Ltd.'));
select sum(Quantity) from [Order Details] where productID IN(select productid from products where productname IN('Tofu'));
select count(*) from orders where employeeID IN (select employeeID from Employees where lastname in('king')) and (OrderDate >= '2017-05-01' and OrderDate <= '2017-05-31');
select productID, productname, UnitsOnOrder from products where categoryID in ( select categoryID from Categories where categoryName IN('Confections')) and UnitsOnOrder > 0;
select productname from products where CurrentUnitPrice IN (select currentunitprice from products where productname IN('Chang')) and productname != 'Chang';
select productname from products where currentunitprice > (select currentunitprice from products where productname IN('Tofu'));
select companyname from customers where customerID IN( select customerID from orders group by customerID having count(customerID) > 15);
select lastname from employees where hiredate IN(select max(hiredate) from employees);
select * from products where productID NOT IN(select productID from [Order Details] where [Order Details].productID = products.ProductID);
select city, CompanyName from customers where city in (select top 1 city from customers group by city having count(city) > 1 order by count(city) desc);
select productname from products where CurrentUnitPrice IN(select max(currentunitprice) from products);
select productname from products where productID IN(select productID from [Order Details]  group by productID having count(productID) > 50);
select companyname from customers where customerID not in( select customerid from orders where orders.customerid = Customers.CustomerID);