select productId, ProductName from Products where SupplierID IN ( select supplierID  from Suppliers where CompanyName = 'Pavlova, ltd.');
select sum(Quantity) as TotalTofu from `order details` where productID IN (select productID from products where ProductName = 'Tofu');
select count(*) as nbr_of_orders_of_King from orders where EmployeeID IN (select EmployeeID from Employees where LastName = 'King' AND FirstName = 'Robert') and (year(OrderDate) = 1996 and month(OrderDate) = 5);
select productname from products where UnitsOnOrder > 0 and CategoryID IN (select CategoryID from categories where CategoryName = 'Confections');
select productname from products where UnitPrice IN (select unitprice from products where ProductName = 'Chang') and ProductName NOT IN ('Chang');
select productname from products where unitprice > (select unitprice from products where ProductName = 'Tofu');
select CompanyName from customers where customerID  IN (select customerID from orders group by customerID having count(customerID) > 15) ;
select lastname from employees where hiredate IN (select max(hiredate) from employees);
select ProductName from products where productID NOT IN (select productID from `order details` where products.productID = `order details`.productID);