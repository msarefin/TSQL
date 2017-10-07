use TSQL2012
go 


with cte
as
(
select  
	e.empid, 
	e.firstname, 
	e.lastname, 
	e.region, 
	YEAR(e.hiredate) as [YearHired],
	e.mgrid, 
	0 as hierarchy
from HR.Employees as e
 
union all 
select 
	e.empid, 
	e.firstname, 
	e.lastname, 
	c.region, 
	YEAR(e.hiredate) as [YearHired], 
	e.mgrid, 
	c.hierarchy +1 hierarchy
	 
from cte as c inner join hr.Employees as e on c.mgrid=e.empid
)

select distinct
	emp.empid,
	emp.mgrid,
	CONCAT(emp.firstname,' ', emp.lastname) as Name, 
	case 
	when emp.mgrid is null then 'Boss'
	else 'employee'
	end Status,
	CONCAT(mgr.firstname,' ', mgr.lastname) as Name,
	emp.hierarchy
from cte as emp	
inner join cte as mgr on emp.empid = mgr.mgrid
order by emp.mgrid asc;





