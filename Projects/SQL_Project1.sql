select * from Employees

/* 1.Write a query that displays an alphabetical list 
(first and last name only) of all Employees (Employees)*/

select Firstname, LastName
from Employees
order by LastName, FirstName 

/*2. Write a query that displays an alphabetical list 
 employees that are not sales representatives */

select FirstName, LastName
from Employees
where Title <> 'sales representative'
order by LastName, FirstName

-- OR 

select FirstName, LastName
from Employees
where Title not in ('sales representative')
order by LastName, FirstName

/* 3.Write a query that displays the names of all
customers who are based in Brazil.Include 
customer id, name, city, and country, sorted by name */

select * from Customers

select CustomerID, ContactName, City, Country 
from Customers
where Country = 'brazil'
order by ContactName


--OR 

select CustomerID, ContactName, City, Country  
from Customers
where Country like ('brazil')
order by ContactName 

/*4.What were the total number of 
orders placed by order date?*/

select * from Orders

select OrderID, convert(varchar(12),orderdate,107), /*datepart(QUARTER,orderdate)Quarters,*/COUNT(OrderID)Number_of_Orders
from orders
group by OrderDate, OrderID
order by OrderDate


/*5.How many total orders were placed in the first quarter 
of 1997 (Jan, Feb, and Mar)?  Your answer should 
include a single number that is based on the order date
(orders) */
------------------------------------------------------------------------
select * --OrderDate
from Orders
where OrderDate >= '1997-01-01' and OrderDate < '1997-04-01'
--group by OrderDate
--order by OrderDate



select /*OrderDate,*/ (count(customerid))Number_of_orders_first_Quarter_of_1997
from Orders 
where DATEPART(quarter, OrderDate) = 1 and YEAR(OrderDate) = 1997



------------------------------------------------------------------------
/*6.How many orders were sent to each customer?
(customers and orders table)*/

select * from Customers
order by CustomerID
select * from Orders
order by CustomerID

select c.ContactName, COUNT(ContactName)Orders_Count 
from Customers as c join orders as d on c.CustomerID = d.CustomerID
group by ContactName
order by ContactName


select Contactname, COUNT(d.OrderID)Orders_Count 
from Customers as c join orders as d on c.CustomerID = d.CustomerID
group by ContactName
order by ContactName

/* 7.How many orders has each employee written?  
Your results should sort by employee last name.
(use order and employess table,
then use order and customer table) */

select * from Orders
order by EmployeeID
select * from Employees 
order by EmployeeID
select * from Customers 


--used order and employess table
select LastName, FirstName, COUNT(CustomerID)No_of_Orders_Taken
from orders as d join employees as e on d.EmployeeID = e.EmployeeID 
group by LastName, FirstName 
order by LastName, FirstName
--------------------------------------------------------------------
select CustomerID, EmployeeID from Orders
order by EmployeeID 
select CustomerID, ContactName from Customers
order by CustomerID

-- used order and customer table
select EmployeeID, COUNT(ContactName)No_of_Orders_Taken
from orders as d join Customers as c on d.CustomerID = c.CustomerID
group by EmployeeID
order by EmployeeID 


--used Order, Employees and Customers table 

select e.LastName, e.FirstName, COUNT(d.OrderID)No_of_Orders_Taken
from orders as d join employees as e on d.EmployeeID = e.EmployeeID 
join Customers as c on c.CustomerID = d.CustomerID
group by LastName, FirstName 
order by LastName, FirstName




/* 8.How many units are in stock for each product in inventory?  
Create a report sorted by product name.
(use product table) */

select * from Products
order by ProductName

select ProductName, UnitsInStock from products
order by ProductName

/* 9.What was the total units sold and total sales before a discount (where Discontinued column is 1 in product) 
(Unit Price * Quantity) for products that have been discontinued? 
 Create a report sorted by product name (use products and orderdetails table) */


select * from Products
select * from [Order Details]

select ProductID,ProductName,UnitPrice 
from Products
where Discontinued = 1
order by ProductName

select ProductID, sum(Quantity) as QTY from [Order Details]
group by ProductID 
order by ProductID

-- Total uinits and total Quantity sold before discount
select p.ProductID, p.ProductName,sum(Quantity) as 'Total Units sold', SUM(p.UnitPrice*od.Quantity) as 'Total Sales Before Discount'
from Products as p join [Order Details] as od on p.ProductID = od.ProductID
where Discontinued = 1
group by p.ProductID, p.ProductName
order by p.ProductName


/* 10.How many orders by day were shipped for the 
 shipping company United Package in 1996.  
 Show a report that includes Company Name, Shipped Date, 
 and numbers of orders by ship date for this company.
 (use shippers and orders) */


select * from Shippers
where CompanyName = 'united package'
select * from Orders
where ShipVia = 2

select * --CompanyName,ShippedDate, count (shippeddate)'Number of Units Shipped'
from Shippers as s join Orders as d on s.ShipperID = d.ShipVia
where shipperId = 2 

select CompanyName,ShippedDate, count(ShippedDate)'Number of Units Shipped'
from Shippers as s join Orders as d on s.ShipperID = d.ShipVia
where CompanyName = 'united package'/*shipperId = 2 */and (ShippedDate >='1996-01-01' and ShippedDate < '1997-01-01')
group by CompanyName,ShippedDate
order by ShippedDate 

/* 11.How many orders by day were shipped for the 
 shipping company United Package in each year.  
 Show a report that includes Company Name, Shipped Date, 
 and numbers of orders by ship date for this company.
 (use shippers and orders) */
 
select * from Shippers
where CompanyName = 'united package'
select * from Orders
where ShipVia = 2
 
select CompanyName,day(ShippedDate)'Day',month(ShippedDate)'month',year(ShippedDate)'year',count(CustomerID)/*year(ShippedDate)*/'Number of Units Shipped'
from Shippers as s join Orders as d on s.ShipperID = d.ShipVia
where shipperId = 2 
group by CompanyName,ShippedDate
order by ShippedDate
 
/* 
 12.For each customer, how many UNIQUE orders were placed, 
 what was the total sales before a discount (Unit Price * Quantity), 
 total discounts given to each customer, 
 and total sales after the discount. 
( use products and orderdetails table)
 */



select p.ProductID, c.ContactName, od.OrderID, count(od.OrderID)'Number Of Unique Orders',SUM(p.UnitPrice * od.Quantity)'Sales before Discount', SUM(od.Discount * od.Quantity)'Sales Discount', SUM(od.UnitPrice * od.Quantity)'Sales After Discount'
From products as p join [Order Details] as od on p.ProductID = od.ProductID 
join orders as d on od.OrderID = d.OrderID join Customers as c on d.CustomerID=c.CustomerID
group by od.OrderID, c.ContactName, p.ProductID
order by p.ProductID--ContactName


select * from Products
select * from [Order Details]
select * from Orders
order by CustomerID 
select * from Customers 
order by CustomerID 


select ProductID, ProductName, UnitPrice from Products
order by ProductID
select OrderID, ProductID, UnitPrice,Quantity, Discount from [Order Details]
order by ProductID
select OrderID, CustomerID,ShipVia from Orders
select CustomerID, ContactName from Customers 

--
select 1982 as 'Birth year', DATEDIFF(YEAR,'1982-01-05',GETDATE())as Age 


--- Temp table 
create table #temp
(id int,
name varchar(30)
)

insert into #temp
values
(1,smith),
(2,jobn)

