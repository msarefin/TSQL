use TSQL2012; 
go 

select e.empid, e.firstname, e.lastname, e.city, e.region, e.country
from hr.Employees e;


select  e.empid, e.firstname, e.lastname, e.city,e.region, e.country
from hr.employees as e
where e.region = N'WA'
;

-- what if you want people who are not from WA?

select e.empid, e.firstname, e.lastname, e.city, e.region, e.country
from HR.employees as e 
where e.region != N'WA'
;

--The people who are not from WA are not from the USA


select e.empid, e.firstname, e.lastname, e.city, e.region, e.country
from hr.Employees as e 
where e.region = null; 



	
select e.empid, e.firstname, e.lastname, e.city, e.region, e.country
from hr.Employees as e where e.region is null; 

-- NUll is treated by SQL as an empty null mark. Null is not equal no Null 

