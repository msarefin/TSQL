use TSQL2012;
go 

select * from sys.columns ;


select t.name, t.create_date, t.object_id 
from sys.tables as t ;
--------------------------------------



select 
	e.empid, 
	e.firstname, 
	e.lastname,
	year(e.hiredate) as YearHired,
	e.region 
from HR.Employees as e
where e.lastname=N'Davis'
; 

----------------------------------------

go 

