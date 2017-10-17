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

--outer join


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




