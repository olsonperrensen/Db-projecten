-- Database Fundamentals Exam by Maximiliano Iturria Cardozo on 2022-01-18 16:01PM
-- Question 1
create database fexam22
use fexam
create table Owner(
OwnerID int constraint conPKOwnerID primary key not null identity(1,1),
OwnerAge decimal(6,2),
OwnerStreet varchar(30),
OwnerName varchar(30)
)
create table Dog(
DogID int constraint conPKDogID primary key not null identity(1,1),
DogBreed varchar(30),
DogAge decimal(6,2),
OwnerID int not null foreign key references Owner(OwnerID) 
)
create table Terrain(
TerrainID int constraint conPKTerrainID primary key not null identity(1,1),
TerrainStreet varchar(30),
TerrainName varchar(30)
)
create table TerrainOwner(
TerrainID int constraint conFKTerrainID not null foreign key references Terrain(TerrainID),
OwnerID int constraint conFKOwnerID not null foreign key references Owner(OwnerID),
TerrainOwnerDate date constraint conNNTerrainOwnerDate not null,
primary key(TerrainID,OwnerID)
)
insert into Owner(OwnerAge,OwnerStreet,OwnerName)
values(22.7,'Main St.','Bjorn A.')
insert into Owner(OwnerAge,OwnerStreet,OwnerName)
values(72.1,'Second St.','Peete C.')
insert into Dog(DogBreed,DogAge,OwnerID)
values('Lapsa',7.1,1)
insert into Dog(DogBreed,DogAge,OwnerID)
values('Rotten',11.4,2)
insert into Terrain(TerrainStreet,TerrainName)
values('Fields St. A','The Great FIeld')
insert into Terrain(TerrainStreet,TerrainName)
values('Fields St. B','The OK Field')
insert into TerrainOwner(TerrainID,OwnerID,TerrainOwnerDate)
values(1,1,'2022-01-01')
insert into TerrainOwner(TerrainID,OwnerID,TerrainOwnerDate)
values(1,2,'2022-02-02')
insert into TerrainOwner(TerrainID,OwnerID,TerrainOwnerDate)
values(2,1,'2022-04-07')
-- Question 2
select e.lastname employee, e.city stad,
s.companyname shipper, count(*) 'Number of Shippings'
from Employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join Shippers s
on s.ShipperID = o.ShipVia
where e.city like 'L%' or e.city like 'S%' 
group by e.LastName, e.City, s.CompanyName
having count(*) > 3
order by 1 asc, 4 asc;
-- Question 3
select customerid, companyname, isnull(region,'Not Defined')from customers where CustomerID like '[ABC]%'
-- Question 4
select CategoryName, categories.CategoryID, min(currentunitcost)'Minimum Cost'
from Categories
join Products
on products.CategoryID = Categories.CategoryID
where CategoryName in(
	select top 1 CategoryName
	from Categories
	join products
	on products.CategoryID = Categories.CategoryID
	group by categoryname)
group by CategoryName, categories.CategoryID
order by min(CurrentUnitCost) asc
-- Question 5
select companyname'Name' 
from Customers
join orders on orders.CustomerID = Customers.CustomerID
join [Order Details] on [Order Details].OrderID = orders.OrderID
join products on products.ProductID = [Order Details].ProductID
join Categories on products.CategoryID = Categories.CategoryID
where CategoryName in('seafood','confections')
except
select companyname'Name' 
from Customers
join orders on orders.CustomerID = Customers.CustomerID
join [Order Details] on [Order Details].OrderID = orders.OrderID
join products on products.ProductID = [Order Details].ProductID
join Categories on products.CategoryID = Categories.CategoryID
where CategoryName in('Dairy Products')
order by 1 asc
-- Question 6
{viewerVotes:{$gt:2000},viewerRating:{$in:[4,4.5,5]}}