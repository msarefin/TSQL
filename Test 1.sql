select *
from HumanResources.EmployeeDepartmentHistory

select DepartmentID, COUNT (DepartmentID)Number_of_Employees
from HumanResources.EmployeeDepartmentHistory
group by DepartmentID 