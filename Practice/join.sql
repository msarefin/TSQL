use TSQL2012;
go 

if OBJECT_ID(N'dbo.nums',N'U') is not null
print 'Table exist' else print 'Table doesn''t exist'

select d.n as theday, s.n as shiftno
from dbo.nums as d cross join dbo.nums as s
where d.n <=7 and s.n <=3
order by theday, shiftno;


--------- Inner join 

select s.companyname as Suppliar,s.country, p.productid, p.productname, p.unitprice
from Production.Suppliers as s 
inner join Production.Products as p
on s.supplierid=p.supplierid
where s.country = N'Japan'

select top 3 * from sales.orders; 
select top 3 * from sales.customers; 
select top 3 * from sales.orderdetailsheap;
select top 3 * from sales.orderdetails; 

---------

select s.companyname as supplier, s.country, p.productid, p.productname, p.unitprice
from Production.Suppliers as s inner join Production.Products as p 
on s.supplierid=p.supplierid and s.country =N'Japan'


select e.empid, CONCAT(e.firstname,' ',e.lastname) as emp, 
CONCAT(m.firstname,' ',m.lastname) as mgr
from hr.employees as e inner join HR.Employees as m 
on e.mgrid=m.empid
order by e.empid;

<<<<<<< HEAD
--outer join
=======
--outer join 
<<<<<<< HEAD
>>>>>>> e69f94dfbf7d63ce9512eed7ba1b0315aecc4160
=======
>>>>>>> 82211e9326e5a3f11b266258b4ba67123241e6a9
>>>>>>> 2b650e85d589e217811b3f4746ab3a549359360e


select s.companyname as supplier, s.country, 
p.productid, p.productname, p.unitprice 
from production.suppliers as s
left outer join 
production.products as p 
on s.supplierid=p.supplierid
where s.country =N'Japan'
;

select s.companyname as supplier, s.country, 
p.productid, p.productname, p.unitprice
from Production.Suppliers as s inner join production.products as p 
on s.supplierid=p.supplierid
where s.country=N'Japan'
;
<<<<<<< HEAD


select s.companyname as supplier, s.country, 
p.productid, p.productname,p.unitprice 
from Production.suppliers as s right join production.Products as p 
on s.supplierid=p.supplierid
where s.country=N'Japan'


select s.companyname as supplier, s.country, 
p.productid, p.productname, unitprice, 
c.categoryname
from Production.Suppliers as s
left join Production.Products as p 
on s.supplierid=p.supplierid
inner join Production.Categories as c 
on s.country=N'Japan';

---

select * 
from Production.Suppliers as s 
left outer join
(Production.Products as p inner join
production.categories as c on c.categoryid=p.supplierid) 
on s.supplierid=p.supplierid
where s.country=N'japan'

---- multi-join


use TSQL2012;
go 

select s.companyname as supplies, 
s.country, p.productid, p.productname,p.unitprice, c.categoryname
from production.Suppliers as s 
left outer join 
production.Products as p 
on s.supplierid=p.supplierid
inner join 
Production.Categories as c
on c.categoryid	=p.categoryid
where s.country = N'Japan'
;


use Northwind; 
go 

select s.CompanyName as suppliers, 
s.Country, p.ProductID, p.ProductName, p.UnitPrice, c.CategoryName
from 
dbo.Suppliers as s left outer join dbo.Products as p 
on s.SupplierID=p.SupplierID
inner join 
dbo.Categories as c on c.CategoryID=p.CategoryID
where s.Country =N'Japan'

---
select s.CompanyName as suppliers,
s.Country,p.ProductID, p.ProductName, p.UnitPrice, c.CategoryName
from dbo.Suppliers as s left outer join (dbo.Products as p --on s.SupplierID=p.SupplierID
inner join dbo.Categories as c on c.CategoryID=p.CategoryID) on s.SupplierID=p.SupplierID
where s.Country=N'Japan'
;


<<<<<<< HEAD
use TSQL2012; 
go 

-- subqueries 

select productid, productname, unitprice
from Production. Products
where unitprice = (select min(unitprice) from production.Products);

select productid, productname, unitprice
from Production.Products 
where supplierid in (select supplierid from Production.Suppliers where country=N'japan')

--Not Exist 

select custid, companyname
from sales.Customers as c where not exists (select * from sales.Orders as o where o.custid=c.custid and o.orderid='20070212'); 

-- exists 

select custid, companyname
from sales.Customers as c where exists(select * from sales.orders as o where o.custid= c.custid and o.orderid='20070212');






=======
>>>>>>> e69f94dfbf7d63ce9512eed7ba1b0315aecc4160
=======
=======
>>>>>>> 82211e9326e5a3f11b266258b4ba67123241e6a9
>>>>>>> 2b650e85d589e217811b3f4746ab3a549359360e
