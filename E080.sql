select firstname, lastname, orderid 
from Employees 
join orders 
on orders.EmployeeID = Employees.EmployeeID 
order by 1, 2

select firstname, lastname, count(*)'aantal orders' 
from Employees join orders  
on orders.EmployeeID = Employees.EmployeeID 
group by firstname, lastname

select productname, categoryname, companyname 
from Products 
join Categories on Products.CategoryID = Categories.CategoryID 
join Suppliers on Suppliers.SupplierID = Products.SupplierID 
order by 1, 2

select companyname, firstname, lastname 
from Customers join orders  
on orders.CustomerID = Customers.CustomerID 
join Employees on Employees.EmployeeID = Orders.EmployeeID 
order by 1

select companyname, orderid 
from customers 
left join orders 
on orders.CustomerID = Customers.CustomerID 
order by 2

select companyname, count(orderid)'nbr_of_orders' 
from customers 
left join orders 
on orders.CustomerID = Customers.CustomerID 
group by CompanyName 
order by 2

select firstname, lastname, Territorydescription 
from Employees 
join EmployeeTerritories  
on EmployeeTerritories.EmployeeID = Employees.EmployeeID 
join Territories on EmployeeTerritories.TerritoryID = Territories.TerritoryID

select firstname, lastname, count(Territorydescription)'aantal' 
from Employees 
join EmployeeTerritories  
on EmployeeTerritories.EmployeeID = Employees.EmployeeID 
join Territories on EmployeeTerritories.TerritoryID = Territories.TerritoryID 
group by firstname, lastname

select territorydescription, firstname, lastname 
from Territories 
left join EmployeeTerritories  
on EmployeeTerritories.TerritoryID = Territories.TerritoryID 
left join Employees on Employees.EmployeeID = EmployeeTerritories.EmployeeID 
order by 1

select lastname, firstname, count(distinct customerid)'aantalKlanten' 
from Employees join Orders 
on Orders.EmployeeID = Employees.EmployeeID 
group by lastname, FirstName

select companyname 
from customers 
join orders on orders.CustomerID = Customers.CustomerID 
join [Order Details] on Orders.OrderID = [Order Details].OrderID 
where productid in(select ProductID from Products 
where ProductName = 'chocolade') 
order by 1

select companyname, count(orderid)'nbr_of_orders' 
from Customers 
left join orders on orders.CustomerID = Customers.CustomerID 
group by CompanyName 
having count(orderid) < 5 
order by 2

select year(orderdate)'year_required_date', 
day(RequiredDate)-day(ShippedDate)'avg_days_late', 
companyname 
from orders 
join customers on customers.CustomerID = Orders.CustomerID 
where year(requiredDate) = 2018 
and RequiredDate < ShippedDate 
and (day(RequiredDate)-day(ShippedDate)) < 0 
group by year(orderdate), CompanyName,day(RequiredDate)-day(ShippedDate)  
order by 2, 3

select distinct productname, unitprice, currentunitprice 
from products 
join [Order Details] on [Order Details].ProductID =  
Products.ProductID join orders on orders.OrderID 
= [Order Details].OrderID 
order by 3 desc, 2 desc

select productname, min(unitprice)'min', max(unitprice)'max' 
from products join [Order Details] on [Order Details].ProductID 
= Products.ProductID join orders on [Order Details].OrderID 
= orders.OrderID 
group by productname 
having max(UnitPrice) >= min(UnitPrice)*1.05 
order by 1

select top 2 companyname 
from orders 
join Shippers on Shippers.ShipperID = Orders.ShipVia 
where day(RequiredDate)-day(ShippedDate) is not null 
order by day(RequiredDate)-day(ShippedDate)

select companyname, (avg(freight))'avg_freight' 
from customers left join orders 
on orders.CustomerID = Customers.CustomerID 
group by CompanyName 
having avg(freight) > 100 or avg(freight) is null 
order by avg_freight