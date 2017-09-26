-- Where Clause 

use TSQL2012; 
go 

select e.empid, e.firstname, e.lastname, e.country,e.region, e.city
from HR.Employees as e 
where e.country = N'USA'

-- 

select empid, firstname,lastname, country, region,city
from HR.Employees
where region = N'WA'

--

select empid, firstname, lastname, country, region, city
from hr.Employees
where region <> N'WA'


select empid,firstname, lastname, country,region, city
from HR.Employees 
where region is null; 

select * 
from HR.Employees where region != N'WA'







