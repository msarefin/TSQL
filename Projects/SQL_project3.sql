/*
1) How much sales is done by each employee?

(northwind , table : - orders and orderdetail )
*/

use Northwind
go 
select * from Orders
select * from [Order Details]

select d.EmployeeID, COUNT(d.CustomerID)[Number of Sales] 
from orders as d join [Order Details] as od on d.OrderID = od.OrderID
group by d.EmployeeID
order by d.EmployeeID

/*
2) Create two tables(table_A and table_B) with same column name(they should have at 
least two column). Now create an update trigger on table_A, which will save the 
rows with old values in table_B, if there is an update operation in table_A.
*/

/*drop table table_a
drop table table_b

*/

use Practice
go 
create table table_a
(id int, name varchar(20))

create table table_b
(id int, name varchar(20))

select * from table_a 
select * from table_b

go
alter trigger update_trigger
on table_a
for update 
as 
begin
insert into table_b (id,name)
select id, name from inserted
end 

--insert into table_a 
--values (1,'john')

update table_a
set name = 'dex'
where id = 3

select * from table_a
select * from table_b


alter table table_b
alter column name varchar(20)
/*
3) Use INTO with SELECT statement to copy table data in a new table? 
*/

select * into new_table from table_a

select * from new_table

/*
4)  Create Two table have same data but different column name. Now, write the syntax 
to combine the data set from two tables. 
*/
create table table1
(student_id int, student_name varchar(30))
insert into table1
values 
(1,'john' ),
(2,'alex' ),
(3,'dexter' ),
(4,'kelly' ),
(5,'karren' )
select * from table1 

create table table2 
(id int, name varchar(30))
insert into table2
values 
(10,'sam' ),
(6,'samantha' ),
(7,'sanjeev' ),
(8,'rajesh' ),
(9,'Harui-Suzumia' )
select * from table2 


select * from table1 
select * from table2

select * from table1 
union  
select * from table2;
go
-------------------------------------------------------
/*
5) Write an update statement that will update ship region to 
‘dd’ for those orders 
that got discount.

(Database: northwind:
Table: Orders, [order details])
*/

/*
select * into practice.dbo.orders from Northwind.dbo.Orders
select * into practice.dbo.order_details from northwind.dbo.[Order Details]
*/

use Practice
go 
select * from orders
select * from order_details

update orders
set shipregion = 'dd'
where orderid in 
(select d.OrderID from Orders as d join order_details as od on d.OrderID=od.OrderID
where od.Discount >0 )



-------------------------------------------------------------

/*
6) Show an example of subquery and co-related subquery 
*/

use Northwind
go 
select * from Products
select * from [Order Details]
select * from Orders 
select * from Customers 

--sub query 
select d.OrderID,d.Freight,d.OrderDate,d.ShipAddress,d.ShipCity from Orders as d 
where d.OrderID in 
(select od.OrderID from [Order Details] as od
where od.Discount = 0 )

-- correlated sub query 

select p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock from Products as p
where p.ProductID in (select od.ProductID from [Order Details]as od join orders as d on od.OrderID = d.OrderID join Customers as c on d.CustomerID = c.CustomerID
where p.ProductID=od.ProductID)
-------------------
/*
7) Create a view that gives product id, product name, standard cost, and inventory 
quantity. Only those product id that are active (standard cost not null)

(Database: advantureworks2008r2
Table: production.productinventory, production.productcosthistory, production.product)
*/
use AdventureWorks2008R2
go 
select * from Production.ProductInventory
order by ProductID 
select * from Production.ProductCostHistory
order by ProductID
select * from Production.Product
order by ProductID

go 
create view prdouction_v
as 
select p.ProductID, p.Name, p.StandardCost, pi.Quantity
from production.ProductInventory as [pi] join Production.ProductCostHistory as [ph] on pi.ProductID=ph.ProductID join Production.Product as p on ph.ProductID=p.ProductID
where p.StandardCost is not null
group by p.ProductID, p.Name, p.StandardCost, pi.Quantity
order by p.Name
go 

/*
8) Create a view with product id, product name, purchase order id, received quantity, 
and rejected quantity.

(Database: Advantureworks2008R2 
Table: purchasing.purchasingorderdetail, purchasing.purchaseorderheader, production.product)

*/


use AdventureWorks2008R2
go 

select * from Purchasing.PurchaseOrderDetail
select * from Purchasing.PurchaseOrderHeader
select * from Production.Product

go
create view purchase_v
as
select pd.ProductID,p.Name,pd.PurchaseOrderID,pd.ReceivedQty, pd.RejectedQty from Purchasing.PurchaseOrderDetail as pd join Purchasing.PurchaseOrderHeader as ph on pd.PurchaseOrderID=ph.PurchaseOrderID 
join Production.Product as p on pd.ProductID=p.ProductID
go

select * from purchase_v

/*
9) Write a CTE that will return deptid with business entity id, but
 It should show only active departmentid.

(Database : Advantureworks2008R2
Table : humanresources.employeedepartmenthistoty, humanresources.department)
*/
use AdventureWorks2008R2
go 
select * from HumanResources.EmployeeDepartmentHistory
select * from HumanResources.Department
go 
with 
active_dept_cte
as
(select eh.BusinessEntityID, d.DepartmentID from HumanResources.EmployeeDepartmentHistory as eh join HumanResources.Department as d on eh.DepartmentID=d.DepartmentID
where eh.EndDate is null)


----------------------------------------------**************************




/*
10) Create stored procedure that will take salesorderid as 
input and return total price, 
territory name as output. In this stored procedure there will be 
one input and two 
output parameters.
 
(Database: Advantureworks2008R2 
Table: sales.salesorderheader, sales.salesorderdetails, sales.salestertoriy)

*/
use AdventureWorks2008R2
go 



select t.Name from sales.SalesTerritory t
select * from sales.SalesOrderHeader h
select d.SalesOrderID, (d.UnitPrice*d.OrderQty)as total from sales.SalesOrderDetail d
where OrderQty = null or UnitPrice = null

go

create procedure spSBOID
@salesorderid int,
@totalprice int output,
@territoryname varchar(50) output
as
begin 
select @totalprice=sum(d.UnitPrice*d.OrderQty),@territoryname=t.Name
from sales.SalesOrderHeader as h 
join Sales.SalesOrderDetail as d on h.SalesOrderID=d.SalesOrderDetailID 
join Sales.SalesTerritory as t on h.TerritoryID=t.TerritoryID
where h.SalesOrderID = @salesorderid
group by t.Name
end 



declare @tt int 
declare @ty varchar(30)
exec spSBOID 
@salesorderid = 43665,
@totalprice = @tt out,
@territoryname = @ty out
select @tt as [Total Price], @ty as Territory 


/*
11) Create a view with 
business entityid, 
personid, 
contacttypeid, 
name, 
address.

(Database : Advantureworks2008R2
Table: person.contacttype, person.businessentitycontact, sales.salestertoriy, person.businessadress, person.addresss)
-------------------------------------------------------------------------------------------88888888888888888888
*/
select *,cp.ContactTypeID from Person.ContactType as cp
select *,bc.BusinessEntityID from Person.BusinessEntityContact as bc
select *,BusinessEntityID from person.BusinessEntityAddress as ba
select * from Person.Address  as a 
select * from sales.SalesTerritory as st


go
create view abc_v
as
select bc.BusinessEntityID, bc.PersonID,bc.ContactTypeID, ct.Name, a.AddressLine1, a.AddressLine2,a.City,a.PostalCode
from Person.ContactType as ct 
join Person.BusinessEntityContact as bc on ct.ContactTypeID=bc.ContactTypeID 
join Person.BusinessEntityAddress as ba on bc.BusinessEntityID=ba.BusinessEntityID
join Person.Address as a on ba.AddressID=a.AddressID 


select * from abc_v
 

--------------------------------------
/*
12) Create an instead of delete trigger that will print the message 
‘can not delete from this table’
*/
use Practice
go 


create table table_sample
(id int, name varchar(30), zip varchar (8), country varchar(30))

insert into table_sample
values 
(1,'alex','11418','usa'),
(2,'max','11204','usa'),
(3,'jen','11218','usa'),
(4,'ali','11101','usa'),
(5,'smith','10010','usa'),
(6,'dexter','12201','usa'),
(7,'alam','12344','usa')



go 
create trigger Cannot_delete_trigger
on table_sample
instead of delete
as begin 
Print 'can not delete from this table'
end 

delete from table_sample
where id = 6



/*
13) find the employee with 2nd highest pay rate.

(Database : Advantureworks2008R2
Table: humanresources.Employeepayhistory)

*/
go 
use AdventureWorks2008R2
go 


select a.BusinessEntityID, a.Rate, a.highest
from (select BusinessEntityID,rate, RANK() over (order by rate desc) as highest from HumanResources.EmployeePayHistory) as a
where a.highest = 2 
 
/*
14) Show an example of try and catch block 
*/


begin try 
declare @a int 
set @a = 1/0
print'this is not defined'
end try 
begin catch 
print 'caclulation is not possible'
end catch
print 'the transaction was not performed'


/*
15) Create a stored procedure that will take input 
parameter orderid returns total 
sales amount as output parameter.

(Database : northwind  
Table: [order details])

*/
use Northwind
go 
select * from [Order Details]

use Northwind
go 
create procedure spTotal_sales
@orderid int,
@totalsales int output
as
begin 
select @totalsales = sum(od.UnitPrice*od.Quantity)
from [Order Details] as od 
where od.OrderID = @orderid
group by od.UnitPrice
end 

go 
declare @tot int
exec spTotal_sales 
@orderid = 10250,
@totalsales = @tot output
select @tot [Total sales Amount]




/*
16)  Create stored procedure that will take EmployeeID as 
input parameter and 
return region description as output parameter.

(Database : northwind
Table: employees, region, territories, employeeterritories)

*/

use Northwind
go 

select * from Employees
select * from Region
select * from Territories
select * from EmployeeTerritories


use Northwind
go 
create procedure spRegion
@employeeID int, 
@region varchar(30) output
as 
begin
select @region = r.RegionDescription 
from Employees as e 
join EmployeeTerritories as et on e.EmployeeID=et.EmployeeID
join Territories as t on et.TerritoryID=t.TerritoryID 
join Region as r on t.RegionID=r.RegionID
where e.EmployeeID = @employeeID
end


declare @r varchar(30)
exec spRegion
@employeeID = 4,
@region = @r out
select @r as [region]
go

/*
17)  Show the total number of employees for each region with region description.

(Database : northwind
Table: employees, region, territories, employeeterritories)

*/
use Northwind
go 
select* from Employees
select * from Region
select * from Territories
select * from EmployeeTerritories

select COUNT(r.RegionDescription)as Total_Number_Employees, r.RegionID,r.RegionDescription from Region as r 
join Territories as t on r.RegionID=t.RegionID 
join EmployeeTerritories as et on t.TerritoryID=et.TerritoryID
join Employees as e on et.EmployeeID=e.EmployeeID
group by r.RegionDescription, r.RegionID
order by r.RegionDescription
go 


/*
18) Find employee who will be 64yrs old on may1st 2014 

(database: northwind  
Table: Employees)

*/
use Northwind
go
select * from Employees
go
select EmployeeID,DATEDIFF(YEAR,e.BirthDate,'2014-05-01')'Age' into #employees from Employees as e 
select * from #employees

select e.FirstName, e.LastName,e.Title, e.BirthDate, em.Age
from Employees as e join #employees as em on e.EmployeeID=em.EmployeeID
where em.Age>64
go
/*
19) find those employees, whose hourly rate is $50 or more, with active depatment name
 
(Database: advantureworks2008r2 
Table: humanresources.EmployeePayHistory, humanresources.employeedepartmenthistoty, humanresources.department)  

*/

use AdventureWorks2008R2
go 
select * from HumanResources.EmployeePayHistory
select * from HumanResources.EmployeeDepartmentHistory
select * from HumanResources.Department

select eph.BusinessEntityID, edh.DepartmentID,edh.ShiftID,d.Name,d.GroupName, eph.Rate
from HumanResources.EmployeePayHistory as eph
join HumanResources.EmployeeDepartmentHistory as edh on eph.BusinessEntityID=edh.BusinessEntityID
join HumanResources.Department as d on edh.DepartmentID=d.DepartmentID
where eph.Rate>=50
order by eph.Rate