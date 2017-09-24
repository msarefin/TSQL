use nugget; 
go 




if OBJECT_ID(N'Employees',N'U') is not null drop table Employees; 
if OBJECT_ID(N'Products',N'U') is not null drop table Products; 
if OBJECT_ID(N'Sales',N'U') is not null drop table Sales; 
if OBJECT_ID(N'SalesOrder',N'U') is not null drop table SalesOrder;

create table Employees 
(
	EmployeeID int not null,
	FirstName nvarchar(50) not null, 
	MiddleName nvarchar(50) null, 
	LastName nvarchar(70) not null, 
	Title nvarchar(100) null, 
	HireDate datetime not null, 
	VacationHours smallint not null, 
	Salary decimal(19,4) not null
);

go 

create table Products 
(
	ProductID int not null, 
	Name nvarchar(50) not null, 
	Price decimal(19,4) not null
);

go 

create table Sales
(
	SalesID uniqueidentifier not null,
	ProductID int not null, 
	EmployeeID int not null,
	Quantity smallint not null

);

go 


select name, type 
from sys.tables;

go 

alter table Employees
	add ActiveFlag bit not null, 
	ModifiedDate datetime not null


go 

alter table Products
	alter column price money

go 

execute sp_rename 'Sales' , 'SalesOrder'

select name, type
from sys.tables

exec sp_rename 'SalesOrder' , 'Sales'