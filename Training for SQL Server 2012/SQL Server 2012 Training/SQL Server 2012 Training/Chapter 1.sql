use TSQL2012;
go

--Chapter 1

select country 
from hr.Employees; 

----------

select distinct country from hr.Employees; 


--------------


select empid, lastname from hr.Employees; 

------------


select empid, lastname from hr.Employees order by empid; 

------------------------

select empid, lastname from hr.employees order by 1; 

---------------


select empid, firstname+' '+lastname as FullName 
from hr.Employees; 


