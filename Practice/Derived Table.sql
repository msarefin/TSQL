/*
Table expressions

--Drived Table 
--Common table expression
--view
--inline table valued function
*/


-- Derived table 

select categoryid, productid, productname, unitprice
from (
select ROW_NUMBER() over(partition by categoryid order by unitprice, productid) as rownum, 
categoryid, 
productid,
productname, 
unitprice 
from Production.Products) as d
where rownum <=2
;

-- Common table expression CTE 

with c1 as 
(
select ROW_NUMBER() over(partition by categoryid order by unitprice, productid) as rownum,
categoryid, productid, productname,unitprice
from Production.Products
),

c2 as 
(
select c.categoryid, c.categoryname, c.description
from Production.Categories as c
)
select c1.categoryid,c1.productname,c1.rownum,c2.categoryname,c2.description
from c1 inner join c2 on c1.categoryid=c2.categoryid;

--recursive CTE 
go

with r as
(
select empid, mgrid,CONCAT(firstname,' ',lastname) as 'name', 0 as d
from hr.Employees
where empid = 4
union all 
select e.empid,e.mgrid, CONCAT(e.firstname,' ',e.lastname) as 'name', d+1 as d 
from r
join hr.Employees as e on r.mgrid=e.empid
)
select 
empid, 
mgrid ,
case  when mgrid is null then 'Boss' else 'Employee' end as 'Status', name, d as 'level'  from r
order by empid
; 

