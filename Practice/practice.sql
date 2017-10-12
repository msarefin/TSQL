use TSQL2012;
go 

declare @rownum int, @pagenum int 
set @pagenum = 3
set @rownum = 2

select 
	e.empid, 
	e.title,
	CONCAT(e.titleofcourtesy,' ',e.firstname,' ', e.lastname) as Name, 
	CAST(e.birthdate as date) as DOB,
	DATEDIFF(year,e.birthdate,getdate()) as Age,  
	e.address, 
	e.city,
	e.postalcode as ZipCode,
	e.region as 'State', 
	e.country,
	e.phone
from hr.Employees as e 
where e.region is not null
order by e.empid, city desc
offset (@rownum-1)*@pagenum rows
fetch next @pagenum rows only
; 
