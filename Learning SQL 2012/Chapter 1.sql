use TSQL2012; 
go 

select 
e.empid, 
e.firstname, 
e.lastname, 
e.address, 
e.city, 
e.postalcode,
e.birthdate, 
DATEDIFF(year,e.birthdate, GETDATE()) as age
from hr.Employees as e
where e.empid !=0
group by e.city, e.birthdate, empid, e.firstname,e.lastname,e.address,e.city, e.postalcode
having DATEDIFF(YEAR, e.birthdate, GETDATE())>50
order by age

------------

use tsql2012;
go
select country, YEAR(hiredate) as yearhired, COUNT(*) as numemployees
from hr.employees
where hiredate>= '20030101'
group by country, YEAR(hiredate)
having COUNT(*) >1
order by country, yearhired desc;


-------------------



