create temporary table tmpProducts select * from Products;
create table Orders2 select * from Orders;
delete from Orders2 where ShipCountry = 'Belgium';
create TEMPORARY table Foodstuffs select ProductName, UnitPrice from Products  where categoryID IN (8,1);
insert into foodstuffs (ProductName, UnitPrice) select ProductName, UnitPrice from products where categoryid = 2;
update tmp_O set ShippedDate = date_add(ShippedDate, interval 51 year) where ShippedDate between '1995-01-01' and '1995-12-31';
create TEMPORARY table tmp_E select * from Employees;
ALTER table tmp_E ADD salary int;
update tmp_E set salary = 60.000;
update tmp_E set salary = salary * 1.2 where title = 'Sales Manager';
update tmp_E set salary = salary * 0.10 where LastName = 'Dodsworth' AND firstname = 'Anne';
insert into foodstuffs(productname, unitprice) values ('meatballs','12');
insert into orders2(customerID, employeeID,orderdate,shippeddate) values ('ANATR','3','2018-10-30','2018-11-30');
update tmp_P set UnitPrice = UnitPrice * 1.10;