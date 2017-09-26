use nugget; 
go 

if object_id(N'vEmployeesWithSales', N'V') is not null 
drop view vEmployeesWithSales; 

go 
create view vEmployeesWithSales as 
	Select e.* 
	from Employees as e 
	inner join 
	Sales as s 
	on e.EmployeeID = s.EmployeeID;

	
	
go 


select * from vEmployeesWithSales; 


go 

create view 

