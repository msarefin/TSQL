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

