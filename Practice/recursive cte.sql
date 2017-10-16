use TSQL2012
go 

with empcte as 
(
select empid, mgrid, firstname, lastname, 0 as distance
from hr.Employees 
--where empid = 2

union all 

select m.empid, m.mgrid, m.firstname, m.lastname, s.distance+1 as distance
from empcte as s 
join hr.Employees as m 
on s.mgrid=m.empid
)

select distinct m.empid, m.mgrid, concat(m.firstname,' ', m.lastname) as Manager, CONCAT(e.firstname,' ',e.lastname)  as employee--, m.distance 
from empcte as m 
join empcte as e on e.mgrid = m.empid
where e.mgrid=m.empid