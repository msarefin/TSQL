use TSQL2012;
go 

declare @rownum int, @pagenum int 
set @pagenum = 3
set @rownum = 2

select 
	e.empid, 
	e.title,
	CONCAT(e.titleofcourtesy,' ',e.firstname,' ', e.lastname) as Name, 
	try_CAST(e.birthdate as date) as DOB,
	DATEDIFF(year,e.birthdate,getdate()) as Age,  
	e.address, 
	e.city,
	e.postalcode as ZipCode,
	e.region as 'State', 
	e.country,
	e.phone
from hr.Employees as e 
where e.region is not null
order by e.empid, city desc, Age
offset (@rownum-1)*@pagenum rows
fetch next @pagenum rows only
; 

select SYSDATETIMEOFFSET()
select day(getdate())
select MONTH(getdate())
select year(getdate())
select switchoffset(SYSDATETIMEOFFSET(),'-02:00'), sysdatetime()

select TODATETIMEOFFSET(getdate(),'-02:00')


select * from hr.Employees where country=N'USA' and region =N'WA'
select * from hr.employees where country is null or region is null

select * from hr.Employees where hiredate ='20070213'


declare @d as date = '02-12-07'

select 
	day(@d) as [DAY], 
	MONTH(@d) as [MONTH], 
	year(@d) as [YEAR], 
	@d as [DATE]

select empid, hiredate from hr.employees
order by hiredate;


select e.empid, e.hiredate from HR.Employees as e 
where e.hiredate between '20020401' and '20020501'
;
select e.empid, e.hiredate from HR.Employees as e 
where e.hiredate >='20020401' and e.hiredate <='20020501'


select top (3) empid, firstname, lastname
from hr.Employees
order by empid desc

select empid, concat(firstname,' ', lastname) as 'Name'from HR.Employees
order by empid desc 
offset 3 rows fetch next 5 rows only; 

select top (40) percent  empid, firstname, lastname, hiredate from hr.Employees order by empid desc

select empid, concat(firstname,' ', lastname) as 'Name' 
from HR.Employees
order by (select null)
offset 3 rows fetch next 5 rows only; 

if OBJECT_ID(N'dbo.nums',N'U') is not null 
select * from nums 
else 
print 'Table not found!'


select tbl1.n, tbl2.n from dbo.nums as tbl1 cross join dbo.nums tbl2