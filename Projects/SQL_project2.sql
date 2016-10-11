--Use NORTHWIND database to perform following queries: 
--1.	Get USA and UK Customer's List and their Contact Information. (Table: Customers)

select * from Customers 


select ContactName, Address, City, PostalCode,Country,Phone, Fax from Customers
where Country in('usa', 'uk' )



--2. Get Customer List who are from USA or from SP Region of Brazil. (Table: Customers)

select * from Customers 
select ContactName, Address, City, Region, PostalCode, Country, Phone, Fax from Customers 
where Country in('usa','brazil') or Region = 'sp'
 

--3. Get all the CustomerID and OrderID for order placed in third quarter of 1997. (Table: Orders)

select CustomerID, OrderID,convert(varchar(12),OrderDate)'Date', DATEPART(QUARTER,orderdate)'Quarter' from Orders
where DATEPART(QUARTER,OrderDate)= 3 and YEAR(OrderDate) = 1997


--4. Get the Customer who's Company Name starts with either A, B, C, D, E, F, or G and ends with N or E. (Table: Customers)

select ContactName, CompanyName from customers
where CompanyName like '[abcedfg]%' and CompanyName like '%[ne]'

--5. Get the list of Customers where Company Name's 2nd letter is Consonant. (Table: Customers)

select ContactName, CompanyName from Customers
where CompanyName not like '[a-z][aeiou]%'

--6. Get the list of Customers where Company Name has non English characters (not containing A-Z). (Table: Customers)
select ContactName, CompanyName from Customers
select ContactName, CompanyName from Customers
where CompanyName not like '%[a-z]%'

--7. We acquire new Shipper and it does not ship to PO Box. Generate the list of Customers which has PO Box address. (Table: Customers)

select * from Customers 
where Address like 'p.o. box%'



--8. Get the Customer Count by (Table: Customers)

select * from Customers

           -- i. Country
           
 select * from Customers 
 select Country, COUNT(Country)'Number of customers by country' 
 from Customers 
 group by Country
 order by Country 
 
 
           -- ii. Country, Region
           
 select Country, Region, 
COUNT(Country)'Number of customers by country',
 COUNT(Region)'Number of customers by region' 
 from Customers 
 group by Country, Region 
 order by Country 
 
            --iii. Country, Region, City
            
 select Country, Region,City,
 COUNT(Country)'Number of customers by country',
 COUNT(Region)'Number of customers by region', 
 COUNT(city)'Number of customers by city' 
 from Customers 
 group by Country, Region, City  
 order by Country 
            

--9. The Company wants to increase its relationship with higher raking officers of Customer. 
--Get the Count of Contact's person by their title. (Table: Customers)

select ContactTitle, COUNT(ContactTitle)'Number of Customers by Title'
from Customers 
group by ContactTitle
order by ContactTitle


--10. Get the list of Customers and Number of Orders placed by each customer till date. (Table: Orders)
select * from Customers 
select * from Orders

select c.ContactName,d.CustomerID, convert(varchar(12),d.OrderDate)'Order Date', COUNT(OrderID)'Orders Placed by each customer'
from Orders as d join Customers as c on d.CustomerID=c.CustomerID
group by d.CustomerID,c.ContactName, OrderDate
order by d.CustomerID 

select c.ContactName,d.CustomerID, COUNT(OrderID)'Orders Placed by each customer'
from Orders as d join Customers as c on d.CustomerID=c.CustomerID
group by d.CustomerID,c.ContactName
order by d.CustomerID 


--11. Get the top 10 Customers who has placed most order till date. (Table: Orders)
use Northwind
go 
select * from Orders

select top 10 CustomerID, COUNT(OrderID)'Number of orders placed' 
from Orders
group by CustomerID
order  by [Number of orders placed] desc


select top 10 CustomerID, RANK() over ( order by (
COUNT(OrderID)) desc)'Top 10 Customers by most orders'
from Orders
group by CustomerID




--12. Get Customers list who has placed 5 or more Orders. (Table:Orders)
select * from Orders


select CustomerID, COUNT(OrderID)'Number of Orders' 
from Orders
group by CustomerID 
having COUNT(OrderID)>=5
order by [Number of Orders]



select COUNT(OrderID)'Number of Orders'
from Orders
group by CustomerID 
order by [Number of Orders]


--13. Get the Order Count by (Table:Orders)

select * from Orders

         --  I. Each Year (Hint: YEAR() function)
         
select YEAR(OrderDate)'Year_order',COUNT(OrderID)'Number of Orders'
from Orders
group by YEAR(OrderDate)
order by YEAR(OrderDate)
         
         
         -- ii. Each quarter in each year (Hint: research on DATEPART() function)

select 
YEAR(OrderDate)'Year_order',
DATEPART(QUARTER,OrderDate)'Quarter',
COUNT(OrderID)'Number of Orders' 
from Orders
group by YEAR(OrderDate), DATEPART(QUARTER,OrderDate)
order by YEAR(OrderDate), DATEPART(QUARTER,OrderDate)
         
         
        -- iii. Each Month in each year (Hint: research on DATEPART() function)
        


select 
YEAR(OrderDate)'Year_order',
DATEPART(MONTH,OrderDate)'Month',
COUNT(OrderID)'Number of Orders' 
from Orders
group by YEAR(OrderDate), DATEPART(MONTH,OrderDate)
order by YEAR(OrderDate), DATEPART(MONTH,OrderDate)


--14. Calculate Average, Total, Minimum, and Maximum Frieght paid (Table:Orders)

select * from Orders
order by ShipCountry

select * from Shippers

           -- i. For each Order

select OrderID,AVG(Freight)'Avarage Freight',SUM(Freight)'Total Freight' ,MAX(Freight)'Maximum Freight', MIN(Freight)'Minimum Freight'
from Orders
group by OrderID
order by OrderID

           -- ii. For each Company
           
select s.CompanyName,AVG(d.Freight)'Avarage Freight',SUM(d.Freight)'Total Freight' ,MAX(d.Freight)'Maximum Freight', MIN(d.Freight)'Minimum Freight'
from Orders as d join Shippers as s on d.ShipVia = s.ShipperID
group by s.CompanyName
order by s.CompanyName           

           
           -- iii. For each Country on all orders
           
select ShipCountry,AVG(Freight)'Avarage Freight',SUM(Freight)'Total Freight' ,MAX(Freight)'Maximum Freight', MIN(Freight)'Minimum Freight'
from Orders
group by ShipCountry
order by ShipCountry           
           
          --  iiv. for Each Carrier (ShipVia)
          
select d.ShipVia,s.CompanyName,AVG(d.Freight)'Avarage Freight',SUM(d.Freight)'Total Freight' ,MAX(d.Freight)'Maximum Freight', MIN(d.Freight)'Minimum Freight'
from Orders as d join Shippers as s on d.ShipVia = s.ShipperID
group by d.ShipVia,s.CompanyName
order by d.ShipVia,s.CompanyName          
          

--15. List Total Sale for each Product in each Order (Hint: UnitPrice * Quantity - UnitPrice * Quantity * Discount)

select * from Orders 
select * from [Order Details]
select * from Customers
select * from Products


select od.OrderID,p.ProductName, SUM(p.UnitPrice*od.Quantity-od.quantity*od.discount)'Total Sales'
from Products as p join [Order Details] as od on p.ProductID = od.ProductID join orders as d on od.OrderID = d.OrderID join Customers as c on d.CustomerID=c.CustomerID
group by od.OrderID, p.ProductName
order by od.OrderID


--16. For each Order Calculate (Table: [Orders Details])

select * from [Order Details]

           -- i. Types of Products Ordered (Hint: Count on Product)
select od.OrderID, COUNT(od.ProductID)'Types of items per order' 
from [Order Details] as od 
group by od.OrderID
order by od.OrderID

          --  ii. Total Sale for each Order
          
select OrderID, SUM(UnitPrice * Quantity - Discount * Quantity)'Total Sales per order' 
from [Order Details]
group by OrderID 
order by OrderID 

          
          

--17. List total Quantity Ordered for Each Product on all orders. (Table: [Orders Details])

select ProductID, SUM(Quantity)'Total Quantity Ordered' 
from [Order Details]
group by ProductID
order by ProductID 


--18. List top 10 Most Sold products in quantity in an order. (Table: [Orders Details])

select top 10 OrderID, ProductID, SUM(Quantity)'Total Quantity orderd' 
from [Order Details]
group by OrderID, ProductID  
order by OrderID 


--19. Provide a SQL statement and sample result set that will count orders for all 
--Customers within the SP (Brazil) state during the 1997 calendar year sorted by Customer name. 

select * from Orders 
select * from [Order Details]
select * from Customers
where Region = 'sp'
select * from Products


select c.ContactName,c.Region,c.Country,DATEPART(YEAR,d.OrderDate)'Order Date',COUNT(od.OrderID)'Number of orders' 
from Products as p join [Order Details] as od on p.ProductID = od.ProductID join orders as d on od.OrderID= d.OrderID join Customers as c on d.CustomerID = c.CustomerID
group by c.ContactName,c.Region,c.Country,d.OrderDate
having c.Region = 'sp' and DATEPART(YEAR,d.OrderDate)= 1997
order by c.ContactName

--20. Provide a SQL statement and sample result set that will list all Customers within the SP (Brazil) state that have placed 7 or more orders during the 1998 calendar year. 
 
select c.ContactName,c.Region,c.Country,DATEPART(YEAR,d.OrderDate)'Order Date',COUNT(od.OrderID)'Number of orders' 
from Products as p join [Order Details] as od on p.ProductID = od.ProductID join orders as d on od.OrderID= d.OrderID join Customers as c on d.CustomerID = c.CustomerID
group by c.ContactName,c.Region,c.Country,d.OrderDate
having c.Region = 'sp' and DATEPART(YEAR,d.OrderDate)= 1998 and COUNT(od.OrderID)>=7
order by c.ContactName
 
 

