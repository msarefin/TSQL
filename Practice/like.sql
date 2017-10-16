use TSQL2012;
go

select empid, firstname, lastname
from HR.Employees
where lastname like N'D%'
;

select empid, firstname, lastname
from HR.Employees
where lastname like '[abc]%';


select empid, firstname, lastname
from HR.Employees
where lastname like '[A-D]%'

select empid, firstname, lastname
from HR.Employees 
where lastname like '_a%'
;

select * 
from HR.Employees
where lastname like '^[cde]%'

