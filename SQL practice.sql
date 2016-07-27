-- SQL commands 
-- selecting a table 
-- select * from <table name>

select * from HumanResources.Employee
--

select jobtitle, BirthDate, MaritalStatus, gender 
from HumanResources.Employee
--select loginid, jobtitle, birthdate, MaritalStatus, VacationHours
--from HumanResources.employee

-- Where  
select loginid, jobtitle, birthdate, maritalstatus, vacationhours
from HumanResources.Employee
where VacationHours < 10
--
select loginid, jobtitle, birthdate, maritalstatus, vacationhours
from HumanResources.Employee
where MaritalStatus = 'm'

--

select loginid, jobtitle, Gender, OrganizationLevel
from HumanResources.Employee
where Gender = 'm' or JobTitle = 'marketing specialist'

select LoginID, JobTitle, Gender, OrganizationLevel, SickLeaveHours
from HumanResources.Employee
where (MaritalStatus = 's' and Gender = 'm') or SickLeaveHours > 20

select loginid, jobtitle, gender, MaritalStatus, organizationlevel
from HumanResources.Employee
where Gender = 'm' and MaritalStatus = 's'
--

select loginid, jobtitle, Gender, MaritalStatus, VacationHours
from HumanResources.Employee
where (Gender = 'm' and VacationHours > 24) or MaritalStatus = 's'

-- IN 
select LoginID, JobTitle, BirthDate, Gender, MaritalStatus
from HumanResources.Employee
where JobTitle in ('marketing specialist', 'tool Designer', 'Janitor')

-- 
select *
from HumanResources.Employee
where JobTitle in ('chief executive officer' , 'vice president of engineering' , 'senior tool designer')

--LIKE
select LoginID, JobTitle, BirthDate, Gender, MaritalStatus
from HumanResources.Employee
where JobTitle like 'vice%'

-- %
select LoginID, JobTitle, BirthDate, Gender, MaritalStatus
from HumanResources.Employee
where JobTitle like '%engineer'

select LoginID, JobTitle, BirthDate, Gender, MaritalStatus
from HumanResources.Employee
where JobTitle like '%engineer%'


-- Like [first characters range][second character range]%
select LoginID, JobTitle, BirthDate, Gender, MaritalStatus
from HumanResources.Employee
where JobTitle like '[abcd]%'

select LoginID, JobTitle, BirthDate, Gender, MaritalStatus
from HumanResources.Employee
where JobTitle like '[abc][o]%' and Gender = 'm'

select LoginID, JobTitle, BirthDate, Gender, MaritalStatus
from HumanResources.Employee
where JobTitle like '[a-c][d-o]%'


--Between
select LoginID, JobTitle, BirthDate, Gender, MaritalStatus
from HumanResources.Employee
where BusinessEntityID between 20 and 30 

-----------------------------------------------------------
-- Creating a new table 

--Creating a Table 
create table SalesDepartment
(Emp_ID int primary key,
Emp_Name varchar(30),
Salary int
)

select * 
from SalesDepartment

-- Drop Table 
drop table SalesDepartment 

create table Sales
(Emp_id int primary key,
Emp_Name varchar (30),
Emp_Salary int,
Gender varchar 
)

select * from Sales

-- Insert data to the Newly created table 

insert into Sales 
values (1, 'alex', 1200, 'm'),
(2, 'John', 1300, 'm')
--
insert into Sales 
values(3, 'smith', 300000, 'm'),
(4, 'rahman', 20000, 'm'),
(5, 'rahman', 50000, 'm')

select * from Sales

-- Inserting data in to corresponding columnns 
insert into Sales (Emp_Name, Emp_Salary, Gender, Emp_id)
values
('Atif', 2400, 'm', 8)

select * from Sales 

insert into Sales (Emp_Name, Emp_Salary, Emp_id)
values
('Vikram', 1200, 25)

select * from Sales 


--Update table 

update Sales 
set Emp_Salary = 1700 
where Emp_id = 3

select * from Sales 

insert into Sales (Emp_id, Emp_Name, Emp_Salary, Gender)
values 
(11, 'Aney', 15000, 'f'),
(12, 'jonathan', 5500, 'm'),
(13, 'Walter', 2300, 'm')

select * from Sales

update Sales 
set Gender ='m'
where Emp_Name = 'vikram'

select * from Sales 

update Sales 
set Emp_Salary = 9999
where Emp_Name = 'Aney'

select * from Sales 
where Emp_Name = 'aney'

update Sales 
set Emp_Salary = 1000
where Emp_Salary between 1500 and 2000

select * from Sales 
where Emp_Salary = 1000

update Sales
set Emp_Salary = 888
where Emp_Salary between 1000 and 2000

select * from Sales 
where Emp_Salary = 888

update Sales 
set Emp_Salary = 3400
where Emp_Name like '[a-r][o-r]%'

select * from Sales 
where Emp_Salary = 3400

update Sales 
set Emp_Salary = 100 
where Emp_Name in ('rahman', 'aney')

select * from Sales 
where Emp_Salary = 100

update Sales 
set Emp_Salary = 200 
where Emp_id in (1,3,5,7)

select * from Sales 
where Emp_Salary = 200

-- Deleting Data 

delete from Sales 
where Emp_id = 2 
select * from Sales 

insert into Sales (Emp_Name, Emp_Salary,Emp_id, Gender)
values ('Arefin', 347, 15, 'm')

select * from Sales

delete from Sales 
where Emp_Name = 'aney'

select * from Sales 

--Alter 

alter table sales alter column emp_salary varchar(20)

select * from Sales 
alter table sales alter column emp_salary int 

select * from Sales 

--drop column 
alter table sales 
drop column gender 

select * from Sales 


-- Adding a column 

alter table sales 
add  Emp_gender varchar 

select * from Sales 
--
update Sales  
set emp_Gender = 'm' 
where Emp_id in (1,3,4,5,9)
 
select * from Sales 

update Sales  
set emp_Gender = 'f' 
where Emp_id not in (1,3,4,5,9)
 
select * from Sales 

alter table sales 
add Position varchar

select * from Sales 


alter table sales 
alter column position varchar (30)

update Sales 
set Position = 'Toll-free'
where emp_id between 10 and 20 
select * from Sales 
 
 update Sales 
 set position = 'Sales Floor'
 where Emp_id in (1,3,5,9)
 select * from Sales 
 
 update Sales 
 set position = 'Manager'
 where Emp_Name = 'atif' 
 
 select * from Sales 
 
 alter table sales 
 add Age int check (Age > 18)
 
 select * from Sales 
 
 update Sales 
 set position = 'manager'
 where Emp_id in (4,25)
 
 select * from Sales 
 
 update Sales 
 set position = 'Manager'
 where position = 'manager'
 
 select * from Sales 
 group by position
 -------------------------------------------------
 
 select * from emp
 select * from dept
 
 select * 
 from emp as e join dept as d 
 on e.dept_id = d.id
 
 select * 
 from emp as e left join dept as d 
 on e.dept_id = d.id 
 
 select * 
 from emp as e right join dept as d 
 on e.dept_id = d.id
 
 select * 
 from emp as e full join dept as d 
 on e.dept_id = d.id
 
 ---------------------variables 
 declare @id int 
 set @id = 4 
 select @id = 4
 
 print @id 
 select @id 
 
 print 'the value is ' + cast(@id as varchar(2))
 
 
 -- using variables in a query 
 declare @emp_id int 
 select @emp_id = 10
 
 select * from HumanResources.Employee
 
 
select Region 
from Customers
where Region = 'sp'

select * 
from Orders
where DATEPART(YEAR,OrderDate)= 1997

use AdventureWorks2008R2
go 
select * from HumanResources.Employee
select RANK()over (order by OrganizationLevel desc) from HumanResources.Employee


------------------------------------Start new practice--------------------------------
use AdventureWorks2008R2
go 

select * from HumanResources.Employee
exec sp_table