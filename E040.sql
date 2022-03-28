select count(*) as `total customers` from customers;
select count(*) as `German Customers` from customers where Country IN('germany');
select sum(UnitsOnOrder) as `sum of units on order` from products;
select avg(UnitPrice) from products where UnitsOnOrder = 0;
select max(discount) from `order details`;
select round(sum(UnitPrice*quantity - Discount)) from `order details`;
select orderid, UnitPrice, Quantity, (UnitPrice * Quantity) as 'Turnover'from `order details`;
select lastname, firstname, (year(HireDate)-year(BirthDate)) as `AgeHired` from employees; (solution 1 MySQL)
select lastname, firstname, floor(datediff(HireDate, BirthDate)/365) as `AgeHired` from employees; (solution 2 MySQL)
... (SQL Server solution)
select ProductName, UnitPrice as CurrentUnitPrice, UnitPrice + UnitPrice/100*2 as UnitPriceIncrease from products;
select ProductName, UnitPrice as CurrentUnitPrice, round(UnitPrice + UnitPrice/100*2) as UnitPriceIncrease from products;
select ProductName, UnitPrice as CurrentUnitPrice, round(UnitPrice + UnitPrice/100*2) as UnitPriceIncrease from products where UnitPrice + UnitPrice/100*2 > 50;
select count(region) as `Nbr of regions` from employees;
select upper(concat(left(LastName, 2), left(FirstName, 1))) as empCode from employees;