select count(*) from orders where (shippeddate - RequiredDate) <= 0;

select count(*) from orders where (shippeddate - RequiredDate) >= 1;

select year(orderdate)y,  
customerID,  
avg(datediff(dd,requireddate,ShippedDate))avr  
from orders 
group by customerID, year(OrderDate) 
having avg(datediff(dd,requireddate,ShippedDate)) < 0 
order by year(OrderDate), customerid, avg(datediff(dd,requireddate,ShippedDate));

select productname from products where currentunitprice > (select avg(CurrentUnitPrice) from products) 
order by 1 asc;

select productname, currentunitprice-(select avg(CurrentUnitPrice) from products)Diff from products 
where currentunitprice-(select avg(CurrentUnitPrice) from products) > 50  
or currentunitprice-(select avg(CurrentUnitPrice) from products) < 0 
order by 2 desc;

select orderid, 
(max(unitprice*Quantity)-(min(unitprice*Quantity)))diff, 
min(unitprice*Quantity)minn, max(unitprice*Quantity)maxx  
from [order details] 
where Quantity > 1 
and unitprice*quantity > 2000 
group by orderid 
having max(unitprice*Quantity)-(min(unitprice*Quantity)) > 100;

select productname  
from products  
where currentunitprice between (select avg(currentunitprice)*0.90 from products) 
and (select avg(currentunitprice)*1.10 from products);

select city  
from Customers 
group by city 
having count(city) between 1 and 1 
order by count(city);