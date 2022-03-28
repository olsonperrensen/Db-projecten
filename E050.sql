select title, min(HireDate) from employees group by title order by HireDate asc; // the aggregate function MIN will give you the lowest out of that column
select productID, round(avg(UnitPrice),2)AvgUnitPrice, round(avg(Quantity))AvgQty from `order details` group by 1 order by 3 desc;
select country, count(country) as NbrOfSuppliers from suppliers where country IN('USA','Japan');
select city, count(city)NbrEmployees from Employees group by city having count(city) > 1 order by city asc;
select categoryID, max(UnitPrice)maxprice, min(UnitPrice)minprice from Products group by 1;
select categoryID, avg(UnitsInStock) from products where UnitPrice > 10 group by 1 having avg(UnitsInStock) > 40;
select customerID, count(customerID) from orders group by 1 having count(customerID) > 11 order by 2 desc;
select customerID, count(customerID) from orders group by 1 having count(customerID) > 10 order by 2 desc limit 3;
select orderdate, count(orderdate)nbr_of_Orders from orders where orderdate > '1996/01/01' group by 1 having count(orderdate) > 1;
select monthname(orderdate), count(orderdate)nbr_of_Orders from orders where orderdate > '1996/01/01' group by 1 having count(orderdate) > 1 order by 2 desc limit 1;