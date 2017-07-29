use TSQL2012;
go
--
--Chapter 1 
--Lesson 1
select country from hr.Employees;
--
select distinct country
from hr.Employees;
--
select e.empid, e.lastname
from hr.Employees as e;
--
select e.empid, e.lastname
from hr.Employees as e 
order by e.empid;
--

select e.empid, e.lastname
from hr.Employees as e
order by 2;
--

select e.empid, e.firstname+' '+e.lastname as Name 
from hr.Employees as e;

--
--Exercise 1 

select so.custid, YEAR(so.orderdate)
from Sales.Orders so;

--Exercise 2

select distinct so.custid, YEAR(so.orderdate) as 'OrderYear'
from Sales.Orders so;

--Lesson 2 

select s.shipperid, s.phone, s.companyname 
from Sales.Shippers as s;

select  e.country, YEAR(e.hiredate) as 'YearHired',count(*) as 'NumEmployees'
from hr.Employees as e
where e.hiredate >='20030101'
group by e.country, YEAR(e.hiredate)
having count(*) >1
order by e.country

--incorrect query 
--select country, YEAR(hiredate) as yearhired
--from hr.Employees
--where yearhired >=2003;
--The following message is displayed
--Msg 207, Level 16, State 1, Line 3
--Invalid column name 'yearhired'.


----
select custid, MAX(orderid) maxorderid
from Sales.Orders
group by custid;

--
select shipperid, SUM(freight) as totalfreight 
from Sales.Orders
--where freight >20000.00
group by shipperid
having SUM(freight)>20000;

--

select country, YEAR(hiredate) as 'yearhired', count(*) as numemployees, 'order by accepts the alies' 
from hr.Employees
where hiredate >= '20030101'
group by country, YEAR(hiredate)
having count(*)>1
order by country, yearhired desc;

-------
--chapter 2 

select empid, firstname, lastname 
from hr.Employees

--

select e.empid, e.firstname, e.lastname
from hr.Employees as e 

--

select e.empid, e.firstname + N' '+ e.lastname as 'Name' from hr.Employees e

--

select distinct country,region, city from hr.Employees

--

select 10 as col1, 'ABC' as col2

--
select s.shipperid, s.companyname, s.phone as 'Phone number' 
 from sales.Shippers as s;

--
--Lesson 2 

-- Data Type
--Exact Numeric (INT, NUMERIC)
--Character String (CHAR, VARCHAR)
--Unicode Character String (NCHAR, NVARCHAR)
--Approximate numeric(FLOAT, REAL)
--Binary String (BINARY, VARBINARY)
--Date and Time (DATE, TIME, DATETIME2, SMALLDATETIME,DATETIME,DATETIMEOFFSET)


--Data type and byte size

--INT				4 Byte
--TINYINT			1 Byte 
--NUMERIC
--CHAR
--VARCHAR
--NCHAR
--NVARCHAR
--FLOAT
--REAL
--BINARY
--VARBINARY
--DATE 
--TIME
--DATETIME2
--SMALLDATETIME
--DATETIME			8 Bytes
--DATETIMEOFFSET

DECLARE @f AS FLOAT = '29545428.022495'; 
SELECT @f,CAST(@f AS NUMERIC(28, 14)) AS value;
--

select 'ABC' as 'Regular Character', N'ABC' as 'UNICODE Character'

--

select CAST ('ABC' as int);
--select try_cast('abc' as int);

--

select convert(date,GETDATE(),101) Date ;

--
--select parse(GETDATE() as date using 'en-us')
--

select CURRENT_TIMESTAMP as Date
union all 
select GETUTCDATE() as Date
union all 
select SYSDATETIME() as Date
union all 
select SYSUTCDATETIME() as Date
union all 
select SYSDATETIMEOFFSET() as Date;



----
select CAST(SYSDATETIME() as date) as Date;

select DATEPART(MONTH,'20120101') as Date;
--

select DATEADD(YEAR,1,GETDATE()) as 'Add to date'
select DATEADD(YEAR,-2, GETDATE()) as 'Subtract from date'

select DATEDIFF(DAY,'19820105', GETDATE()) as 'days since birthday'
select DATEDIFF(MONTH,'19820105', GETDATE()) as 'Months since birth'
select DATEDIFF(YEAR, '19820105', GETDATE()) as 'years since birth'

select SWITCHOFFSET(SYSDATETIMEOFFSET(), '+08:00');
--

select 
SWITCHOFFSET('20130212 14:00:00.0000000 -08:00', '-05:00') AS [SWITCHOFFSET], 
TODATETIMEOFFSET('20130212 14:00:00.0000000', '-08:00') AS [TODATETIMEOFFSET];

--
--concatination 

select empid, country, region, city,
country+N','+ region+N','+city as [location]
from hr.Employees
--coalesce
select empid, country,region, city,
country+coalesce(N','+region,N'')+N','+city as [location] 
from hr.Employees
--concat works in 2012

select empid, country, region, city, 
concat(country+N','+city+N','+region) as location
from hr.Employees;

--substring 

select SUBSTRING('abcd',1,3);

select 
'psychotherapist' as [professon], 
LEFT('psychotherapist',6) as [LEFT],
CHARINDEX('the','Psychotherapist') as [the],
RIGHT('psychotherapist', 6) as [RIGHT];

--

select PATINDEX('%[0-9]%','abcd123efgh') as patindex

--
select replace('1.2.3.4.5','.','/') as Replace

select replicate('*',10);

select STUFF(',x,y,z,',1,1,'') Stuff

select UPPER('Constantinople') upper, LOWER('CONSTANTINOPLE') LOWER


select LTRIM(RTRIM('               There are spaces in both ends             ')) as 'LTRIM/RTRIM'

--
--case 
SELECT productid, productname, unitprice, discontinued, 
case discontinued
when 0 then 'no'
when 1 then 'Yes'
else 'unknown'
end as discounted 
from Production.Products
--


select empid, 
firstname+N''+ lastname as Fullname, YEAR(birthdate) as Birthyear
from hr.Employees;

--

select 
YEAR(GETDATE()) as 'Year', 
MONTH(GETDATE()) as 'Month',
DAY(GETDATE()) as 'Day'

---
select DATEADD(mm, DATEDIFF(m,0,GETDATE()),0)
----Last Day of Previous Month
SELECT DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0))
LastDay_PreviousMonth
----Last Day of Current Month
SELECT DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,0))
LastDay_CurrentMonth
----Last Day of Next Month
SELECT DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+2,0))
LastDay_NextMonth

----------------

select empid, firstname, lastname 
from HR.Employees 
where lastname like N'D%';

select * from sales.orders
where orderdate>='20070201' and orderdate <'20070301';

select * from sales.orders
where orderdate between '20070201' and '20070301';

------

--exercise 1 
select orderid, orderdate, custid, empid
from sales.orders
where shippeddate =  null;

-- When you say where condition is null, it simply means that the condition is unknown. so even of the result set exist you will get an empty table becaus its looking for an unknown

select orderid, orderdate, custid, empid 
from sales.orders where shippeddate is null;

select orderid, orderdate, custid, empid 
from sales.orders
where orderdate between '20080211' and '20080212';

select e.empid,e.firstname,e.lastname,e.city,MONTH(e.birthdate) as 'Birth Month' 
from hr.Employees as e
where e.country = N'usa' and region =N'WA';


select e.empid, e.firstname, e.lastname, e.country, e.region, e.city
from hr.Employees as e
where region = N'wa'
;

select e.empid, e.firstname, e.lastname, e.country, e.region, e.city
from hr.employees as e 
where e.region != N'wa'
;
-- The result set is null becasue the the column contains null values. when sql compares with columns containing nulls the result will be all nulls

select e.empid, e.firstname, e.lastname, e.lastname, e.country, e.city, e.region
from hr.employees as e 
where e.region <> N'wa' and e.region is null;

select e.empid, e.firstname, e.lastname, e.country, e.region, e.city 
from hr.employees as e
where e.region is null;

select e.empid, e.firstname, e.lastname, e.country, e.region, e.city
from hr.Employees e
where e.region = N'wa' or e.region is null;

select e.empid, e.firstname, e.lastname, e.country, e.region, e.city
from hr.Employees e
where e.region <> N'wa' or e.region is not null;

-- The result set shows only region with 'WA' becasue the first condition region <> 'WA' yields as unknow  because the colulmn has null. the second condition looks for regions with the values that are not null and so the regions with 'WA' is displayed

select e.empid, e.firstname, e.lastname, e.country, e.region, e.city
from hr.employees as e 
where not e.region = 'wa' or e.region is null;


select e.empid, e.firstname, e.lastname, e.country, e.region, e.city
from hr.employees as e 
where not e.region != 'wa' or e.region is null;
-- the not operator yilds the opposite of true

select e.empid,e.titleofcourtesy, e.firstname, e.lastname, e.country
from hr.Employees as e 
where not e.titleofcourtesy = 'ms.' or e.titleofcourtesy = 'mrs.' and e.country = 'usa'
;

select e.empid,e.titleofcourtesy, e.firstname, e.lastname, e.country
from hr.Employees as e 
where not e.titleofcourtesy = 'ms.' and e.country = 'usa' or e.titleofcourtesy = 'mrs.' 

-- The NOT operator preceeds AND and OR. The AND operator preceeds OR
-- the above query is inteprited as where (not e.titleofcourtesy = 'ms.' and e.country = 'usa') or (e.titleofcourtesy = 'mrs.' )
 
 select *
 from hr.Employees as e
where not e.titleofcourtesy = 'Mr' and (e.title ='Sales Representative' or e.city = 'london') and e.country = 'UK'

--

select *
from hr.employees as e
where e.firstname like 'D%' and e.lastname like '_u%' and e.title like '[vc]%' and e.city like '[k-t]%' and e.region like '[^1-4]%'
order by e.firstname


select * 
from sales.orders
where orderdate = '02/12/07'

select * from sales.orders
where orderdate = '20070212'
;


select * from sales.orders
where YEAR(orderdate) = 2007 and MONTH(orderdate) = 2
;

select s.orderid, s.orderdate, s.empid, s.custid
from sales.Orders as s
where s.orderdate >='20070201' and s.orderdate <='20070301'
;

select orderdate from sales.orders where orderdate between '20070101' and '20070228 23:59:59.999'
;
 select  top (3) percent * from Sales.Orders
 ;

 use TSQL2012
 go 
 select e.empid,e.firstname, e.lastname, e.city,
 MONTH(e.birthdate) as BirthMonth
 from hr.Employees as e where e.country = N'USA' and e.region = N'WA'
 order by e.city;


select e.empid, e.firstname, e.lastname, e.city,month(e.birthdate) as birthmonth 
from hr.Employees as e
where e.country = N'USA' and  e.region =N'WA' order by e.city desc
;

select 
e.empid, 
e.firstname, 
e.lastname, 
e.city, 
month(e.birthdate) as BirthMonth 
from hr.Employees as e 
where e.country = N'USA' and e.region = N'WA' 
order by e.city, e.empid
;
--- The Query below is ordere  by birth month and by city.

select e.empid, e.firstname, e.lastname, e.city
from hr.Employees as e
order by MONTH(e.birthdate), e.city
;

-- Distinct key word is used to get rid of duplictes 

select distinct e.city
from hr.employees as e 
;

-- when using DISTINCT key word the ORDER BY can only have columns that are in the select list 

select distinct e.city, e.region, e.country 
from hr.employees as e
--order by e.empid 
order by e.city
;


-- The forllowing query demonstrated that Nulls are sorted. The are displayed first if the order by is ascending (by default) and last if the order by is descending
select s.orderid, s.shippeddate
from sales.orders as s 
where s.custid = 20
order by s.shippeddate
;


select so.orderid, so.shippeddate 
from sales.orders as so
where so.custid = 20
order by so.shippeddate desc
;

--The order between rows with nulls are still arbitary and has no gurantee as to how the nulls cells are going to be ordered.

-- A querey without an order by clause returns a relational result and hence has no girantee as to their order. 

select s.orderid, s.empid, s.shipperid, s.shippeddate
from sales.orders as s 
where s.custid = 77
order by s.shipperid, s.shippeddate desc, s.orderid desc
;

select  top (3) s.orderid, s.orderdate, s.custid,  s.empid
from sales.orders as s
order by s.orderdate desc
;

select top (1) percent s.orderid, s.orderdate, s.custid, s.empid 
from 
sales.orders as s
order by s.orderdate desc
;

declare @n as bigint = 5;

select top (@n) orderid, orderdate, custid, empid from sales.orders
order by orderdate desc
;


-- The Querys below produces arbitary rows.
select top (3) orderid, orderdate, custid, empid

from sales.orders;

-- This query simply shows that you are intentionally aiming for an arbitary result set.
select top(3) orderid, orderdate, custid, empid
from sales.orders
order by (select null)
;

select orderid, orderdate, custid, empid from sales.orders 
order by orderdate desc, orderid desc

select s.orderid, s.orderdate, s.custid, s.empid
from sales.orders as s
order by s.orderdate desc ,s.orderid desc
offset 5 rows fetch next 5 rows only;

select orderid, orderdate, custid,empid
from sales.orders 
order by orderdate desc, orderid desc
offset 5 rows fetch first 5 rows only;


select orderid, orderdate, custid, empid
from sales.Orders
order by (select null)
offset 25 rows fetch next 5 rows only;

select * 
from sales.Orders
order by orderdate
offset 25 rows;

select top (3) with ties orderid, orderdate, custid, empid from sales.Orders
order by orderdate desc;

use TSQL2012
go 

--- Cross Join 
select d.n as days, s.n as shifts 
from dbo.Nums as d 
cross join dbo.Nums as s
where d.n <=7 and s.n <=3
order by days, shifts;


select * from dbo.Nums as d, dbo.nums as n where d.n <=7 and n.n <=3
order by d.n, n.n;


--Inner Join


select 
s.companyname as supplier, s.country, 
p.productid, p.productname, p.unitprice 
from Production.Suppliers as s inner join Production.products as p 
on s.supplierid = p.productid
where s.country = N'japan'
;

select s.companyname as supplier, s.country, 
p.productid, p.productname, p.unitprice
from Production.Suppliers as s inner join Production.Products as p
on p.productid=s.supplierid
where s.country = N'japan';


select 
e.firstname+N' '+e.lastname as emp, 
m.firstname+N' '+m.lastname as mgr 
from hr.Employees as e 
inner join hr.Employees as m 
on e.mgrid = m.empid
;

select 
e.title, e.firstname+N' '+e.lastname as Employee, 
e.mgrid, m.firstname+N' '+m.lastname as Manager
from hr.employees as e join hr.Employees as m on e.mgrid = m.empid
order by m.mgrid, e.mgrid
;


----Left Join

select 
e.firstname+N' '+e.lastname  as Manager, e.mgrid, 
m.empid,m.firstname+N''+m.lastname as Employee
from hr.Employees as e left join hr.Employees as m on m.mgrid= e.empid
;



SELECT 
S.companyname AS supplier, 
S.country, 
P.productid, 
P.productname, 
P.unitprice 
FROM Production.Suppliers AS S 
full JOIN Production.Products AS P ON S.supplierid = P.supplierid 
WHERE S.country = N'Japan';
;

select 
s.companyname as supplier, 
s.country, 
p.productid, 
p.productname, 
p.unitprice
from production.Suppliers as s left outer join Production.Products as p 
on s.supplierid = p.supplierid and s.country = N'Japan';


 
 declare @x varchar(10) = N'Bangladesh';
 declare @y varchar(5);

 select isnull(@y, @x) as'isnull',coalesce(@y,@x) as 'Coaleace',
 case @y
 when null then @x
 else @x
 end as 'Case';


 select 
 p.productid, 
 p.unitprice, 
 p.supplierid, 
 s.address, 
 s.city,
 s.region, 
 s.postalcode, 
 s.country, 
 s.fax
 from production.Products as p left outer join production.Suppliers as s on s.supplierid=p.supplierid and s.country = N'Japan';


 select e.empid, e.firstname+ N' '+ e.lastname as emp, m.firstname+N' ' + m.lastname as mgr 
 from  hr.Employees as e full outer join hr.employees as m on e.mgrid = m.empid;


 select s.supplierid, s.companyname as supplier,p.productname,p.unitprice ,c.categoryid, c.categoryname
 from Production.Suppliers as s 
 join Production.Products as p on s.supplierid= p.supplierid 
 join Production.Categories as c on c.categoryid=p.categoryid 
 where s.country = N'japan'

 select s.companyname as supplier, s.country, 
 p.productid, p.productname, p.unitprice, 
 c.categoryname
 from Production.Suppliers as s left outer join Production.Products as p on s.supplierid = p.supplierid
 inner join Production.Categories as c on c.categoryid=p.categoryid
 where s.country = N'Japan'
 ;
 
select s.companyname as Supplier, s.country, p.productid, p.productname, p.unitprice,
c.categoryname
from Production.Suppliers as s 
left outer join 
Production.Products as p on s.supplierid=p.supplierid
inner join Production.Categories as c on p.categoryid= c.categoryid
where s.country= N'japan'
;

select s.companyname as supplier, s.country, p.productid, p.productname, p.unitprice, c.categoryid 
from Production.Suppliers as s 
left outer join 
(Production.Products as p 
inner join Production.Categories as c on c.categoryid= p.categoryid) on s.supplierid = p.supplierid
where s.country = N'japan';

select * from sales.Customers as c 
inner join sales.orders as o 
on c.custid= o.custid


--suppose you want to return all suppliers form japan matching products where relevant.
-- For this you need to use production.suppliers, production. products, preserving suppliers. But you also need to use production.category 

select * from Production.Suppliers as s where s.supplierid is null
select * from Production.Products  as p where p.supplierid is null 
select * from Production.Categories as c where c.categoryid is null

go 

--select 
--s.companyname as Suppliers, s.country,
--p.productid, p.productname, p.unitprice,
--c.categoryname
--from Production.Products as p 
--left outer join 
--Production.Suppliers as s
--on p.supplierid = p.supplierid 
--inner join Production.Categories as c on c.categoryid = p.categoryid
--where s.country = N'Japan';

select s.companyname as Supplier, s.country, 
p.productid, p.productname, p.unitprice
from Production.suppliers as s 
left outer join 
(Production.Products as p --on s.supplierid = p.supplierid
inner join Production.Categories as c on p.categoryid= c.categoryid) on s.supplierid = p.supplierid
where s.country =N'japan';

------------

select * 
from Sales.Customers as c 
inner join 
sales.Orders as o 
on c.custid = o.custid;

----

select c.custid, c.companyname, o.orderid, o.orderdate
from sales.Customers as c 
left outer join 
sales.orders as o 
on c.custid = o.custid
;


--


select c.custid, c.companyname, o.orderid, o.orderdate
from Sales.Customers as c 
left outer join 
sales.orders as o
on c.custid = o.custid
where o.orderid is null
;

---

select c.custid, c.companyname, o.orderid, o.orderdate
from sales.Customers as c 
left outer join
sales.orders as o 
on c.custid = o.custid
and o.orderdate>='20080201'
and o.orderdate<='20080301'
;

-- The query above will simply match the tables in the left and right, not filter them!

select c.custid, c.companyname, o.orderid, o.orderdate
from sales.Customers as c 
left outer join
sales.orders as o 
on c.custid = o.custid
where
--and 
o.orderdate>='20080201'
and o.orderdate<='20080301'
;
--------------
-- Subqueries--
--acalar valued subquery--

select productid, productname, unitprice 
from Production.Products 
where unitprice = (select MIN(unitprice) from Production.Products);


--multivalued subquery 

select productid, productname, unitprice
from Production.Products 
where supplierid in (select supplierid from Production.Suppliers where country = N'Japan');


-- correlated supqueries 

select p1.categoryid, p1.productid, p1.productname, p1.unitprice
from production.Products as p1
where p1.unitprice = 
	(select MIN(unitprice) 
	from Production.Products as p2 where p2.categoryid = p1.categoryid);
	


Select p1.categoryid, p1.productid, p1.productname, p1.unitprice 
from Production.Products as p1
where p1.unitprice =(select MIN(p2.unitprice) from production.Products as p2 where p2.categoryid=p1.categoryid)
;

select * from Production.Products p where p.productid is null;
select * from Production.Categories c where c.categoryid is null;

select p.productid, p.productname, s.companyname as 'Suppler', s.address +N' '+ s.city+N' '+ s.country as 'Address' from Production.Products as p inner join Production.Suppliers as s on p.supplierid=s.supplierid
where p.unitprice = (select MIN(p1.unitprice) from Production.Products as p1 where p1.categoryid = p.categoryid);



-- The following queries has the same output  
------------------------------------------------------------------------------------------------------------------------------------------------------
select p.productid, p.productname, min(p.unitprice) as 'Minimum' from Production.Products as p group by p.productid, p.productname					--	

--																					
select p.productid, p.productname,p.unitprice	
from Production.Products as p 
where p.unitprice = (select MIN(x.unitprice) from Production.Products as x where x.productid = p.productid);			--

-- The second query filters data using the where clause in in the subquery. 																																					--		
------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------
 select c.custid, c.companyname 
 from sales.Customers as c 
 where exists 
 (select * from sales.Orders as o 
 where o.custid = c.custid and o.orderdate = '20070212');

 select c.custid, c.companyname from Sales.Customers as c 
 inner join 
 sales.Orders as d 
 on c.custid = d.custid 
 where d.orderdate = '20070212';

 select c.custid, c.companyname from sales.Customers as c 
 inner join 
 sales.orders as d 
 on c.custid = d.custid and d.orderdate = '20070212'
 ---------------------------------------------------------------------------
 -- The above queries all yield the same results althoug they are written differently. the last two queries are exactly the same with exception to the on clause. The second query uses wto conditions in the on clause that only performans a matching function unlike the second query which as the same condition in the where clause that filters the data.
 
  
select * from sales.Customers as c
where exists 
(select * from Sales.orders as d where d.custid = c.custid and d.orderdate = '20070212');

select * from sales.Customers as c where not exists(select * from Sales.Orders as d where d.custid = c.custid and d.orderdate = '20070212');

-- Table expression--

--Derived table 
select ROW_NUMBER() over (partition by p.categoryid order by p.unitprice, productid) as RowNum,p.categoryid, p.productid, p.productname, p.unitprice
from Production.products as p;
----------------------------------------------------------
select * from 
(select ROW_NUMBER() over (partition by categoryid order by unitprice, productid) as rownum, categoryid, productname,unitprice
from Production.Products) as D (rownum, catid, prodnam, unitprice)
where rownum <=2;


select s.supplierid, s.companyname, s.contactname, s.contactname, s.address, s.city, s.region, s.postalcode, s.phone, s.fax
from Production.Suppliers as s;


--common table expressions (CTE)

with c as 
(
select ROW_NUMBER() over(partition by categoryid order by unitprice, productid) as rownum, categoryid, productname, unitprice
from Production.Products)
select c.categoryid, c.productname, c.unitprice 
from c 
where c.rownum<=2;

--Recursive CTE

with EmpsCTE as 
(
select empid, mgrid, firstname,lastname, 0 as ranking
from hr.Employees --where empid = 9 
union all 
select m.empid, m.mgrid, m.firstname, m.lastname, s.ranking + 1 as ranking from EmpsCTE as s join hr.Employees as m  on s.mgrid = m.empid)

select empid, mgrid, firstname, lastname, ranking 
from EmpsCTE;


with PCTE as 
(select empid, firstname, lastname, title, mgrid, 0 as position from HR.Employees --where empid = 9 
union all 
select e.empid, e.firstname,e.lastname, e.title, e.mgrid, p.position+1 as position  from pcte as p inner join hr.Employees e on p.mgrid = e.empid
)
select * from PCTE;
---


with EmpCTE as 
(select e.empid, e.mgrid, e.firstname, e.lastname, 0  as Ranking from hr.Employees as e
 where e.empid = 9

union all 
select m.empid, m.mgrid,m.firstname, m.lastname, c.Ranking+1 as Ranking from EmpCTE as c inner join hr.Employees as m on c.mgrid=m.empid)

select * from EmpCTE;



--Views

if OBJECT_ID('hr.getmanagers', 'if') is not null drop function hr.getmanagers;
go 
create function hr.getmanagers(@empid as int) returns table 
as 
return 
with empcte as 
(
select empid, mgrid, firstname, lastname, 0 as distance
from hr.employees where empid = @empid
union all 
select m.empid, m.mgrid, m.firstname, m.lastname, s.distance + 1 as distance from empcte as s join hr.employees as m on s.mgrid = m.empid) 
select empid, mgrid, firstname, lastname, distance from empcte;
go 

select * from hr.getmanagers(9) as m;

-------------------
go 

--Ccross Apply 
--Cross apply yild the result set that you get when you perform inner join 

select p.productid, p.productname, p.unitprice
from Production.Products as p where p.supplierid = 1
order by p.unitprice,p.productid
offset 0 rows fetch first 2 rows only 
------------------
go 

select s.supplierid, s.companyname as supplier, A.* 
from Production.Suppliers as s 
cross apply
(select productid, productname, unitprice 
from Production.Products as p where p.supplierid = 1
order by p.unitprice, p.productid 
offset 0 rows fetch first 2 rows only) as A
 where s.country = N'Japan';
 
----------------------------

select s.supplierid, s.companyname as Suppliers, A.*
from Production.Suppliers as s 
cross apply 

			(select p.productid, p.productname, p.unitprice 
			from Production.Products as p where p.supplierid= s.supplierid
			order by p.unitprice,p.productid
			offset 0 rows fetch first 2 rows only
			)as A
where s.country = N'Japan';

-------------------------------------------------------------------------------------

--select s.supplierid, s.companyname, p.productid, p.unitprice
--from Production.Suppliers as s inner join Production.Products as p on p.supplierid = s.supplierid
--where s.country = N'Japan'
--order by p.unitprice, p.productid
----offset 0 rows fetch first 2 rows only 
--;


-- outer apply 

select s.supplierid, s.companyname as Supplyer, a.*
from Production.Suppliers as s 
outer apply 
(select p.productid, p.productname, p.unitprice 
from production.Products as p 
where p.supplierid = s.supplierid
order by p.unitprice, p.productid
offset 0 rows fetch first 2 rows only) as a
where s.country = N'japan';


-----

select p.categoryid,MIN(p.unitprice)
from production.Products as p group by p.categoryid;


go
--- 

with categoryCTE as
(
select p.categoryid, MIN(p.unitprice) 'Minimum Price'
from Production.Products as p group by p.categoryid)

select p.categoryid, p.productid, p.productname, p.unitprice 
from categoryCTE as c join Production.Products as p on p.categoryid=c.categoryid and p.unitprice = c.[Minimum Price];


--

if OBJECT_ID('Production.GetTopProducts','IF') is not null
drop function Production.GetTopProducts;
go 
create function Production.GetTopProducts(@supplierid as int, @n as bigint)
returns table 
as 
return 

select p.productid, p.productname, p.unitprice
from Production.Products as p 
where p.supplierid = @supplierid
order by p.unitprice, p.productid
offset 0 rows fetch first @n rows only;

go 
 
select * from Production.GetTopProducts(1,2) as p;

--------------

go 
select s.supplierid, s.companyname as suppliers, p.*
from Production.Suppliers as s 
cross apply 
Production.GetTopProducts(s.supplierid,2) as p 
where s.country = N'Japan';


--- outer apply 

select s.supplierid, s.companyname as Suppliers,a.* 
from production.Suppliers as s 
outer apply 
Production.GetTopProducts(s.supplierid,2) as a
where s.country =N'Japan';



if OBJECT_ID('Production.GetTopProducts', 'IF') is not null drop function Production.GetTopProducts;


---Set Operators 
--Union/Union all 
select e.country, e.region, e.city 
from hr.Employees as e 
union
select c.country,c.region,c.city
from sales.Customers as c ;


----


select e.country, e.region, e.city 
from hr.Employees as e 
union all 
select c.country, c.region, c.city 
from sales.Customers as c 

--intersect 

select e.country, e.region, e.city
from hr.Employees as e
intersect 
select c.country, c.region, c.city 
from Sales.Customers as c 
 
--except


select e.country, e.region, e.city
from hr.Employees as e 
except 
select c.country,c.region,c.city
from sales.Customers as c 


delete from Production.Suppliers where supplierid >29;
if OBJECT_ID('Sales.RankedProducts','V') is not null drop view sales.RankedProdcuts;
if OBJECT_ID('hr.getmanagers','if') is not null drop function hr.getmanagers;

---


select empid from sales.orders where custid = 1
except 
select empid from Sales.orders where custid = 2;



--Chapter 5: Grouping and windowing

select count(*) as numorders
from sales.Orders;

select shipperid, COUNT(*) as numorders 
from sales.Orders 
group by shipperid;

go 

select shipperid, year(shippeddate) as shippedyear, COUNT(*) as numorders 
from sales.orders
group by shipperid, YEAR(shippeddate)
order by shipperid, year(shippeddate);

go 

select shipperid, YEAR(shippeddate) as shippedyear,COUNT(*) as numorders 
from sales.Orders 
where shippeddate is not null 
group by shipperid, YEAR(shippeddate)
having COUNT(*)<100;

go 

select d.shipperid, COUNT(*) as numorders, COUNT(d.shippeddate) as shippedorderdates,MIN(d.shippeddate) as firstshipdate, MAX(d.shippeddate) lastshippeddate, SUM(d.freight) as totalvalue  
from Sales.Orders as d
group by d.shipperid;

select 
shipperid, 
COUNT(*) numoforders, COUNT(shippeddate) as shippedordersdate, min(shippeddate) as firstshippeddate, MAX(shippeddate), SUM(Sales.Orders.freight) sumvalue
from Sales.Orders group by shipperid
 

select shipperid, COUNT(distinct shippeddate) as numshippingdates from sales.Orders group by shipperid;


go

select s.shipperid, s.companyname, COUNT(*) as numorders 
from sales.Shippers as s 
join sales.Orders as o 
on s.shipperid = o.shipperid 
group by s.shipperid, s.companyname;

go 

select s.shipperid, MAX(s.companyname) as numoforders, COUNT(*) shipppedorders
from sales.Shippers as s inner join Sales.Orders as o on s.shipperid= o.shipperid
group by s.shipperid
;

go 

with c as 
(
select shipperid, COUNT(*) as numorders 
from sales.orders  
group by shipperid) 

select s.shipperid, s.companyname,numorders
from Sales.Shippers as s 
inner join c 
on s.shipperid = c.shipperid;


------------multiple grouping sets -----------------

select shipperid, YEAR(shippeddate) as ShipYear, COUNT(*) as numorders
from Sales.Orders
where shippeddate is not null
group by grouping sets	
(
(shipperid, YEAR(shippeddate)),
(shipperid),
(YEAR(shippeddate)),
()
)
;

go 

use TSQL2012
go
select d.shipperid, YEAR(d.shippeddate) as ShipYear, count(*)as numorders from Sales.Orders as d group by grouping sets ((d.shipperid, YEAR(shippeddate)),(d.shipperid),(YEAR(d.shippeddate)), ())

--except

--select t.shipperid, t.ShipYear, t.numorder from (

select d.shipperid, YEAR(d.shippeddate) as ShipYear, count(*) as numorder
from sales.Orders as d
where d.shippeddate is not null 
group by d.shipperid, YEAR(shippeddate)

union all

select d.shipperid, null as ShipYear, COUNT(*) as numorder
from sales.orders as d 
where d.shippeddate is not null
group by d.shipperid

union all 

select null as Shipperid, YEAR(shippeddate) as ShipYear, COUNT(*) numorder 
from sales.Orders as d 
where d.shippeddate is not null 
group by YEAR(d.shippeddate)

union all 

select null as Shipperid,null as ShipYear, count(*) as numorder
from Sales.Orders as d 
where d.shippeddate is not null
;

go 

-- The above query can be applied as follows 

select d.shipperid, YEAR(d.shippeddate) as 'Ship Year', count(*) as 'Num of Orders'
from sales.Orders as d 
where d.shippeddate is not null
group by grouping sets
(
(d.shipperid, year(d.shippeddate)),
(year(d.shippeddate)),
(d.shipperid),
()
)
order by [Ship Year], d.shipperid
;

--Create Table Employees
--(
--    Id int primary key,
--    Name nvarchar(50),
--    Gender nvarchar(10),
--    Salary int,
--    Country nvarchar(10)
--)
--Go

--Insert Into Employees Values (1, 'Mark', 'Male', 5000, 'USA')
--Insert Into Employees Values (2, 'John', 'Male', 4500, 'India')
--Insert Into Employees Values (3, 'Pam', 'Female', 5500, 'USA')
--Insert Into Employees Values (4, 'Sara', 'Female', 4000, 'India')
--Insert Into Employees Values (5, 'Todd', 'Male', 3500, 'India')
--Insert Into Employees Values (6, 'Mary', 'Female', 5000, 'UK')
--Insert Into Employees Values (7, 'Ben', 'Male', 6500, 'UK')
--Insert Into Employees Values (8, 'Elizabeth', 'Female', 7000, 'USA')
--Insert Into Employees Values (9, 'Tom', 'Male', 5500, 'UK')
--Insert Into Employees Values (10, 'Ron', 'Male', 5000, 'USA')
--Go


Select Country, Gender, Sum(Salary) as TotalSalary
From Employees 
Group By Country, Gender

union all

Select Country, null , Sum(Salary) as TotalSalary
From Employees 
Group By Country

union all 

Select null, Gender, Sum(Salary) as TotalSalary
From Employees 
Group By Gender

;

go 

-- Group by Cube 

select d.shipperid,YEAR(d.shippeddate) as ShipYear, COUNT(*) as numorders
from sales.Orders as d 
group by cube(d.shipperid, YEAR(d.shippeddate))
order by ShipYear;

--group by rollup


select d.shipcountry, d.shipregion, d.shipcity, COUNT(*) as numorders 
from sales.Orders as d
group by rollup(d.shipcountry, d.shipregion, d.shipcity);


---------------------------------------

select 
	d.shipcountry,  GROUPING(d.shipcountry) as grpcountry,
	d.shipregion, GROUPING(d.shipregion) as grpcountry,
	d.shipcity, GROUPING(d.shipcity) as grpcountry,
	COUNT(*) as numorders
from sales.orders as d 
group by rollup(d.shipcountry, d.shipregion, d.shipcity)
;
--------------------------------


select GROUPING_ID(d.shipcountry, d.shipregion, d.shipcity) as grp_id,
d.shipcountry, d.shipregion, d.shipcity, COUNT(*) as numorders
from sales.orders as d 
group by rollup (d.shipcountry, d.shipregion, d.shipcity);


---------------------

select c.custid,c.city, count (*) as 'Number of orders'
from sales.Customers as c join sales .Orders as d 
on c.custid = d.custid
where c.country = N'Spain'
group by c.custid, c.city;
;


------------------------

select c.custid,c.city, count (*) as 'Number of orders'
from sales.Customers as c join sales .Orders as d 
on c.custid = d.custid
where c.country = N'Spain'
group by grouping sets ((c.custid,c.city),())
order by GROUPING(c.custid)
;

select MAX(c.city), COUNT(*) counter
from Sales.Customers c
group by c.country
having COUNT(*) > 3
order by c.custid
;


-------------------------------------------

--Pivot table 

select d.custid, d.shipperid, SUM(d.freight) as 'Sum of Frights'
from sales.Orders as d 
group by d.custid, d.shipperid
;

----------------------------------------------------
select custid, shipperid, freight from sales.orders;

with PivotData as 
(
select 
d.custid,		-- Grouping Column
d.shipperid,	-- Spreading Column 
d.freight		-- aggrigation column
from sales.Orders as d
)

select custid,
[1],[2],[3] -- The Shipper ID 
from PivotData
pivot(sum(freight) for shipperid in ([1],[2],[3])) as p;


----
go 

select custid, [1],[2],[3]
from sales.Orders 
	pivot (
	sum(freight) for shipperid in ([1],[2],[3])
	) as p
;


---- Unpivote 

use TSQL2012
go 

if OBJECT_ID('sales.FreightTotals') is not null 
drop Table sales.FreightTotals;
go 

with PivotData as 
(
select custid, shipperid, freight
from sales.Orders
)

select * into sales.FreightTotals from PivotData
	pivot(sum(freight) for shipperid in ([1],[2],[3]))
as p;


select custid, Shipperid, Freight 
from sales.FreightTotals 
unpivot	(Freight for shipperid in ([1],[2],[3])) as u;

if OBJECT_ID('Sales.FreightTotals') is not null 
drop table Sales.FreightTotals;


------------------------------------------------------------------------

use TSQL2012;
go 

select YEAR(orderdate) as [Order Year], [1],[2][3] 
from sales.Orders
pivot (max(shippeddate) for shipperid in ([1],[2],[3])) as p;


----------------------

use TSQL2012; 
go 

with pivotdata as 
(select year(orderdate) as orderyear, shipperid, shippeddate
from sales.Orders)

select orderyear,[1],[2],[3]
from pivotdata
pivot (max(shippeddate) for shipperid in([1],[2],[3])) as p 



------------------------------------------


with pivotdata as 
(
select custid, shipperid from sales.Orders
)

select custid, [1],[2],[3] 
from pivotdata
pivot(count(shipperid) for shipperid in ([1],[2],[3])) as p


-------------------------------------------


with pivotdata as 

(
select 
custid,
shipperid, 
1 as aggcol 
from sales.orders
)

select custid, [1],[2],[3]
from pivotdata
	pivot(count(aggcol) for shipperid in ([1],[2],[3])) as p;


----------------

go 
 
use TSQL2012;

select d.custid, d.empid, d.freight
from sales.Orders as d ;



use TSQL2012; 

go

with pivotdata as 
(
select custid, shipperid,freight
from sales.Orders
)

select custid, [1],[2],[3]
from pivotdata

pivot(max(freight) for shipperid in ([1],[2],[3])) as p 


---------Unpivoting data 

use TSQL2012;
go 

if	OBJECT_ID('sales.FreightTotals') is not null drop table sales.FreightTotals;
go 

with unpivotdata as 
(
select custid, shipperid, freight 
from sales.Orders
)

select *
into sales.FreightTotals 
from unpivotdata
pivot(sum(freight) for shipperid in ([1],[2],[3])) as p 

select * from sales.FreightTotals


--unpivot the data from the table sales.FreightTotals


select custid, shipperid, freights
from sales.FreightTotals

unpivot	(freights for shipperid in ([1],[2],[3])) as u



select custid, shipperid, freight
from sales.FreightTotals

unpivot (freight for shipperid in ([1],[2],[3])) as u 


---Windowing


select custid, orderid, val, sum(val) over (partition by custid) as custtotal, sum(val) over() as grandtotal
from sales.OrderValues;


select custid, orderid, 
val, 
cast(100.0*val/SUM(val) over(partition by custid) as numeric(5,2)) as pctcust,
CAST(100.* val/ sum(val) over() as numeric(5,2)) as pcttotal
from sales.OrderValues;	


select custid, orderid, val, sum(val) over(partition by custid order by orderdate, orderid rows between unbounded preceding and current row) as runningtotal 
from sales.OrderValues;


----------------


select custid, orderid, val, 
sum(val) over(partition by custid order by custid) as CustTotal, 
sum(val) over () as GrandTotal
from sales.OrderValues


select custid, orderid, val, 
SUM(val) over(partition by custid) as CustTotal,
sum(val) over(partition by custid order by orderid) as CustGrandTotal--,
--SUM(val) over() as GrandTotal 
from sales.OrderValues;

---------------


select custid, orderid, val, 
CAST(100.0*val/sum(val) over(partition by custid) as numeric(5,2)) as PCtCust,
CAST(100.0* val/sum(val) over()as numeric(5,2)) as pctTotal
from Sales.OrderValues

select custid, orderid, orderdate, val, SUM(val) over (partition by custid order by orderdate, orderid rows between unbounded preceding  and current row) as RunningTotal
from sales.Ordervalues;

---- This is the message I want Git to see---

use TSQL2012
go 

select custid,orderid, orderdate, val,
sum(val) over(partition by custid 
order by orderdate, orderid 
rows between unbounded preceding 
and current row) as runningtotal
from Sales.OrderValues;

----------------------------------
select custid, orderid, val, 
SUM(val) over(partition by custid) as custtotal, 
sum(val) over() as grandtotal 
from sales.OrderValues;

-----------------------------------------

select custid, orderid, orderdate, val, 
sum(val) over (partition by custid order by orderdate, orderid
rows between unbounded preceding and current row) as RunningTotal,
sum(val) over (partition by custid order by orderdate, orderid
rows between unbounded preceding and unbounded following ) as Total,
sum(val) over (partition by custid order by orderdate, orderid 
rows between 2 preceding and current row) as non
from sales.OrderValues;
 
 -----------------------------------

 select serverproperty('isfulltextinstalled');

 exec sys.sp_help_fulltext_system_components 'filter';

-------------

select document_type, path from sys.fulltext_document_types;


---------------------------

use TSQL2012
go 

select ov.custid, ov.orderid, ov.orderdate, ov.val,
sum(val) over(partition by custid order by orderdate, orderid rows between unbounded preceding and current row) as RunningTotal,
sum(val) over(partition by custid order by orderdate, orderid rows between unbounded preceding and unbounded following) as WindowGrandTotal


--chapter 6 
use TSQL2012
go 

-- To check if full text search is installed run the following query

select serverproperty('isfulltextinstalled')


-- To check what filters are installed in your instance by using the following query 

exec sys.sp_help_fulltext_system_components 'filter';


--You can also use the following query to do the same

select document_type, path
from sys.fulltext_document_types;

-- To check which languages are supported in SQL Server 

select lcid, name
from sys.fulltext_languages
order by name;




--To check the current stopwords or stoplists 

-- Exercise 1 

select stoplist_id, name
from sys.fulltext_stoplists
select stoplist_id, stopword, language
from sys.fulltext_stopwords

exec sys.sp_fulltext_load_thesaurus_file 1033;
  
select serverproperty('isfulltextinstalled');

create table dbo.Documents
(
id int identity(1,1) not null,
title nvarchar(100) not null,
doctype nchar(4) not null,
docexcerpt nvarchar(1000) not null,
doccontent varbinary(max) not null,
constraint pk_Documents primary key clustered(id)
);

select * from dbo.Documents
-------------------------Adding data ------------------------------

insert into dbo.Documents
(title, doctype, docexcerpt, doccontent)
select N'columnstore Indices and Batch processing',
N'docx',
N'You should use a columnstore index on your fact tables, putting all columns of a fact table in a columnstone index. In addition to fact tables, very large dimensions could benefit from columnstore indices as well. Do not use columnstore indices for small dimensions.', 
bulkcolumn from openrowset(bulk 'C:\TK70461\Chapter 06\columnstoreindicesandbatchprocessing.docx', single_blob) as doc;

insert into dbo.Documents(title, doctype, docexcerpt, doccontent)
select N'introduction to data mining',
N'docx',
N'Using data mining is becoming more a necessity for every company and not an advantage for dome rare companies anymore.',
bulkcolumn from openrowset (bulk 'C:\TK70461\Chapter 06\IntroductionToDataMining.docx', single_blob) as doc;

insert into dbo.Documents (title, doctype, docexcerpt, doccontent)
select N'Why is Bleeding Edge a Different Conference',
N'docx',
N'During high elevel presentations attendees encounter many questions. For the third year, we are continuing with the breakfast Q&A session. It is very popular , and for two years now, we could not accomodate enough time for all questions and discussions!',
bulkcolumn from openrowset(bulk 'C:\TK70461\Chapter 06\Whyisbleedingedgeadifferentconference.docx', single_blob) as doc;

insert into dbo.documents (title, doctype, docexcerpt, doccontent)
select N'Additivity of Measures',
N'docx',
N'Aditivity of measure is not exactly a data  waredhouse design problem. However, you have to realize which aggrigate functions you will use when aggregating overwhich dimension.',
bulkcolumn from openrowset(bulk 'C:\TK70461\Chapter 06\additivityofmeasures.docx', single_blob) as doc;

select * from dbo.Documents
----------------------------------------------------------------


create SEARCH PROPERTY LIST WordSearchPropertyList;
go 
alter SEARCH PROPERTY LIST WordSearchPropertyList
add 'Authors'
with 
(property_set_guid = 'F29F85E0-4FF9-1068-AB91-08002B27B3D9',
property_int_id = 4,
property_Description = 'System.Authors - authors of a given item.');

----------------------------------------------------------------

CREATE FULLTEXT STOPLIST SQLStopList;
go 
ALTER FULLTEXT STOPLIST SQLStopList
add 'SQL' LANGUAGE 'English';

----------------------------------------------------------------

select w.stoplist_id, l.name, w.stopword, w.language 
from sys.fulltext_stopwords as w 
inner join 
sys.fulltext_stoplists as l 
on w.stoplist_id = l.stoplist_id;
------------------------------------------


select * 
from sys.dm_fts_parser
(N'"Additivity of measure is not exactly a data warehouse design problem. However , you have to realize which aggrigate functions you will use in report for which measure, and which aggrigate functions you will use when aggrigating over which dimension."', 1033, 5,0 );

select * 
from sys.dm_fts_parser('FORMSOF (INFLECTIONAL,'+'function'+')', 1033,5,0);

--Exerceise 2 

select * 
from 
sys.fulltext_semantic_language_statistics_database;

--Skipped chapter 6 to work on other chapters
----------------------------------------------------------------------

---------------------------Chapter 7 -------------------------------------



use TSQL2012
go


--XML Auto
--Attribute centric

select Customer.custid, Customer.companyname,
[Order].orderid, [Order].orderdate
from sales.Customers as [Customer]
inner join sales.Orders as [Order]
on Customer.custid = [Order].custid
where Customer.custid <=2 
and [Order].orderid %2 = 0
order by customer.custid, [order].orderid
for xml auto, root('CustomerOrders');

go 

with xmlnamespaces('tk461-CustomersOrders' as co)
select 
[co:Customer].custid as [co:custid],
[co:Customer].companyname as [co:companyname],
[co:Order].orderid as [co:custid],
[co:order].orderdate as [co:orderdate]
from Sales.Customers as [co:Customer]
inner join sales.Orders as [co:Order]
on [co:Customer].custid = [co:Order].custid
where [co:Customer].custid<=2
and [co:Order].orderid %2 =0
order by [co:Customer].custid, [co:Order].orderid
for xml auto, elements, root('CustomerOrders');


select * from sales.Customers as c inner join sales.orders as d on c.custid = d.custid
---------------------------------------


select [Customer].custid as [Custid],
[Customer].companyname as [CompanyName],
[Order].orderid as [OrderID],
[Order].orderdate as [Orderdate]
from sales.Customers as [Customer]
inner join sales.Orders as [Order]
on [Customer].custid = [Order].custid
where 1=2 
for xml auto, elements,xmlschema('tk461-CustomerOrders');

------------------------for xml raw --------------------------------

select customer.custid, customer.companyname, 
Orders.orderid, orders.orderdate 
from sales.Customers as [customer] inner join sales.Orders as [Orders]
on customer.custid=Orders.custid
where customer.custid<=2 and orders.orderid %2=0 
order by customer.custid, orders.orderid
for xml raw

--Enhanced

select customer.custid, customer.companyname, 
Orders.orderid, orders.orderdate 
from sales.Customers as [customer] inner join sales.Orders as [Orders]
on customer.custid=Orders.custid
where customer.custid<=2 and orders.orderid %2=0 
order by customer.custid, orders.orderid
for xml raw('Order'), root ('CustomerOrders');


------------------------------XML Xpath----------------------------------
-- The Folowing code will generate XPATH XML file 


select Customer.custid as [@custid],
Customer.companyname as [companyname]
from sales.Customers as Customer
where Customer.custid<=2
order by Customer.custid
for xml path ('customer'), root ('customers');

select custid, companyname
from Sales.Customers
where custid <=2
order by custid;



-----------------------XML shredding to SQL 


--===============================================underdtanding XML from youtube videos=============================================

go 

use AdventureWorks2008R2
go 
--XML auto 
--xml path 
--xml raw 
--xml explicit


--XML auto

Select 
	ProductID, 
	Name, 
	ProductNumber,
	ListPrice,
	ModifiedDate
from Production.Product
for xml auto --- Each column is an attribute

--XML path 

Select 
	ProductID, 
	Name, 
	ProductNumber,
	ListPrice,
	ModifiedDate
from Production.Product
for xml path ('Product') --- This does not include root but creates only XML fragments. ANd each column is an element


-- XML Path with Root 

select	
	ProductID,
	Name, 
	ListPrice, 
	ModifiedDate 
from Production.Product
for XML path ('Product'), root('PRODUCTS'); -- This creates XML fragments within a root


-------------------

select	
	ProductID AS [@PRODUCTID],
	Name AS [ProductInfo/Name], 
	ListPrice as [ProductInfo/ListPrice], 
	ModifiedDate 
from Production.Product
for XML path ('Product'), root('PRODUCTS');

select 
	ProductID as [@ProductID],
	Name as [ProductInfo/@Name],
	ListPrice as [ProductInfo/Listprice],
	ModifiedDate
from Production.Product
for xml path ('Product'), root('PRODUCTS');

-- XML also supports subquerys 

select * from Production.Product
select * from Production.ProductSubcategory

use AdventureWorks2008R2
go
select 
	psc.ProductSubcategoryID as [@ProductSubcategoryID],
	psc.Name as [@Name],
		(select
			p.ProductID, 
			p.Name, 
			p.ProductNumber,
			p.ListPrice,
			p.ModifiedDate 
		from Production.Product as p
		where p.ProductSubcategoryID=psc.ProductSubcategoryID
		and p.ProductID<=2 
		for xml path ('Product'), root ('Products'), type)
from Production.ProductSubcategory as psc
where psc.ProductSubcategoryID <=2
for xml path ('SubCategory'), root ('Subcategories');


-- The XML can be stored in a variable 


declare @xml as xml 
set @xml = 
(select 
	psc.ProductSubcategoryID as [@ProductSubcategoryID],
	psc.Name as [@Name],
		(select
			p.ProductID, 
			p.Name, 
			p.ProductNumber,
			p.ListPrice,
			p.ModifiedDate 
		from Production.Product as p
		where p.ProductSubcategoryID=psc.ProductSubcategoryID
		for xml path ('Product'), root ('Products'), type)
from Production.ProductSubcategory as psc
for xml path ('SubCategory'), root ('Subcategories'));

select @xml;

---------------------------------------------------------------------------
go 
use AdventureWorks2008R2;
go 

select 
	p.ProductID,
	p.Name,
	p.ListPrice,
	p.ModifiedDate
from Production.Product as p
for xml raw
;


------------------------------XML from book ------------------------
go
use TSQL2012;
go 


---------------------------------------------------------------------
select c.custid, c.companyname,
d.orderid, d.orderdate
from 
sales.Customers as c 
inner join 
sales.Orders as d on c.custid=d.custid
where c.custid <2 and d.orderid %2 = 0 
order by c.custid, d.orderid
for xml auto
;
-------------------------Atribute Centric --------------------------------------------
--<c custid="1" companyname="Customer NRZBB">
--  <d orderid="10692" orderdate="2007-10-03T00:00:00" />
--  <d orderid="10702" orderdate="2007-10-13T00:00:00" />
--  <d orderid="10952" orderdate="2008-03-16T00:00:00" />
--</c>
---------------------------------------------------------------------
select 
	c.custid, c.companyname,
	d.orderid, d.orderdate
from sales.Customers as c inner join sales.Orders as d 
on c.custid= d.custid
where c.custid<2 and d.orderid %2 = 0
order by c.custid, d.orderid
for xml auto,root('CustomerOrders');

--------------------------------XML output -Attribute centric -------------------------------


--<CustomerOrders>
--  <c custid="1" companyname="Customer NRZBB">
--    <d orderid="10692" orderdate="2007-10-03T00:00:00" />
--    <d orderid="10702" orderdate="2007-10-13T00:00:00" />
--    <d orderid="10952" orderdate="2008-03-16T00:00:00" />
--  </c>
--</CustomerOrders>

--------------------------------------------
go 

select c.custid, c.companyname,
d.orderid, d.orderdate
from 
sales.Customers as c 
inner join 
sales.Orders as d on c.custid=d.custid
where c.custid <2 and d.orderid %2 = 0 
order by c.custid, d.orderid
for xml auto, elements, root('CustomerOrders')
;

------------------------------Elememt Centric--------------------------------------------


--<CustomerOrders>
--  <c>
--    <custid>1</custid>
--    <companyname>Customer NRZBB</companyname>
--    <d>
--      <orderid>10692</orderid>
--      <orderdate>2007-10-03T00:00:00</orderdate>
--    </d>
--    <d>
--      <orderid>10702</orderid>
--      <orderdate>2007-10-13T00:00:00</orderdate>
--    </d>
--    <d>
--      <orderid>10952</orderid>
--      <orderdate>2008-03-16T00:00:00</orderdate>
--    </d>
--  </c>
--</CustomerOrders>

--============================================================--
----------------------------------------------------------------------------------------

select c.custid, c.companyname, 
d.orderid, d.orderdate
from sales.Customers as c inner join sales.Orders as d on c.custid = d.custid
where c.custid<=1 and d.orderid %2 =0
order by c.custid
for xml auto, elements, xmlschema('CustomerOrders') 

--<xsd:schema targetNamespace="CustomerOrders" xmlns:schema="CustomerOrders" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:sqltypes="http://schemas.microsoft.com/sqlserver/2004/sqltypes" elementFormDefault="qualified">
--  <xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/sqltypes" schemaLocation="http://schemas.microsoft.com/sqlserver/2004/sqltypes/sqltypes.xsd" />
--  <xsd:element name="c">
--    <xsd:complexType>
--      <xsd:sequence>
--        <xsd:element name="custid" type="sqltypes:int" />
--        <xsd:element name="companyname">
--          <xsd:simpleType>
--            <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
--              <xsd:maxLength value="40" />
--            </xsd:restriction>
--          </xsd:simpleType>
--        </xsd:element>
--        <xsd:element ref="schema:d" minOccurs="0" maxOccurs="unbounded" />
--      </xsd:sequence>
--    </xsd:complexType>
--  </xsd:element>
--  <xsd:element name="d">
--    <xsd:complexType>
--      <xsd:sequence>
--        <xsd:element name="orderid" type="sqltypes:int" />
--        <xsd:element name="orderdate" type="sqltypes:datetime" />
--      </xsd:sequence>
--    </xsd:complexType>
--  </xsd:element>
--</xsd:schema>
--<c xmlns="CustomerOrders">
--  <custid>1</custid>
--  <companyname>Customer NRZBB</companyname>
--  <d>
--    <orderid>10692</orderid>
--    <orderdate>2007-10-03T00:00:00</orderdate>
--  </d>
--  <d>
--    <orderid>10702</orderid>
--    <orderdate>2007-10-13T00:00:00</orderdate>
--  </d>
--  <d>
--    <orderid>10952</orderid>
--    <orderdate>2008-03-16T00:00:00</orderdate>
--  </d>
--</c>

---------------------------------XML RAW-----------------------------------
go 

use TSQL2012;
go 

select 
c.custid, c.companyname, d.orderid, d.orderdate 
from sales.Customers as c inner join Sales.Orders as d on c.custid=d.custid
where c.custid<2 and d.orderid %2 =0
order by c.custid, d.orderid 
for xml raw;

go 

--<row custid="1" companyname="Customer NRZBB" orderid="10692" orderdate="2007-10-03T00:00:00" />
--<row custid="1" companyname="Customer NRZBB" orderid="10702" orderdate="2007-10-13T00:00:00" />
--<row custid="1" companyname="Customer NRZBB" orderid="10952" orderdate="2008-03-16T00:00:00" />

go 

select 
c.custid,
c.companyname,
d.orderid,
d.orderdate
from sales.Customers as c inner join Sales.Orders as d on c.custid=d.custid
where c.custid <2 and d.orderid %2 = 0
order by c.custid,d.orderid 
for xml raw ('Order'), root ('CustomersOrders') 

--<CustomersOrders>
--  <Order custid="1" companyname="Customer NRZBB" orderid="10692" orderdate="2007-10-03T00:00:00" />
--  <Order custid="1" companyname="Customer NRZBB" orderid="10702" orderdate="2007-10-13T00:00:00" />
--  <Order custid="1" companyname="Customer NRZBB" orderid="10952" orderdate="2008-03-16T00:00:00" />
--</CustomersOrders>

-------------------------------XML AUTO ---------------------------------------------

WITH XMLNAMESPACES('TK461-CustomersOrders' AS co)
SELECT [co:Customer].custid AS [co:custid], 
 [co:Customer].companyname AS [co:companyname], 
 [co:Order].orderid AS [co:orderid], 
 [co:Order].orderdate AS [co:orderdate]
FROM Sales.Customers AS [co:Customer]
 INNER JOIN Sales.Orders AS [co:Order]
  ON [co:Customer].custid = [co:Order].custid
WHERE [co:Customer].custid <= 2
  AND [co:Order].orderid %2 = 0
ORDER BY [co:Customer].custid, [co:Order].orderid
FOR XML AUTO, ELEMENTS, ROOT('CustomersOrders');

--<CustomersOrders xmlns:co="TK461-CustomersOrders">
--  <co:Customer>
--    <co:custid>1</co:custid>
--    <co:companyname>Customer NRZBB</co:companyname>
--    <co:Order>
--      <co:orderid>10692</co:orderid>
--      <co:orderdate>2007-10-03T00:00:00</co:orderdate>
--    </co:Order>
--    <co:Order>
--      <co:orderid>10702</co:orderid>
--      <co:orderdate>2007-10-13T00:00:00</co:orderdate>
--    </co:Order>
--    <co:Order>
--      <co:orderid>10952</co:orderid>
--      <co:orderdate>2008-03-16T00:00:00</co:orderdate>
--    </co:Order>
--  </co:Customer>
--  <co:Customer>
--    <co:custid>2</co:custid>
--    <co:companyname>Customer MLTDN</co:companyname>
--    <co:Order>
--      <co:orderid>10308</co:orderid>
--      <co:orderdate>2006-09-18T00:00:00</co:orderdate>
--    </co:Order>
--    <co:Order>
--      <co:orderid>10926</co:orderid>
--      <co:orderdate>2008-03-04T00:00:00</co:orderdate>
--    </co:Order>
--  </co:Customer>
--</CustomersOrders>

-----------------------------XMLnameSpaces-------------------------------

with xmlnamespaces('CustomerOrder' AS co)
select 
[co:Customer].custid as [co:custid], 
[co:Customer].companyname as [co:companyname], 
[co:Orders].orderid as [co:orderid], 
[co:Orders].orderdate as [co:orderdate]
from 
Sales.Customers as [co:Customer] 
inner join 
sales.Orders as [co:Orders]
on [co:Customer].custid=[co:Orders].custid
where [co:Customer].custid<2 and [co:Orders].orderid %2=0
order by [co:Customer].custid, [co:Orders].orderid
for xml auto, elements, root('CustomerOrders');

------------------------xml X-Path--------------------------------------------

select 
c.custid as [@custid], 
c.companyname as [@companyname]
from sales.Customers as c
where c.custid <=2 
order by c.custid
for xml path ('Customer'), root('Customers')
;

--<Customers>
--  <Customer>
--    <custid>1</custid>
--    <companyname>Customer NRZBB</companyname>
--  </Customer>
--  <Customer>
--    <custid>2</custid>
--    <companyname>Customer MLTDN</companyname>
--  </Customer>
--</Customers>

---------------------------- retrive XML to SQL -----------------------------
go 
declare @x xml;
select @x=p
from openrowset (bulk 'c:\users\sunsh\documents\sql server management studio\products.xml', single_blob) as Products(p)
--select @x
declare @hdoc int
exec sp_xml_preparedocument @hdoc output, @x
select * 
from OPENXML (@hdoc,'/Subcategories/SubCategory',1)
with (ProductSubcategoryID int, Name varchar(100))
--order by  productsubcategoryid
exec sp_xml_removedocument @hdoc;

--=====================================================================================

go 
declare @x xml;
select @x=p
from openrowset (bulk 'c:\users\sunsh\documents\sql server management studio\products.xml', single_blob) as Products(p)
--select @x

declare @hdoc int

exec sp_xml_preparedocument @hdoc output, @x
select * 
from OPENXML (@hdoc,'/Subcategories/SubCategory/Products/Product',2)
with (
ProductID int,
Name varchar(100),
ProductNumber varchar(100),
ListPrice float,
ModifiedDate datetime
 )
--order by  productsubcategoryid
exec sp_xml_removedocument @hdoc;


   
--------------------------------------------------------------------
go 
declare @DocHandle as int;
declare @xmlDoc as nvarchar(1000);
set @xmlDoc = 
N'
<CustomersOrders> 
	<Customer custid="1"> 
		<companyname>Customer NRZBB</companyname> 
		<Order orderid="10692"> 
		<orderdate>2007-10-03T00:00:00</orderdate> 
		</Order> 
		<Order orderid="10702"> 
		<orderdate>2007-10-13T00:00:00</orderdate> 
		</Order> <Order orderid="10952"> 
		<orderdate>2008-03-16T00:00:00</orderdate> 
		</Order> 
	</Customer> 
	<Customer custid="2"> 
	                                                                                                                                                                              	<companyname>Customer MLTDN</companyname> 
		<Order orderid="10308"> 
		<orderdate>2006-09-18T00:00:00</orderdate> 
		</Order>
		<Order orderid="10926"> 
		<orderdate>2008-03-04T00:00:00</orderdate> 
		</Order> 
	</Customer> 
</CustomersOrders>';

exec sys.sp_xml_preparedocument @DocHandle output ,@xmlDoc;
select * from openxml(@DocHandle,'/CustomersOrders/Customer',1)
with(custid int, companyname nvarchar(40));


----------
go

use TSQL2012
go 

----XML Auto

select 
p.productid, p.productname, p.unitprice, p.discontinued 
from Production.Products as p 
where p.productid <=2
for xml auto, elements, root ('Products')
;
------------------ The following is the reult set---------------

--<Products>
--  <p>
--    <productid>1</productid>
--    <productname>Product HHYDP</productname>
--    <unitprice>18.0000</unitprice>
--    <discontinued>0</discontinued>
--  </p>
--  <p>
--    <productid>2</productid>
--    <productname>Product RECZE</productname>
--    <unitprice>19.0000</unitprice>
--    <discontinued>0</discontinued>
--  </p>
--</Products>

------------

select p.productid, p.productname, p.unitprice, p.categoryid
from Production.Products as p 
where p.productid <=2
for xml auto, elements, root('Products')
;
use TSQL2012
go 

select
p.productid, 
p.productname,
p.unitprice,
p.categoryid
from Production.Products as p
where p.productid <=2
for xml raw ('Product'), elements, root ('Products')
;

select 
p.productid as [@productid],
p.productname,
p.unitprice,
p.categoryid 
from Production.Products as p
where p.productid<=2
for xml path('Product'), root('products')
;

select
p.productid as [@productid], 
p.productname as [ProductInfo/@productname],
p.unitprice as [ProductInfo/unitprice], 
p.categoryid [ProductInfo/categoryaid]
from Production.Products as p
where p.productid <=2
for xml path ('Product'), root('Products')
;

select  
p.productid,
p.productname, 
p.unitprice, 
p.categoryid
from Production.Products  as p 
where p.productid<=2
;


use AdventureWorks2008R2
go 

declare @xml xml 
set @xml=
(
select 
psc.ProductSubcategoryID as [@ProductSubcategoryID],
psc.Name as [@Name],
(
	select 
	p.ProductID,
	p.Name,
	p.ProductNumber,
	p.ListPrice,
	p.ModifiedDate
	from Production.Product as p
	where p.ProductSubcategoryID=psc.ProductSubcategoryID 
	and p.ProductID <=2
	for xml path('Prodcut'), root('Products'), type
)
from Production.ProductSubcategory as psc
where psc.ProductSubcategoryID<=10
for xml path ('subcategory'), root('subcategories')
);

select  @xml as 'XML DATA'



-------------------- XQuery Basics---------------------

go

declare @x as xml;
set @x=N'
<root>
	<a>1
		<c>3</c>
		<d></d>
	</a>
	<b>2</b>
</root>
';
select 
@x.query('*') as complete_Sequence,
@x.query('data(*)')  as Complete_Data,
@x.query('data(root/a/c)') as Element_c_Data;


use TSQL2012;
go 

select c.custid, c.companyname, 
d.orderid, d.orderdate
from sales.Customers as c inner join sales.Orders as d on c.custid = d.custid
where c.custid<2 and d.orderid %2 =0
order by c.custid
for xml auto, elements, xmlschema('CustomerOrders') 
-------------------------------------------------------------------

go 

use AdventureWorks2008R2
go 
declare @x xml;
select @x=p
from openrowset (bulk 'c:\users\sunsh\documents\sql server management studio\products.xml', single_blob) as Products(p)
--select @x
declare @hdoc int
exec sp_xml_preparedocument @hdoc output, @x
select * 
from OPENXML (@hdoc,'/Subcategories/SubCategory',1)
with (ProductSubcategoryID int, Name varchar(100))
--order by  productsubcategoryid
exec sp_xml_removedocument @hdoc;


use AdventureWorks2008R2
go
select 
	psc.ProductSubcategoryID as [@ProductSubcategoryID],
	psc.Name as [@Name],
		(select
			p.ProductID, 
			p.Name, 
			p.ProductNumber,
			p.ListPrice,
			p.ModifiedDate 
		from Production.Product as p
		where p.ProductSubcategoryID=psc.ProductSubcategoryID
		and p.ProductID<=2 
		for xml path ('Product'), root ('Products'), type)
from Production.ProductSubcategory as psc
where psc.ProductSubcategoryID <=2
for xml path ('SubCategory'), root ('Subcategories');

go 

declare @Dochandle as int;
Declare @XMLDocument as Nvarchar(1000);
set @XMLDocument = N'
<CustomersOrders>
  <Customer custid="1">
    <companyname>Customer NRZBB</companyname>
    <Order orderid="10692">
      <orderdate>2007-10-03T00:00:00</orderdate>
    </Order>
    <Order orderid="10702">
      <orderdate>2007-10-13T00:00:00</orderdate>
    </Order>
    <Order orderid="10952">
      <orderdate>2008-03-16T00:00:00</orderdate>
    </Order>
  </Customer>
  <Customer custid="2">
    <companyname>Customer MLTDN</companyname>
    <Order orderid="10308">
      <orderdate>2006-09-18T00:00:00</orderdate>
    </Order>
    <Order orderid="10926">
      <orderdate>2008-03-04T00:00:00</orderdate>
    </Order>
  </Customer>
</CustomersOrders>';

exec sys.sp_xml_preparedocument @Dochandle  output, @XMLDocument;
-- Attribute centric Mapping 
select * from openxml(@Dochandle,'/CustomersOrders/Customer',1)
with(custid int, comopanyname varchar(40));
-- Element centrice Mapping
select * from openxml(@Dochandle, '/CustomersOrders/Customer',2)
with(cust int, companyname varchar(40));
-- Attribute and Element centric 
select * from openxml(@Dochandle, '/CustomersOrders/Customer',11)
with(custid int, compnayname varchar(40));

exec sys.sp_xml_removedocument @Dochandle
;


use TSQL2012;
go 
with xmlnamespaces('TK461-CustomerOrders' as co)
select 
	[co:Customer].custid, 
	[co:Customer].companyname, 
	[co:Orders].orderid, 
	[co:Orders].orderdate
from 
	sales.customers as [co:Customer] 
	inner join 
	sales.Orders as [co:Orders]
on [co:Customer].custid=[co:Orders].custid 
where	[co:Customer].custid<=2
and		[co:Orders].orderid %2 = 0
order by [co:Customer].custid, [co:Orders].orderid
for xml auto, elements, root('CustomersOrders')
;

use TSQL2012;
go 
declare @Dochandle as int;
declare @xmldoc	 as nvarchar(1000);
set @xmldoc = 
N'
<CustomerOrders>
	<Customer custid = "1">
	<companyname>Customer NRZBB</companyname>
	<Order orderid = "10692">
		<orderdate>2007-10-03T00:00:00</orderdate>
	</Order>
	<Order orderid ="10702">
		<orderdate>2007-10-13t00:00:00</orderdate>	
	</Order>
	<Order orderid="10592">
		<orderdate>2008-03-16T00:00:00</orderdate>
	</Order>
	</Customer>

	<Customer custid = "2">
	<companyname>Customer MLTDN</companyname>
	<Order orderid = "10308">
		<orderdate>2006-09-18T00:00:00</orderdate>
	</Order>
	<Order orderid ="10926">aa
		<orderdate>2008-03-04T00:00:00</orderdate>	
	</Order>
	</Customer>
</CustomerOrders>
'

exec sys.sp_xml_preparedocument @DocHandle output, @xmldoc;
select * from openxml(@DocHandle, '/CustomersOrders/Customer',1)
with (custid int, campanyname nvarchar(40));
exec sys.sp_xml_removedocument @DocHandle

---------------------------------------------------------------------

go 
use TSQL2012
go 

DECLARE @x AS XML;
SET @x='
<CustomersOrders xmlns:co="TK461-CustomersOrders">
<co:Customer co:custid="1" co:companyname="Customer NRZBB">
<co:Order co:orderid="10692" co:orderdate="2007-10-03T00:00:00" />
<co:Order co:orderid="10702" co:orderdate="2007-10-13T00:00:00" />
<co:Order co:orderid="10952" co:orderdate="2008-03-16T00:00:00" />
</co:Customer>
<co:Customer co:custid="2" co:companyname="Customer MLTDN">
<co:Order co:orderid="10308" co:orderdate="2006-09-18T00:00:00" />
<co:Order co:orderid="10926" co:orderdate="2008-03-04T00:00:00" />
</co:Customer>
</CustomersOrders>';
-- Namespace in prolog of XQuery
SELECT @x.query('
(: explicit namespace :)
declare namespace co="TK461-CustomersOrders";
//co:Customer[1]/*') AS [Explicit namespace];
-- Default namespace for all elements in prolog of XQuery
SELECT @x.query('
(: default namespace :)
declare default element namespace "TK461-CustomersOrders";
//Customer[1]/*') AS [Default element namespace];
-- Namespace defined in WITH clause of T-SQL SELECT
WITH XMLNAMESPACES('TK461-CustomersOrders' AS co)
SELECT @x.query('
(: namespace declared in T-SQL :)
//co:Customer[1]/*') AS [Namespace in WITH clause];

------------------------------------------
go
DECLARE @x AS XML;
SET @x=N'
<root>
<a>1<c>3</c><d>4</d></a>
<b>2</b>
</root>';
SELECT
@x.query('*') AS Complete_Sequence,
@x.query('data(*)') AS Complete_Data,
@x.query('data(root/a/c)') AS Element_c_Data;


go 

use TSQL2012;
go 
declare @dochandle as int;
declare @xmlDoc as varchar(1000);
set @xmlDoc = (

select c.custid as [@custid],
c.companyname, 
d.orderid as [Order/@orderid], 
d.orderdate as [Order/orderdate]
from Sales.Customers as c inner join sales.Orders as d on c.custid=d.custid
where c.custid <=2
order by c.custid
offset 0 rows fetch next 2 rows only
for xml path('Customer'), root('CustomerOrders')
);

exec sys.sp_xml_preparedocument @dochandle output, @xmlDoc;
select * from openxml(@Dochandle, 'CustomerOrders/Customer',11) with (custid int, companyname varchar(100))

exec sys.sp_xml_removedocument @dochandle;


go 
declare	@doch as int;
declare @xmlD as varchar(1000);

set @xmlD = N'
<CustomerOrders>
  <Customer custid="1">
    <companyname>Customer NRZBB</companyname>
    <Order orderid="10643">
      <orderdate>2007-08-25T00:00:00</orderdate>
    </Order>
  </Customer>
  <Customer custid="1">
    <companyname>Customer NRZBB</companyname>
    <Order orderid="10692">
      <orderdate>2007-10-03T00:00:00</orderdate>
    </Order>
  </Customer>
</CustomerOrders>
';
exec sys.sp_xml_preparedocument @doch output, @xmlD;
select * from openxml(@doch, 'CustomerOrders/Customer', 2) with (custid int, companyname varchar(30))
exec sys.sp_xml_removedocument @doch;

exec sys.sp_xml_preparedocument @doch output, @xmld;
select * from openxml(@doch,'CustomerOrders/Customer',11) with (custid int, companyname varchar(30));
exec sys.sp_xml_removedocument @doch

go 

-----

use AdventureWorks2008R2;

go 

select * from Production.Product
select * from Production.ProductSubcategory


select 
p.ProductID,
p.Name, 
p.ProductNumber,
p.ListPrice, 
p.ModifiedDate
from Production.Product as p 

go

use AdventureWorks2008R2
go 
select 
psc.ProductCategoryID as  [@ProductCategoryID], psc.Name as [@Name], 
(select 
p.ProductID,
p.Name, 
p.ProductNumber,
p.ListPrice, 
p.ModifiedDate
from Production.Product as p 
where p.ProductSubcategoryID= psc.ProductSubcategoryID 
for xml path ('Product'), root('Products'), type)
from Production.ProductSubcategory as psc
for xml path ('Subcategory'), root('Subcategories');


----------------- Loading XML documents to SQL server -----------------
declare @x as xml

select @x=p from openrowset (bulk 'C:\Users\sun\Documents\SQL\SQL Practice and class\XML Files\XML_to_SQL\products.xml', single_blob) as products(p)

select @x

declare @dochandle as int 

exec sp_xml_preparedocument @dochandle output, @x

select * from openxml(@dochandle, 'Subcategories/Subcategory',11) with (ProductCategoryID int , Name varchar(30))
select * from openxml(@dochandle, 'Subcategories/Subcategory/Products/Product',11) with (ProductID  int , Name varchar(30), ProductNumber varchar(100), ListPrice float, ModifiedDate datetime)
select * from openxml(@dochandle, 'Subcategories/Subcategory/Products/Product',11) with (ProductCategoryID	  int  '../../@ProducrSubcategoryId', 
productSubcategoryName varchar(30) '../../@Name',ProductID  int , Name varchar(30), ProductNumber varchar(100), ListPrice float, ModifiedDate datetime)

exec sp_xml_removedocument @dochandle;
go 

use AdventureWorks2008R2
go 
declare @xml as xml 
set @xml = 
(
select 
psc.ProductCategoryID as  [@ProductCategoryID], psc.Name as [@Name], 
(select 
p.ProductID,
p.Name, 
p.ProductNumber,
p.ListPrice, 
p.ModifiedDate
from Production.Product as p 
where p.ProductSubcategoryID= psc.ProductSubcategoryID 
for xml path ('Product'), root('Products'), type)
from Production.ProductSubcategory as psc
for xml path ('Subcategory'), root('Subcategories')
);

--select @xml as XML_File ;
declare @docHandle as int 

exec sys.sp_xml_preparedocument @dochandle output, @xml;
select * from openxml(@dochandle,'Subcategories/Subcategory', 11) with (ProductCategoryID int, Name varchar(40));
select * from openxml(@dochandle,'Subcategories/Subcategory/Products/Product',2) with (ProductID int, Name varchar(40), ProductNumber nvarchar(40), ListPrice float, ModifiedDate datetime);
select * from openxml(@dochandle,'Subcategories/Subcategory/Products/Product',2) with (ProductCategoryID int '../../@ProductCategoryID', ProductCategoryName varchar(40)'../../@Name', ProductID int, Name nvarchar(40), ProductNumber nvarchar(40), ListPrice float, ModifiedDate datetime);
--select * from openxml(@dochandle,'Subcategories/Subcategory/Products/product',11)with (ProductCategoryID int '../../@ProductCategoryID', ProductCategoryName varchar(40)'../../@Name', ProductID int, Name nvarchar(40), ProductNumber nvarchar(40), ListPrice float, ModifiedDate datetime);
exec sys.sp_xml_removedocument @dochandle;


-------------------------

go 
use AdventureWorks2008R2
go 

declare @xml as xml;
set @xml = (

select 
psc.ProductCategoryID as  [@ProductCategoryID], psc.Name as [@Name], 
(select 
p.ProductID,
p.Name, 
p.ProductNumber,
p.ListPrice, 
p.ModifiedDate
from Production.Product as p 
where p.ProductSubcategoryID= psc.ProductSubcategoryID 
for xml path ('Product'), root('Products'), type)
from Production.ProductSubcategory as psc
for xml path ('Subcategory'), root('Subcategories')

)
--select @xml

declare @doch as int;
exec sys.sp_xml_preparedocument @doch output, @xml
--select @doch 'Document handle number'
select * from openxml(@doch,'Subcategories/Subcategory', 1) with (ProductCategoryID int, CategoryName varchar(40),ProductID int, Name varchar(40), ProductNumber varchar(40), ListPrice float, ModifiedDate datetime);
select * from openxml(@doch,'Subcategories/Subcategory/Products/Product',11) with (ProductCategoryID int '../../@ProductCategoryID', SubcategoryName varchar(100) '../../@Name',ProductID int, Name varchar(40),ProductNumber varchar(40), ListPrice float, ModifiedDate datetime)
-- The path '../../@ProductCategoryID' and '../../@Name' points to <Subcategory ProductCategoryID="1" Name="Mountain Bikes"> in the XML document
exec sys.sp_xml_removedocument @doch

-------------

--

go 

declare @x as xml 
set @x = '
<Orders>
	<Order OrderID="100" OrderDate="1/30/2012">
		<OrderDetails ProductID="1" Quantity="3">
			<Price>350</Price>
		</OrderDetails>
		<OrderDetails ProductID="2" Quantity="8">
			<Price>500</Price>
		</OrderDetails>
		<OrderDetails ProductID="3" Quantity="10">
			<Price>700</Price>
		</OrderDetails>
	</Order>
	<Order OrderID="200" OrderDate="2/15/2012">
		<OrderDetails ProductID="4" Quantity="5">
			<Price>120</Price>
		</OrderDetails>
	</Order>
</Orders>
'
select @x.query('*') as 'XQuery', 'Entire Document' as Details
union all
select @x.query('/') as 'XQuery', 'Entire Document' as Details
union all
select @x.query('/Orders') as 'XQuery', 'Entire Document' as Details
union all
select @x.query('/Orders/Order/OrderDetails') as 'XQuery', 'OrderDetails Fragments' as Details
union all 
select @x.query('/Orders/Order/OrderDetails[2]') as 'XQuery', 'OrderDetails Fragments at the second position' as Details
union all 
select @x.query('/Orders/Order/OrderDetails[@ProductID="3"]') as 'XQuery', 'OrderDetails Fragments where productID = 3' as Details
union all 
select @x.query('/Orders/Order[@OrderID="100"]') as 'XQuery', 'Orders Where OrderID = 100' as Details
union all 
select @x.query('/Orders/Order[@OrderID="100"]/OrderDetails[Price>600]') as 'XQuery', 'Orders Where OrderID = 100 and price is greater than 600' as Details
--===========================================================================================================================================================--
select @x.value('/Orders[1]/Order[@OrderID="100"][1]/OrderDetails[Price>600][1]', 'float') as XValue
--===========================================================================================================================================================--
select @x.value('/Orders[1]/Order[@OrderID="200"][1]/@OrderDate', 'Datetime') as XValue
--===========================================================================================================================================================--


go 

declare @x as xml =N'';
select @x.query('(1,2,3)=(2,4)');	--True
select @x.query('(5,6)<(2,4)');
select @x.query('(1,2,3)=1');
select @x.query('(1,2,3)!=1');

go 

--	General	*	Value *	Description
--================================
--		=		eq		Equal
--		!=		ne		not equal 
--		<		lt		less than 
--		<=		le		less than or equal to 
--		>		gt		greater than 
--		>=		ge		greater than or equal to


declare @x as xml = N'';
select @x.query('(5) lt (2)');
select @x.query('(1) eq 1');
select @x.query('(1) ne 1');
go 

declare @x as xml = N'';
select @x.query('(2,2) eq (2,2)');
go 

--Conditionla expression 

declare @x as xml = N'
<Employee empid = "2">
	<FirstName>fname</FirstName>
	<LastName>lname</LastName>
</Employee>
'
;

declare @v as nvarchar(20) = N'FirstName';
select @x.query('
if(sql:variable("@v")= "FirstName") then 
/Employee/FirstName
else 
/Employee/LastName
') as FirstOrLastName;
go 

--FLWOR Expression 

--For 
--let 
--where 
--orderby 
--return 
go 


declare @x as xml;
set @x = N'
<CustomersOrders>
  <Customer custid="1">
    <!-- Comment 111 -->
    <companyname>Customer NRZBB</companyname>
    <Order orderid="10692">
      <orderdate>2007-10-03T00:00:00</orderdate>
    </Order>
    <Order orderid="10702">
      <orderdate>2007-10-13T00:00:00</orderdate>
    </Order>
    <Order orderid="10952">
      <orderdate>2008-03-16T00:00:00</orderdate>
    </Order>
  </Customer>
  <Customer custid="2">
    <!-- Comment 222 -->  
    <companyname>Customer MLTDN</companyname>
    <Order orderid="10308">
      <orderdate>2006-09-18T00:00:00</orderdate>
    </Order>
    <Order orderid="10952">
      <orderdate>2008-03-04T00:00:00</orderdate>
    </Order>
  </Customer>
</CustomersOrders>';
select @x.query('for $i in CustomersOrders/Customer/Order
let $j :=$i/orderdate
where $i/@orderid < 10900
order by ($j)[1]
return 
<Order-orderid-element><orderid>{data($i/@orderid)}</orderid>
{$j}
</Order-orderid-element>')
as [Filtered, sorted and refprmatted orders with let clause];

--Exercise 
go
declare @x as xml 
set @x = N'
<CustomerOrders>
	<Customer custid = "1">
		<!--Comment 111-->
		<companyname>Customer NRZBB</companyname>
		<Order orderid ="10692">
			<orderdate>2007-10-03T00:00:00</orderdate>
		</Order>
		<Order orderid ="10702">
			<orderdate>2007-10-13T00:00:00</orderdate>
		</Order>
		<Order orderid ="10952">
			<orderdate>2008-03-16T00:00:00</orderdate>
		</Order>
	</Customer>
	<Customer custid = "2">
		<!--Comment 222-->
		<companyname>Customer MLTDN</companyname>
		<Order orderid ="10308">
			<orderdate>2006-09-18T00:00:00</orderdate>
		</Order>
		<Order orderid ="10952">
			<orderdate>2008-03-04T00:00:00</orderdate>
		</Order>
	</Customer>
</CustomerOrders>
'
;

--Principal node 
select @x.query('CustomerOrders/Customer/*') as 'Output', '1. Principal nodes' as 'Node Type'
union all
select @x.query('CustomerOrders/Customer/node()') as 'Output', '2. All nodes' as 'Node Type'
union all 
select @x.query('CustomerOrders/Customer/comment()')  as 'Output', '3. Comment nodes' as 'Node Type';



--Xpath expression with predicates 

go 

declare @x as xml 
set @x = N'
<CustomersOrders>
  <Customer custid="1">
    <!-- Comment 111 -->
    <companyname>Customer NRZBB</companyname>
    <Order orderid="10692">
      <orderdate>2007-10-03T00:00:00</orderdate>
    </Order>
    <Order orderid="10702">
      <orderdate>2007-10-13T00:00:00</orderdate>
    </Order>
    <Order orderid="10952">
      <orderdate>2008-03-16T00:00:00</orderdate>
    </Order>
  </Customer>
  <Customer custid="2">
    <!-- Comment 222 -->
    <companyname>Customer MLTDN</companyname>
    <Order orderid="10308">
      <orderdate>2006-09-18T00:00:00</orderdate>
    </Order>
    <Order orderid="10952">
      <orderdate>2008-03-04T00:00:00</orderdate>
    </Order>
  </Customer>
</CustomersOrders>
'
;

select @x.query('//Customer[@custid =2]/Order') as [4 Customer 2 orders]

select @x.query('//Order[@orderid=10952]') as [5. orders with orderid=10952]

select @x.query('(/CustomersOrders/Customer/Order/parent::Customer)[2]') as [6. 2nd Customer with at least one Order]

go 
use TSQL2012
go 

Select c.country as [CustomerDetails/@country],c.companyname as [CustomerDetails/companyname], c.contacttitle as [CustomerDetails/contacttitle],c.contactname as [CustomerDetails/contactname], c.address as [CustomerDetails/address], c.city as [CustomerDetails/city]
from Sales.Customers as c
where c.country = 'USA'
order by c.companyname
for xml path ('Customer') ,root('Customers');

-----
go  

declare @x as xml 
set @x = N'
<CustomersOrder>
	<Customer custid ="1">
		<!--Comment 111-->
		<companyname>Customer NRZBB</companyname>
		<Order orderid ="10692">
			<orderdate>2007-10-03-16T00:00:00</orderdate>
		</Order>
		<Order orderid ="10702">
			<orderdate>2007-10-13T00:00:00</orderdate>
		</Order>
		<Order orderid ="10952">
			<orderdate>2008-03-16T00:00:00</orderdate>
		</Order>
	</Customer>
	<Customer>
		<!--Comment 222-->
		<companyname>Customer MLTDN</companyname>
		<Order orderid ="10308">
			<orderdate>2006-09-18T00:00:00</orderdate>
		</Order>
		<Order orderid ="10952">
			<orderdate>2008-03--04T00:00:00</orderdate>
		</Order>
	</Customer>
</CustomersOrder>
';
select @x.query('for $i in CustomersOrder/Customer/Order
				let $j := $i/orderdate
				where $i/ @orderid < 10900
				order by ($j)[1]
				return 
				<Order-orderid-element>
					<orderid>{data($i/@orderid)}</orderid>
					{$j}
				</Order-orderid-element>')
as [Filtered, sorted and reformatted orders with let clause]
;
---Manufacturing concent-------

go 

alter table production.products
add additionalattributes xml null;

select * from Production.products
---------------------------------------------------------------------------------------

--------- Auxilary table ----------

create table dbo.Beverages (percentvitaminesRDA int);
create table dbo.Condiments (shortdescription nvarchar(50));
go 
--Store the scema in a variable and create the collection

declare @myScema nvarchar(max);
set @myScema = N'';
set @myScema = @myScema + 
(select * from Beverages for xml auto, elements, xmlschema('Beverages'));
set @myScema = @myScema+
(select * from Condiments for xml auto, elements, xmlschema('Condiments'));
create xml schema collection dbo.ProductsAdditionalAttributes as @myScema;
go 
--Drop the auxilary tables 
drop table dbo.Beverages, dbo.Condiments;
go 

-------------------------------------

alter table production.products
alter column additionalattributes
xml(dbo.ProductsAdditionalAttributes);

select * from Production.Products;

select * from sys.xml_schema_collections;

------------------------------------------------------

---------------------------------------------------------
go 
--Function to retrive the namespace 

create function dbo.GetnameSpace(@chkcol xml)
returns nvarchar(15)
as begin 
return @chkco.value('namespace-uri((/*)[1])','nvarchar(15)')
end;
go 

--fucntion to retrive the category 

create function dbo.GetCategoryName(@catid int)
returns nvarchar(15)
as begin 
return 
(select categoryname from Production.Categories where categoryid = @catid)
end;

go 

-- add the Constraint

Alter Table Production.Products add Constraint ck_Namespce 
check(dbo.GetNameSpace(additionalattributes)=dbo.GetCategoryName(Categoryid));

go 

--Inserting some valid data into the table

update Production.Products 
set additionalattributes = N'
<Beverages xmlns="Beverages">
<percentvitaminsRDA>27</percentvitaminsRDA>
</Beverages>'
where productid = 1;

update Production.products
set additionalattributes = N'
<Condiments xmlns = "Condiments">
<shortdescription>very sweet</shortdescription>
</Condiments>'
where productid = 3;

select productid, productname, additionalattributes 
from Production.Products;

--Inserting invalid data 

go 

update production.products 
set additionalattributes = N'
<Beverages xmlns= "Beverages">
<percentvitaminsRDA>twenty seven</percentvitaminsRDA>
</Beverages>
'
where productid =1;

update Production.products
set additionalattributes = N'
<Condiments xmlns>
<shortdescription>very sweet </shortdescription>
</Condiments>
'
where productid = 2;

update Production.Products
set additionalattributes = N'
<Condiments xmlns= "Condiments">
<unknownelement>very sweet</unknownelemnet>
</Condiments>
'
where productid =3;


-- cleanup the table 

go 
alter table production.products
drop constraint ck_Namespace;

alter table production.products 
drop column additionalattributes;

drop XML schema collection 
dbo.productionattributes;
drop function dbo.GetnameSpace;
drop function dbo.GetCategoryName;
go 

--chapter 8 creating table and enforcing data integrity 

select TOP (10) categoryname
from Production.Categories;


--The following four builtin database aschema cannot be dropped
--dbo - default schema for db_owner or db_ddl_admin
--guest - schema used for objects that will be availble to guest users
--INFORMATION_SCHEMA - 
--sys - This scema is reserved for system objects such as system tables and views

select name from master.dbo.sysdatabases

GO
create database SQL_PRACTICE;

use SQL_PRACTICE
go 
create schema Production;
go 
create table Production.Categories
(categoryid int identity(1,1) not null, 
categoryname nvarchar(15) not null, 
description nvarchar(200) not null );


--Chapter 12
--Lesson 1

select * --user_transaction
from sys.dm_tran_active_transactions;


-- 
select @@TRANCOUNT;
print @@trancount; 
-- 0 indicates that the the code is not within an transaction
--level greater that 0 indicates that there is an active transaction, and number greater than 1 indicates nested transactions

select XACT_STATE();
print xact_state();

-- '0' indicates that there is no active transaction
-- '1' indicates that there an uncommited transaction that can be commited. No indication of nested tranacrion 
-- '-1' indciates that there is an uncommited transaction which cannot be commited due to fatal error

-- Transaction modes are either 
--	Autocommit, Implicit transaction or Explicit transaction
-- Auto commit transactions are commited as soon as they are executed successfully
-- Implicit Transactions: This can be turned on by set implicit_transactions on;
set implicit_transactions on; 
-- from this foint all transactions need to be maunally commited 
set ansi_defaults on;
 
--------------------
go 
select custid, companyname, contactname, contacttitle, address
from sales.Customers 
where address = N'5678 rue de l''Abbaye';
------------------------------------------------------------------------------------------------------
-- The second code is exactly the same as the first but the second code doesn't yield the same code -- 
------------------------------------------------------------------------------------------------------
select 
c.custid, c.companyname, c.contactname,c.contacttitle, c.address
from sales.Customers as c 
where c.address = N'5678 ru de l''Abbaye';
go 
-----------------
use TSQL2012;
go 
declare @SQLString as nvarchar(4000), 
		@address as nvarchar(60);
set @SQLString = N'
select custid, companyname, contactname, contacttitle, address
from sales.Customers 
where address = @address';
set @address = N'5678 rue de l''Abbaye';
exec sp_executesql 
	@statement = @SQLstring,
	@parms = N'@address nvarchar(60)',
	@address = @address;
------
 go 

 use TSQL2012;
 go 
 declare @sql as nvarchar(4000), @address as nvarchar(60);
 set @sql = N'select custid, companyname, contactname, contacttitle, address from sales.Customers where address = @address';
 set @address = N'5678 rue de l''Abbaye'
 exec sp_executesql 
 @sql, N'@address nvarchar(60)', @address;

go 

go 
use TSQL2012
declare @sql as nvarchar(4000), @city as nvarchar(60);

set @sql = N'
select e.title,e.firstname, e.lastname,e.address, e.city, e.country
from hr.employees as e
where e.city = @city;
'
set @city='London'
exec sp_executesql
@sql, N'@city nvarchar(60)', @city;

go 

use TSQL2012;
go 

declare @sql nvarchar(4000),@title nvarchar(40)
set @sql = N'
select 
e.empid, 
e.firstname,
e.lastname,
e.address, 
e.city, 
e.country, 
e.title
from HR.Employees as e
where e.title = @title';

set @title = N'Sales Representative'
exec sp_executesql @sql, N'@title nvarchar(30)', @title

-- Chapter 13 Design and implementing T-SQL Routeines

use TSQL2012;
go

select 
d.orderid,
d.custid,
d.shipperid,
d.orderdate,
d.requireddate,
d.shippeddate
from Sales.Orders as d 
where d.custid =37 and d.orderdate >= '2007-04-01' and d.orderdate <= '2007-07-01';


-- Create stored procedures 


use TSQL2012;
go 
declare @custid as int, @orderdatefrom as datetime, @orderdateto as datetime;
set @custid = 37;
set @orderdatefrom = '2007-04-01';
set @orderdateto = '2007-07-01';

select d.orderid, d.custid, d.shipperid, d.orderdate, d.requireddate, d.shippeddate
from Sales.Orders as d
where d.custid = @custid and d.orderdate >= @orderdatefrom and d.orderdate < @orderdateto;
go 

-------------------------
-- Create Stored procedure
-------------------------

use TSQL2012; 
go 
if OBJECT_ID('Sales.GetCustomerOrders', 'P') is not null 
drop proc Sales.GetCustomerOrders;
go 
create proc Sales.GetCustomerOrders
@custid as int, -- This parametre is required
@orderdatefrom as datetime = '19000101', -- This parametre is optional with default values
@orderdateto as datetime = '99991231',	-- This parametre is optional with values 
@numrows as int = 0 output -- This is an output parametre and is always an optional parametre

as 
Begin 
set nocount on;
select 
d.orderid, d.custid, d.shipperid, d.orderdate, d.requireddate, d.shippeddate 
from Sales.Orders as d 
where 
d.custid = @custid 
and 
d.orderdate >= @orderdatefrom 
and 
d.orderdate < @orderdateto;
set @numrows = @@ROWCOUNT;
return;
End
go 

------------- Running the stored procedure

declare @rowsreturned as int;
execute sales.GetCustomerOrders
@custid = 37,
@orderdatefrom = '20070401',
@orderdateto = '20070701',
@numrows = @rowsreturned output;

select @rowsreturned as "Rows Returned";
go 


----Practice Stored procedure 
use TSQL2012;
go 
if OBJECT_ID('HR.spEmplyee','P') is not null 
drop proc HR.spEmplyee;

go 

create proc HR.spEmplyee
@city as nvarchar(20), @rowcount as int = 0 output
as 
begin 

select * 
from HR.Employees as e 
where e.city = @city;
set @rowcount = @@rowcount; 
return;
end 

go 


declare @counter as int;
execute hr.spEmplyee @city = 'London', @rowcount = @counter output;
print @counter

select city from hr.Employees;

--------------------

use TSQL2012;
go 
if OBJECT_ID('HR.spEmp', 'P') is not null 
drop proc HR.spEmp;
go 

create proc HR.spEmp
@city as varchar(20), @num as int = 0 output

as
--Begin
set nocount on
select * 
from HR.Employees as e 
where e.city = @city;
set @num = @@ROWCOUNT;
return
--End
go 
declare @nums int 
set nocount on 
exec HR.spEmp @city='London', @num =@nums output;
select @nums 'Number of rows';

-- Practice 

use TSQL2012;
go 

if OBJECT_ID('spEmp','p') is not null drop proc spEmp;
go
create proc spEmp
@country as nvarchar(20), @counter as int = 0 output 
as
set nocount on   
select e.empid, e.firstname,e.lastname, e.address,e.city, e.country
from HR.Employees as e
where e.country = @country;
set @counter = @@ROWCOUNT;
return
;
go 
declare @count as int 
exec spEmp 'UK',@counter = @count output;
select @count as 'Number of rows';

---------- Practicing stored proc 

if OBJECT_ID('spEmp','P') is not null drop proc spEmp;
go 
create proc spEmp
@city as nvarchar(20), @counter as int  = 0 output
as 
Begin 
set nocount on 
select * from HR.Employees as e where e.city = @city;
set @counter = @@ROWCOUNT;
return;
end ;

go 
declare @count as int;
exec spEmp @city ='London',@counter = @count output; 
select @count as 'Row count';


----------------------------==================================================
--Branching  Logic
-- IF/Else
go 
declare @a as int, @b as int;
set @a = 1; 
set @b = 2;
if @a = @b 
	print 'The variables are equal'
else if @a > @b 
	print '@a > @b'
else 
	print '@a < @b';	
go  

----------------
declare @a as int, @b as int;
set @a = 1;
set @b = 1;
if @a = @b 
print 'A = B';
else 
print 'A not equal to B ';
print 'THIS LINE IS OUTSIDE THE IF STATEMENT!!!';
GO

----------------
Declare @var1 int, @var2 int;
set @var1 = 1;
set @var2 = 2;
if @var1 = @var2 
begin 
	print 'The variables are equal';
end 
else 
begin 
	print 'They are not equal';
	print 'This line within the if statement';
end 
go 
-- While Loop

set nocount on;
declare @count as int = 1;
while @count <= 10 
begin 
print cast(@count as nvarchar);
set @count +=1;
end 

-- Fubunacci numbers
go 
set nocount on;
Declare @a int = 0;
Declare @b int = 1;
Declare @c int = @a;
--Declare @counter int = 1;

while @c <=100
begin 
--print @a
--print @b
print @c
set @c = @a + @b

set @a=@b
set @b=@c
--set @counter += 1;

end 


 
-- While loop with break and continue statement 

go 
set nocount on;
declare @count as int = 1;
while @count <= 100
begin 
if @count = 10 
break; 
if @count = 5 
begin 
set @count +=2;
continue;
end 
print cast(@count as nvarchar);
set @count +=1;
end;

-- ****************** Fibunacci with brake and continue ********* This is more difficult than I thought.

go 
set nocount on;
declare @a int = 0;
declare @b int = 1; 
declare @c int = @a;
declare @count as int = 1;
while @count <= 50
begin 
print @c
set @c = @a+@b
set @a=@b
set @b=@c
if @count = 25
break; 
--print @c
if @count >=5 
begin 
set @c = (@a + @b)*(@b-@a)
Print cast(@count as nvarchar) + ' Irregular Fibunacci'
set @count +=2;
continue;
end 
print cast(@count as nvarchar) +' Regular Fibunacci';
set @count +=1;
end;

--------------------------


use TSQL2012
go 
Declare @categoryid as int;
set @categoryid = (select min(p.categoryid) from Production.Products as p); -- This will pcik up the categoryid wich is 1 and implement to @categoeyid
while @categoryid is not null 
begin 
	Print cast(@categoryid as nvarchar); -- This will simply print the value 
	set @categoryid =(select min(c.categoryid) from Production.Categories as c 
	where c.categoryid > @categoryid); -- This will simply set the value of @categoryid to values greated than the previous value 
end  -- The while loop is designed to loop throgh all the values of categoryid
go 

----------------

Use TSQL2012;
go 

declare @categoryname as nvarchar(15);
set @categoryname = (select min(c.categoryname) from Production.Categories as c);
while @categoryname is not null 
begin
print @categoryname;
set @categoryname = (select min(d.categoryname) from Production.Categories as d where d.categoryname > @categoryname);
end ;
go 


--Waitfor 


use TSQL2012;
go 

waitfor delay	'00:00:20';

select * from hr.Employees;

waitfor time '21:20:00'
select * from hr.Employees;

--goto 

Print 'First Print statement';
GOTO MyLable;
Print 'Second print statement';
MyLable: print 'Third print statement';

-- Developing Stored procedure result 
use TSQL2012;
go
IF object_id('Sales.ListSampleResultsSets','P') is not null 
drop proc Sales.ListSampleResultsSets;

go 
create proc Sales.ListSampleResultsSets
as 
begin 
	select top (1) p.productid, p.productname, p.supplierid, p.categoryid, p.unitprice, p.discontinued from Production.Products as p;
	select top (1) d.orderid, d.productid, d.unitprice, d.qty, d.discount from sales.OrderDetails as d; 
end 
go 

exec Sales.ListSampleResultsSets;

-- Stored procecures can have multiple select statements in a single batch of code.
-- You can also call other stored procedures in a store proceduere.


-- Tracticing implementing stored procedures

use TSQL2012;
go 

Declare @databasename as nvarchar(128);
set @databasename = (Select min(name) from sys.databases where name not in('master', 'model','msdb','tempdb'));

while @databasename is not null 
begin 
print @databasename;
set @databasename = (select min(name) from sys.databases where name not in ('master','model','msdb','tempdb') and name > @databasename);
end

----------

go

with cte as 
(
select convert(nvarchar, GETDATE(), 120) as 't'

)

select replace(t,' ','_') from cte;


----

select replace(replace(replace(convert(nvarchar, GETDATE(),120),' ', '_'),':',' '),'-',' ')

-----

Declare @databasename as nvarchar(128), @timecomponent as nvarchar(50),@sqlCommand as nvarchar(1000);
set @databasename = (select min(name) from sys.databases where name not in ('master','model','msdb','tempdb'));
	while @databasename is not null
		begin 
			set @timecomponent = replace(replace(replace(convert(nvarchar, GETDATE(),120),' ', '_'),':',' '),'-',' ');
			set @sqlCommand = 'BACKUP DATABASE ' + @databasename + 'TO DISK = ''C:\Backups\' + @databasename + '_' + @timecomponent + '.bak''';
			print @sqlcommand;
			--Exec (@sqlcommand);
			set @databasename = (select min(name) from sys.databases where name not in ('master', 'model', 'msdb', 'temp') and name > @databasename);
		end;
go


---- creating a stored procedure from th eabove script 

if OBJECT_ID('dbo.BackupDatabase','P') is not null 
drop proc dbo.BackupDatabase;

go 

create proc dbo.BackupDatabase

as 
begin 
	Declare @databasename as nvarchar(128), @timecomponent as nvarchar(50),@sqlCommand as nvarchar(1000);
	set @databasename = (select min(name) from sys.databases where name not in ('master','model','msdb','tempdb'));
	while @databasename is not null
	begin 
	set @timecomponent = replace(replace(replace(convert(nvarchar, GETDATE(),120),' ', '_'),':',' '),'-',' ');
	set @sqlCommand = 'BACKUP DATABASE ' + @databasename + ' TO DISK = ''C:\Backups\' + @databasename + '_' + @timecomponent + '.bak''';
	print @sqlcommand;
	--Exec (@sqlcommand);
	set @databasename = (select min(name) from sys.databases where name not in ('master', 'model', 'msdb', 'temp') and name > @databasename);
	end;
	return;
end

go 

exec dbo.BackupDatabase;

----

if OBJECT_ID('dbo.BackupDatabase','P') is not null 
drop proc dbo.BackupDatabase

go 

create proc dbo.BackupDatabase 
@database as nvarchar(30)
as 
begin 
	Declare @databasename as nvarchar(128), @timecomponent as nvarchar(50),@sqlCommand as nvarchar(1000);
	set @databasename = (select min(name) from sys.databases where name not in ('master','model','msdb','tempdb'));
	while @databasename is not null
	begin 
	set @timecomponent = replace(replace(replace(convert(nvarchar, GETDATE(),120),' ', '_'),':',' '),'-',' ');
	set @sqlCommand = 'BACKUP DATABASE ' + @databasename + ' TO DISK = ''C:\Backups\' + @databasename + '_' + @timecomponent + '.bak''';
	print @sqlcommand;
	--Exec (@sqlcommand);
	set @databasename = (select min(name) from sys.databases where name not in ('master', 'model', 'msdb', 'temp') and name > @databasename);
	end;
	return;
end

--

exec dbo.BackupDatabase;
exec dbo.BackupDatabase 'User';
exec dbo.BackupDatabase 'system';
exec dbo.BackupDatabase 'unknown';


---- Develop and incert stored procedure for the data access layer

go 
--version 1 a sample stored procedure 
use tsql2012;
go 
if object_id ('Production.InsertProducts','P') is not null 
DROP PROC Production.InsertProducts
go 

CREATE PROC Production.InsertProducts
@productname as nvarchar(40),
@supplierid as int,
@categoryid as int,
@unitprice as money = 0,
@discontinued as bit = 0
as 
BEGIN 
INSERT Production.Products (productname, supplierid, categoryid, unitprice, discontinued)
					VALUES (@productname, @supplierid, @categoryid, @unitprice, @discontinued);
					RETURN;
END ;
GO 

EXECUTE Production.InsertProducts
@productname ='Test Product',
@supplierid = 10,
@categoryid = 1,
@unitprice = 100,
@discontinued = 0;

go
-- Inspect the result
SELECT * FROM Production.Products WHERE productname = 'Test Product';

--Removing the data 

delete from Production.Products where productname = 'Test Product';

-------- Attempting to insert invalid data 

EXEC Production.InsertProducts
@productname = 'Test product',
@supplierid = 10,
@categoryid = 1,
@unitprice = -100,
@discontinued = 0

-- The table has a check constraint "CHK_Products_unitprice" that prevents negative pricing

-- version 2 with error handleing 

if OBJECT_ID('Production.InsertProducts','P') is not null 
drop proc Production.InsertProducts
go 

create procedure Production.InsertProducts
@productname as varchar(40),
@supplierid as int,
@categoryid as int,
@unitprice as money = 0,
@discontinued as bit = 0
as begin 
begin try
insert Production.Products(productname, supplierid, categoryid, unitprice, discontinued)
				values(@productname, @supplierid, @categoryid, @unitprice, @discontinued);
end try
begin catch
THROW;
Return;
end catch 
end 

---

exec Production.InsertProducts
@productname = 'Test Product',
@supplierid = 10,
@categoryid = 1,
@unitprice = -100,
@discontinued = 0;

-- Version 3 With parametres
go
if object_id('Production.InsertProducts','p') is not null 
drop proc Production.InsertProducts
go 

create proc	Production.InsertProducts
@productname as nvarchar(40),
@supplierid as int,
@categoryid as int,
@unitprice as money = 0,
@discontinued as money = 0
as 
begin 
	declare @clientmessage nvarchar(100);
	begin try
		-- Test parametre
		IF not exists (select 1 from Production.Suppliers where supplierid = @supplierid)
		Begin 
			set @clientmessage = 'Supplier id ' + CAST(@supplierid as nvarchar) + ' is invalid';
			throw 50000, @clientmessage, 0;
		end;

		IF not exists (select 1 from Production.Categories where categoryid	= @categoryid)
		Begin 
			set @clientmessage = 'Category id ' + CAST(@categoryid as nvarchar) + ' is invalid';
			throw 50000, @clientmessage, 0;
		end 

		IF not(@unitprice >=0)
		begin 
			set @clientmessage = 'unitprice ' + CAST(@unitprice as nvarchar) + ' is not valid. Must be >=0';
			throw 50000, @clientmessage, 0;
		end 

		--Insert data 
		Insert Production.Products(productname, supplierid, categoryid, unitprice, discontinued)
		values(@productname, @supplierid, @categoryid, @unitprice, @discontinued);
	end try 
	Begin Catch 
	throw;
	end catch;
end	
go

exec Production.InsertProducts
@productname = 'Test Product',
@supplierid = 10,
@categoryid = 1,
@unitprice = -100,
@discontinued = 0;

-- Triggers 
-- After Triggers
------------------------------------------------------------------------
go 
select * from Sales.OrderDetails;
go 

IF OBJECT_ID('Sales.tr_SalesOrderDetailsDML','TR') is not null 
	Drop trigger Sales.tr_SalesOrderDetailsDML;
go 
create trigger Sales.tr_SalesOrderDetailsDML
on Sales.OrderDetails
for Delete, Insert, Update
as 
begin 
set nocount on 
end 

go 

IF OBJECT_ID('Sales.tr_SalesOrderDetailsDML','tr') is not null 
drop trigger Sales.tr_SalesOrderDetailsDML

go 

create trigger Sales.tr_SalesOrderDetailsDML 
on Sales.OrderDetails
after DELETE, INSERT, UPDATE
AS 
BEGIN 
	if @@ROWCOUNT = 0 return;
	set nocount on;
	select count(*) as InsertedCount from inserted;
	select count(*) as DeletedCounted from deleted;
END;

go 


select * from Production.Categories;

---------------


IF OBJECT_ID('Production.tr_ProductionCategory_categoryname','tr') is not null 
drop trigger Production.tr_ProductionCategory_categoryname;

go 
create trigger Production.tr_ProductionCategory_categoryname
on Production.Categories
After insert, update 
as 
Begin 
if @@ROWCOUNT = 0 return;
set nocount on; 
if exists (select count(*) from inserted as i 
join Production.Categories as c 
on i.categoryname = c.categoryname 
group by i.categoryname
having count(*) > 1)
begin 
throw 50000, 'Duplicate fategory name not allowed', 0;
end;
end;
go 

----------- the following insert statement works ony once, the second time it will throw an error

insert into Production.Categories (categoryname, description)
values('TestCategory1','Test1 description v1');

-- updating the table 

update Production.Categories 
set categoryname = 'Beverages' where categoryname = 'TestCategory1';

-- delete data 

delete from Production.Categories where categoryname = 'TestCategory1';


-- nested after trigger 

-- If the nested trigger is in a Circular form (Table A trigger fires table B fires Table C Then Table C fires Table A), once the level has reached 32 executions the process will stop. 

-- Test Stored procedure nesting 

exec sp_configure 'nested trigger'


-- User defined functions

-----------------------------------scalar functions
use TSQL2012;
go 

IF OBJECT_ID('Sales.fn_extension','FN') is not null 
DROP FUNCTION  Sales.fn_extension
GO 
CREATE FUNCTION Sales.fn_extension
(
@unitprice as money, 
@qty as int
)
RETURNS MONEY 
AS 
BEGIN
return @unitprice * @qty
END;
GO 

-- 
--
--FN - SQL scalar fucntion 
--IF - SQL inline Table-Valued function 
--TF - SQL Table-Valued-Function

use TSQL2012;
go 

select d.unitprice, d.qty, Sales.fn_extension(d.unitprice, d.qty) as 'Sales.fn_extension'
from Sales.OrderDetails as d
for xml auto, root('sales') ;


-----------------------Table valued function----------------

-----------------------Inline Table-Valued function--------------

go 
use TSQL2012;
go 

IF OBJECT_ID('Sales.fn_FilteredExtension','IF') is not null 
drop function Sales.fn_FilteredExtension;
go 
Create function Sales.fn_FilteredExtension
(
@lowqty as smallint,
@highqty as smallint
)
returns table as return
(
select orderid, unitprice, qty
from Sales.OrderDetails
where qty between @lowqty and @highqty
);
go 

-- 

select * from Sales.fn_FilteredExtension(10,20);

select 
e.orderid, 
e.unitprice, 
e.qty,
Sales.fn_extension(unitprice, qty) as 'extension'
--Sales.fn_FilteredExtension(12,15) test -- cannot call table valued function in columns
 
from Sales.fn_FilteredExtension(10,20) as e;

---
go
use TSQL2012;
go
select e.orderid, e.qty, e.unitprice, Sales.fn_extension(e.unitprice, e.qty) as 'Total'
from sales.fn_FilteredExtension(10,20) as e 
where Sales.fn_extension(e.unitprice, e.qty) > 2000;

------------------ Multi statement table valued function 

if OBJECT_ID('Sales.fn_FilteredExtension2','TF') is not null
drop function Sales.fn_FilteredExtension2;
go 
create function Sales.fn_FilteredExtension2
(@lowqty as smallint, @highqty as smallint)

returns @returnable table 

(orderid int, unitprice money, qty smallint)

as 
begin 
	insert @returnable
	select orderid, unitprice, qty
	from sales.OrderDetails where qty between @lowqty and @highqty
	return 
end 
go 

-- 

select orderid, unitprice, qty
from Sales.fn_FilteredExtension2(10,20);

-- 

select * from Sales.fn_FilteredExtension(10,20);

--
go
if OBJECT_ID('Sales.fn_GetProductSalesTotal','FN') is not null 
drop function Sales.fn_GetProductSalesTotal
go 

create function Sales.fn_GetProductSalesTotal
(@productid int)
returns money
as begin 
declare @SalesTotal as money

select @SalesTotal = SUM(od.unitprice*od.qty) 
from Sales.orders as d join sales.OrderDetails as od
on d.orderid = od.orderid
where d.orderdate=od.orderid
group by d.orderid

return @salesTotal
end;
go

select *, sales.fn_GetProductSalesTotal(12) 'productid' from Sales.Orders;

select * from Sales.Customers;


-------------------- Practice using extended events 

select c.custid, c.companyname, o.orderid, o.orderdate
from Sales.Customers as c 
join sales.Orders as o 
on c.custid = o.custid
order by c.custid, o.orderid;


/*
Next take under Object Explorer navigate to 
ServerName -> Management -> Extended Events -> Sessions 
Then right click on the sessions folder and then select New Session Wizard 
*/


-- Set session option 

dbcc dropcleanbuffers;
--set statistics io off;
set statistics io on;
select * from Sales.Customers;
select * from sales.Orders;

/*
-- Set Statestics io on;
This code checks the number of pages the code uses
*/

------------ Identical Queries with a little difference
dbcc dropcleanbuffers;

select c.custid, c.companyname, o.orderid, o.orderdate
from sales.Customers as c 
inner join 
sales.Orders as o on c.custid = o.custid;

select c.custid, c.companyname, o.orderid, o.orderdate
from Sales.Customers as c 
inner join 
Sales.Orders as o on c.custid = o.custid
where o.custid < 5;

----------------------
go 
set statistics io off;
--set statistics time off;
set statistics time on;
dbcc dropcleanbuffers;

select c.custid, c.companyname, o.orderid, o.orderdate
from sales.Customers as c 
inner join 
Sales.Orders as o 
on c.custid = o.custid;

----------------------------------------
-- For estimated plan 
go 
set showplan_text on;

go 
select * from hr.Employees;
go 
set showplan_text off;
go 


set showplan_all on;
go 
select * from hr.Employees;
go 
set showplan_all off;

go 

----------------------------------------
-- For Actual plan 

set statistics profile on;
go 
select * from hr.Employees;
go 
set statistics profile off;
go 
---------------------------------------

--for estimated plan 

set showplan_xml on;
go 
select * from HR.Employees;
go 
set showplan_xml off;
go
--------------------------------------

-- for actual plan 

set statistics xml on;
go 

select * from hr.Employees;
go 

set statistics xml off;

----------------------------------------

select c.custid, MIN(c.companyname) as companyname, COUNT(*) as numorders
from sales.Customers as c 
inner join Sales.Orders as o 
on c.custid = o.custid
where o.custid < 5
group by c.custid
having COUNT(*) > 6


-- Exercise 1 
use TSQL2012;
go 
select N1.n*100000 + O.orderid as norderid, o.*
into dbo.NewOrders
from Sales.Orders as o 
cross join (values(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30)) as N1(n);



select * from dbo.NewOrders;

create nonclustered index idx_nc_orderid on dbo.NewOrders(orderid);


go 
set statistics io on;
set statistics time on;

go 

select norderid 
from dbo.NewOrders where norderid = 110248
order by norderid;

set statistics io off;
set statistics time off;

select norderid
from dbo.NewOrders
where norderid = 110248
order by norderid; 

create nonclustered index idx_nc_norderid on dbo.NewOrders(norderid);


drop table dbo.NewOrders; 

-----------------------------------------------------

-- Dynamic Management Object --

select 
cpu_count as logical_cpu_count,
cpu_count/ hyperthread_ratio as physical_cpu_count, 
cast(physical_memory_kb/1024 as int) as physical_memory_mb, 
sqlserver_start_time
from sys.dm_os_sys_info;

-----------------------------------------------------

/*
sys.dm_os_sys_info give you onformation about the system resources
*/

select cpu_count as 'Logical CPU count',
cpu_count/hyperthread_ratio as 'Physical CPU count',
CAST(physical_memory_kb/1024 as int) as 'Physical memory in MB',
sqlserver_start_time as 'SQL Server Startup time'
from sys.dm_os_sys_info;

---------------------------------------------------------------------

select * from sys.dm_os_waiting_tasks;
select * from sys.dm_exec_sessions;


---------------------------------------------------------------------
/*
sys.dm_os_waiting_tasks give information about sessions that ara currently witing for something. 

sys.dm_exec_sessions gives information about the user, host and application that are waiting 

*/


select s.login_name, 
s.host_name, 
s.program_name, 
wt.session_id, 
wt.wait_duration_ms, 
wt.wait_type, 
wt.blocking_session_id,
wt.resource_description
from sys.dm_os_waiting_tasks as wt 
inner join 
sys.dm_exec_sessions as s on wt.session_id = s.session_id
where s.is_user_process = 1;

---------------------------------------------

/*
sys.dm_exec_exec_requests returns information about currently executing request
*/

select s.login_name, s.host_name, s.program_name, r.command, t.text, r.wait_type, r.wait_time, r.blocking_session_id
from sys.dm_exec_requests as r 
inner join sys.dm_exec_sessions as s on r.session_id = s.session_id
outer apply sys.dm_exec_sql_text(R.sql_handle) as T where s.is_user_process =1;

select s.login_name, 
s.host_name, 
s.program_name, 
wt.session_id, 
wt.wait_duration_ms, 
wt.wait_type, 
wt.blocking_session_id,
wt.resource_description
from sys.dm_os_waiting_tasks as wt 
inner join 
sys.dm_exec_sessions as s 
on Wt.session_id = s.session_id 
where s.is_user_process = 1;


select 
	s.login_name, 
	s.host_name, 
	s.program_name, 
	r.command, 
	t.text, 
	r.wait_type, 
	r.wait_time, 
	r.blocking_session_id
from sys.dm_exec_requests as r 
inner join 
sys.dm_exec_sessions as s 
on r.session_id = s.session_id 
outer apply sys.dm_exec_sql_text(r.sql_handle) as T where s.is_user_process = 1;

------------------------------------------------

select top (5) 
(total_logical_reads+total_logical_writes) as 'Total Logical IO',
execution_count,
(total_logical_reads/execution_count) as 'Avarage logical reads',
(total_logical_writes/execution_count) as 'Avarage logical writes',

	(select 
	SUBSTRING
		(text, statement_start_offset/2 + 1, 
			(case when statement_end_offset = -1 
			then LEN
				(convert(nvarchar(max), text))*2
			else statement_end_offset
			end - statement_start_offset)
		/2) 
	from sys.dm_exec_sql_text(sql_handle)
	) as 'Query Text'

from sys.dm_exec_query_stats

--------------------exercise -----------------------
use TSQL2012
go 

select N1.n*100000 + o.orderid as norderid, o.* 
into dbo.NewOrders
from Sales.Orders as o
cross join (values(1),(2),(3)) as N1(n);
go 
create nonclustered index idx_nc_orderid on dbo.NewOrders(orderid);
go 
select norderid from dbo.NewOrders where norderid = 110248
order by norderid; 
go 

-- Finding missing indexes 

select mid.statement as 'Database.Schema.Table',
MIC.column_id as 'Column ID',
MIC.column_name as 'Column Name',
MIC.column_usage as 'Column Usage',
MIGS.user_seeks as 'User Seek',
MIGS.user_scans as 'User Scan',
MIGS.last_user_seek as 'Last User Seek',
MIGS.avg_total_user_cost as 'Avarage Query Cost Reduction',
MIGS.avg_user_impact as 'Avarage PCT Benefit'  
from sys.dm_db_missing_index_details as MID
cross apply sys.dm_db_missing_index_columns(MID.index_handle) as MIC
inner join sys.dm_db_missing_index_groups as MIG 
on MIG.index_handle = mid.index_handle
inner join sys.dm_db_missing_index_group_stats as MIGS
on MIG.index_group_handle = MIGS.group_handle
order by MIGS.avg_user_impact desc;


-- clean up 

drop table dbo.NewOrders

/* Chapter 15 */

use TSQL2012;
go 

if OBJECT_ID('dbo.TestStructure','U') is not null 
drop table dbo.TestStructure
go 

create table dbo.TestStructure
(
id int  not null,
filter1 char(36) not null,
filter2 char(216) not null
);

if OBJECT_ID('dbo.TestStructure','U') is not null 
select * from dbo.TestStructure
go 


-- General information about the table 

select OBJECT_NAME(object_id) as Table_name, 
name as index_name,type, type_desc 
from sys.indexes
where object_id = object_id(N'dbo.TestStructure',N'U');

/*
When Tables are create without clustered or nonclustered indexes the entire table is put on the heap which contains a number of pages. 
When SQL Server querys the table it needs to search the entire heap to find the data!
*/

/*
Table_name		Index_Name	Type	Type_desc
------------	----------	----	---------
TestStructure	NULL		0		HEAP

The type column stores
0  for heap 
1  for clustered index 
2  for nonclusterd index
*/


-------------- Heap allocation check------------

go 
select 
index_type_desc, 
page_count, 
record_count, 
avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats 
(DB_ID(N'TSQL2012'), OBJECT_ID(N'dbo.TestStructure'), null, null, 'detailed'
);

exec dbo.sp_spaceused @objname = N'dbo.TestStructure', @updateusage = true;


---------------------------------

insert into dbo.TestStructure(id, filter1, filter2)
values (1,'a','b');


select index_type_desc,
page_count, 
record_count, avg_page_space_used_in_percent 
from sys.dm_db_index_physical_stats
(DB_ID(N'TSQL2012'), OBJECT_ID(N'dbo.TestStructure'), null, null, 'detailed');
exec dbo.sp_spaceused @objname = N'dbo.TestStructure', @updateusage = true;


--select index_type_desc, page_count, record_count, avg_page_space_used_in_percent
--from sys.dm_db_index_physical_stats
--(DB_ID(N'TaxiEarnings'), OBJECT_ID(N'Taxi.TaxiJournal'), null,null,'detailed');
--exec dbo.sp_spaceused @objname = N'TaxiEarnings.Taxi.TaxiJournal', @updateusage = true;


--select * from TaxiEarnings.TAXI.TaxiJournal;



/*The follwing while loop will simply populate the dbo.TestStructure table with dummy data*/

declare @i as int = 1;
while @i <30
begin
set @i= @i + 1;
insert into dbo.TestStructure(id, filter1,filter2)
values
(@i,'a','b');
end;

select * from dbo.TestStructure;

select index_type_desc, page_count, record_count, avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(DB_ID(N'TSQL2012'), object_id(N'dbo.TestStructure'), null, null, 'detailed');

exec dbo.sp_spaceused @objname = N'dbo.TestStructure', @updateusage = true;

insert into dbo.TestStructure(id, filter1, filter2)
values(31,'a','b');

go 
declare @i as int = 31;
while @i < 240 
begin 
	set @i = @i + 1;
	insert into dbo.TestStructure(id, filter1, filter2)
	values(@i, 'a','b');

end  


select index_type_desc, page_count, record_count, avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(DB_ID(N'TSQL2012'), object_id(N'dbo.TestStructure'), null, null, 'detailed');

exec dbo.sp_spaceused @objname = N'dbo.TestStructure', @updateusage = true;


 insert into dbo.TestStructure(id, filter1, filter2)
 values(241, 'a','b')

select index_type_desc, page_count, record_count, avg_page_space_used_in_percent 
from sys.dm_db_index_physical_stats(DB_ID(N'TSQL2012'),OBJECT_ID(N'dbo.TestStructure'),null, null, 'detailed');

exec dbo.sp_spaceused @objname = N'dbo.TestStructure', @updateusage = true;
go 

 --- Clustered index 

truncate table dbo.TestStructure;
create clustered index idx_cl_id on dbo.TestStructure(id);

select OBJECT_NAME(object_id) as Table_Nmae, name as Index_name, type, type_desc
from sys.indexes 
where object_id = object_id(N'TestStructure', N'U');

/*The result is as follows

Table_name		Index_name	type	Type_desc
----------------------------------------------
TestStructure	idx_cl_ID	1		CLUSTERED
*/


declare @i as int = 0;
while @i < 18630
begin 
set @i = @i + 1;
insert into dbo.TestStructure(id, filter1, filter2)
values (@i, 'a','b');
end; 

-- Clustere index allocation check 

select index_type_desc, index_depth,index_level, page_count, record_count, avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(db_id(N'TSQL2012'), object_id(N'TestStructure'),null,null, 'Detailed');


insert into dbo.TestStructure (id, filter1, filter2)
values (18631 , 'a','b');

select index_type_desc, index_depth, index_level, page_count, record_count, avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(DB_ID(N'TSQL2012'), object_id(N'TestStructure'), null, null, 'Detailed');


go 
truncate table dbo.TestStructure;
declare @i as int = 0;
while @i <8908
begin 
set @i = @i +1;
insert into dbo.TestStructure(id, filter1, filter2)
values (@i % 100, 'a','b');
end;

select index_type_desc, index_depth, index_level, page_count, record_count, avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(db_id(N'TSQL2012'), OBJECT_ID(N'TestStructure'), null, null, 'Detailed');

select * from dbo.TestStructure;

insert into dbo.TestStructure(id, filter1, filter2)
values (8909 % 100, 'a', 'b');


select index_type_desc, index_depth, index_level, page_count, record_count, avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(db_id(N'TSQL2012'),OBJECT_ID(N'TestStructure'), null, null, 'Detailed');

go
truncate table dbo.TestStructure;

drop index idx_cl_id on dbo.TestStructure;
create clustered index  idx_cl_filter1 on dbo.TestStructure(filter1);

declare @i as int = 0;
while @i < 9000
begin
set @i = @i+1;
insert into dbo.TestStructure(id, filter1, filter2)
values(@i,FORMAT(@i, '00000'), 'b')
end 

select * from dbo.TestStructure;

select index_level,page_count, avg_page_space_used_in_percent, avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats(db_id(N'TSQL2012'), object_id(N'TestStructure'), null, null, 'Detailed')


go 

truncate table dbo.TestStructure;
Declare @i as int  = 0;
while @i <9000
begin 
set @i = @i +1;
insert into dbo.TestStructure(id, filter1, filter2)
values (@i, cast(NEWID() as char(36)), 'b');
end;

select * from dbo.TestStructure;


select index_level, 
page_count, 
avg_page_space_used_in_percent as 'Percentage of pages Filled', 
avg_fragmentation_in_percent 'Percentages of exetrnal fragmentation'
from sys.dm_db_index_physical_stats(db_id(N'TSQL2012'),object_id(N'TestStructure'), null, null, 'Detailed');


go 

/*
Chapter 15 - Implementing Indexes and Statestics
=================================================
*Lesson 1: Implementing Indexes
-------------------------------

SQL server internally organizes data files in PAGES which 8 KB each and belongs to single object. Pages are further arranges into EXTENTS which are 8 consecutive PAGES in length.

An EXTENT with PAGES belonging to multiple objects is known as a Mixed Extent
An Extent with pages belonging to single object is known as Uniform Extent.

SQL Server stores the first 8 pages of an Object in a mixed extent. When the object exceedes the first 8 pages then SQL Server allocates additional Uniform Extents. 

SQL Server stores data either as a Heap or Balanced Tree. Tables stored as Balanced Tree is also knows as Clustered Table or Clustered Index. 

indexes are always Table Data organized as Balanced tree

--------------Clustered index--------------

Tables are organized as a balanced tree
 
*/


/*
You can get rid of fragmantation if you Rebuild and reorganize the index
Reorganizing an index is slower but less intrusive than rebuilding an index
You should 
reorganize index if the extrenal fragmantation is less than 30% 
and 
rebuild index if the external fragmantation is greater than 30%

*/

alter index idx_cl_filter1 on dbo.teststructure rebuild;

select 
	index_level, 
	page_count,
	avg_page_space_used_in_percent,
	avg_fragmentation_in_percent 
from sys.dm_db_index_physical_stats(DB_ID(N'TSQL2012'), OBJECT_ID(N'dbo.teststructure'), null, null, 'detailed');


/*
Nonclustered index 
------------------

Non-clusterd indexes are similar to clustered index. The only difference is the leaf level. The conteat of the leaf level depends on the underlying table, wherther the table is organized as a heap or as a balanced tree.

A a table can have only upto 999 non clustered indexes

the leaf level of a nonclustered index contains the index keys and row locators which points to a row in the underlying table. If the table is a heap the row locator is called row identifier(RID)

RIDs are 8 byte pointer that contains the Database file ID and page ID of the target row ID on th page. 

The operation of retriving the row from the HEAP is called RID Look up 
 RID Lookup is very efficient if the query is very selective and searches for one row or a small num of rows

But when the number of rows the query retreives increases,the RID Lookup becomes more expensive, becasue the cost of RID lookup is one page per row. 

If the table is organized as a balanced tree, then the row locator is a clustering key. In this situation the when SQL Server seeks a row, it has to go through all levels of the non-clustered index and also the clustered index. This is kmown as Key Lookup 

The clustering key is not unique and therefore a uniquifier is added to the repeating values. 


*/

----------------- Search argument ---------------
use TSQL2012;
go

select OBJECT_NAME(s.object_id) as Table_Name,
i.name as Index_name,
s.user_seeks, 
s.user_scans, s.user_lookups
from sys.dm_db_index_usage_stats as s 
inner join 
sys.indexes as i 
on s.object_id = i.object_id
and s.index_id = i.index_id
where s.object_id = object_id(N'sales.orders', N'U');

----

select orderid, custid,shipcity 
from sales.Orders;


select 
	d.orderid, 
	d.custid, 
	d.shipcity 
from sales.Orders as d
where d.shipcity = N'Vancouver';

---------------------------------------------------

select 
shipregion,
count(*) as num_regions 
from sales.Orders
group by shipregion;

---------------

select 
shipregion
from sales.Orders
order by shipregion;
---------------------


select orderid, custid, orderdate, shipname
from Sales.orders
where DATEDIFF(day, '20060709', orderdate) <= 2 
and DATEDIFF(day, '20060709', orderdate) >0;

select orderid, custid, orderdate, shipname 
from sales.orders
where DATEADD(day, 2, '20060709') >= orderdate
and '20060709' < orderdate;

----------------------

select orderid, custid,orderdate ,shipname 
 from Sales.orders 
 where orderdate in ('20060710','20060711');

 select orderid, custid, orderdate, shipname 
 from sales.Orders
 where orderdate = '20060710' 
 or orderdate = '20060711'

 ---------------------------

select OBJECT_NAME(s.object_id) as 'Table Name',
i.name as 'Index Name',
s.user_seeks, s.user_scans, s.user_lookups 
from sys.dm_db_index_usage_stats as s 
inner join 
sys.indexes as i 
on s.index_id = i.index_id
where s.object_id= object_id(N'sales.orders', N'U');


select d.orderid, d.custid, d.shipcity
from sales.Orders as d
order by d.orderid;

select orderid, custid, shipcity
from sales.orders as d 
where shipcity = N'Vancouver';

select shipregion, COUNT(*) as num_regions
from sales.Orders
group by shipregion
;

select shipregion
from sales.Orders
order by shipregion

create nonclustered index idx_nc_shipregion on sales.orders(Shipregion);

select shipregion, count(*) as num_region
from sales.Orders
group by shipregion;
-------------
select shipregion
from sales.Orders
order by shipregion


	select OBJECT_NAME(s.object_id) as 'Table Name',
	i.name as 'Index Name',
	s.user_seeks, s.user_scans, s.user_lookups 
	from sys.dm_db_index_usage_stats as s 
	inner join 
	sys.indexes as i 
	on s.index_id = i.index_id
	where s.object_id= object_id(N'sales.orders', N'U');


	drop index idx_nc_shipregion on sales.orders;



-----------Search Argument ------------

select orderid, custid, shipname
from sales.Orders
where DATEDIFF(day, '20060709',  orderdate) <=2
and DATEDIFF(day, '20060709', orderdate) > 0;

-- In the following query the orderdate is a search argument

select * 
from sales.Orders
where DATEADD(day, 2,'20060709') >= orderdate
and '20060709' < orderdate;


select orderid, custid,orderdate, shipname 
from sales.orders 
where orderdate in ('20060710','20060711');


select d.orderid, d.custid, d.orderdate, d.shipname
from sales.Orders as d 
where d.orderdate = '20060710'
or d.orderdate = '20060711'
;



 ------------------------ Exerceise 

use TSQL2012;
go 

create nonclustered index idx_nc_shipcity on sales.orders(shipcity);


use TSQL2012;
go 
select orderid, custid, shipcity 
from sales.orders
where shipcity = N'Vancouver';

---------------------

select 
OBJECT_NAME(s.object_id) as Table_name,
i.name as index_name,
s.user_seeks, s.user_scans, s.user_lookups 
from sys.dm_db_index_usage_stats as s inner join sys.indexes as i 
on s.object_id = i.object_id and s.index_id = i.index_id
where s.object_id = object_id(N'Sales.orders', N'U') and i.name = N'idx_nc_shipcity';


select d.orderid, d.custid, d.shipcity
from sales.Orders as d
where d.custid = 42;


select orderid, custid, shipcity 
from sales.Orders as d 
where custid = 42 or shipcity = N'Vancouver';
-----------


select OBJECT_NAME(s.object_id) as Table_name,
i.name as index_name,
s.user_seeks, s.user_scans, s.user_lookups
from sys.dm_db_index_usage_stats as s inner join sys.indexes as i 
on s.object_id = i.object_id and s.index_id = i.index_id
where s.object_id = object_id(N'Sales.orders', N'U') and i.name = N'idx_nc_shipcity';

-----------------------

----- Exerceise 2 

select orderid, custid, shipcity
from sales.Orders 
where custid = 42
and shipcity  = N'Vancouver';

------------------------------

drop index idx_nc_shipcity on sales.Orders;

--------------

/*created nonclustered index on shipcity and include custid*/

create nonclustered index
idx_nc_shipcity_i_custid on 
sales.orders(shipcity)
include (custid);

-------------

select orderid, custid, shipcity
from sales.orders
where custid = 42
or shipcity = N'Vancouver';

-- This gives nonclustered indexe scan 

select orderid, custid, shipcity
from sales.Orders
where custid = 42 and shipcity =N'Vancouver';

-- This generates nonclustered index seek 


drop index idx_nc_shipcity_i_custid	on sales.orders;


----Auto-created Statistics----


go 
-----------------------------------------------------------------------
use TSQL2012;
go 

declare @statistics_name as nvarchar(128), @ds as nvarchar(1000);
declare acs_cursor cursor for 
select name as statistics_name 
from sys.stats
where object_id = object_id(N'sales.orders', N'U')
and auto_created = 1;

open acs_cursor; 
fetch next from acs_cursor into @statistics_name;
while @@FETCH_STATUS = 0
begin 
set @ds = N'drop statistics sales.orders.' + @statistics_name +';'
;
exec(@ds);
fetch next from acs_cursor into @statistics_name;
end 
close acs_cursor;
deallocate acs_cursor;
------------------------------------------------------------------------

select OBJECT_NAME(OBJECT_ID) AS table_name,
name as statistics_name, auto_created 
from sys.stats
where object_id = object_id(N'sales.orders', N'U');

---- rebuilding index

alter index idx_nc_empid on sales.orders rebuild;

dbcc show_statistics(N'sales.orders', N'idx_nc_empid') with histogram;

dbcc show_statistics(N'sales.orders', N'idx_nc_empid') with stat_header;

create nonclustered index idx_nc_custid_shipcity on 
sales.orders(custid, shipcity);
------------------------------------

select orderid, custid, shipcity
from sales.Orders
where custid = 42;


-------The following query generates no rows indicating that there are no auto created statistics-------------

select OBJECT_NAME(object_id) as table_name,
name as statistics_name
from sys.stats 
where object_id = object_id(N'sales.orders', N'U')
and auto_created = 1
-----------------


select orderid, custid, shipcity
from sales.orders 
where shipcity = N'Vancouver'


select OBJECT_NAME(s.object_id) as table_name,
s.name as statistics_name, c.name as column_name  
from sys.stats as s 
inner join sys.stats_columns as sc 
on s.stats_id = sc.stats_id
inner join sys.columns as c 
on s.object_id = c.object_id and sc.column_id = c.column_id
where s.object_id = object_id(N'sales.orders', N'U')
and auto_created = 1;

--------------

drop index idx_nc_custid_shipcity on sales.orders;


--- manually maintain statistics



go
use TSQL2012;
go


declare @statistics_name as nvarchar(128), @ds as nvarchar(1000);
declare asc_cursor cursor for 
select name as statistics_name 
from sys.stats
where object_id = OBJECT_ID(N'sales.orders', N'U')
and auto_created = 1; 
open asc_cursor; 
fetch next from asc_cursor into 
@statistics_name;
while @@FETCH_STATUS = 0
begin 
set @ds = N'drop statistics sales.orders.'+ @statistics_name + ';';
exec(@ds)
fetch next from asc_cursor into 
@statistics_name;
end;
close asc_cursor;
deallocate asc_cursor;


--------- diable statistics auto creation----

alter database TSQL2012
set auto_create_statistics off with no_wait;

------------------


create nonclustered index idx_nc_custid_shipcity on sales.orders(custid, shipcity);

-------------

select * 
from Sales.orders
where shipcity = N'Vancouver';

------------

/*
Check whether auto check statustucs exist for the sales.orders table by using the following query. 
*/

select OBJECT_NAME(object_id) as table_name, name as statistics_name 
from sys.stats
where object_id = OBJECT_ID(N'sales.orders', N'U') and auto_created = 1;

-------------

---manually creating the missing stats 


create statistics st_shipcity on 
sales.orders(shipcity);
dbcc freeproccache;
----------------


select orderid, custid, shipcity
from sales.Orders
where shipcity = N'Vancouver';

---
/*
Reset the database to create statistics automatically

*/

alter database tsql2012 
set auto_create_statistics on with no_wait;
exec sys.sp_updatestats;
drop statistics sales.orders.st_shipcity;
drop index idx_nc_custid_shipcity on shales.orders;


-- chapter 16 

use TSQL2012;
go 

if OBJECT_ID('Sales.ProcessCustomer') is not null 
drop proc Sales.ProcessCustomer;

go 

create proc Sales.ProcessCustomer
(
@custid as int 
)
as 
print 'Processing Customer ' + cast(@custid as varchar(10));
go 

exec sales.ProcessCustomer 25 ;
---------------------------------------------

------ Cursor Step by step 
/*
Declare the Cursor 
Open Cursor 
Fetch record row by row 
Close cursor 
Deallocate Cursor
*/


go

set nocount on;

declare @curcustid as int; -- declaring a scalar variable with INT data type

declare cust_cursor cursor fast_forward for -- Declaring the Cursor
select custid
from sales.Customers;

open cust_cursor;							-- Open the cursor
fetch next from cust_cursor into @curcustid;-- Fetch record row by row into the scalar variable

while @@FETCH_STATUS = 0					-- While loop 				
/*
	 0 : Previous fetch successful
	-1 : The Row is beyond the result set 
	-2 : The row fetched is missing 
 */
begin 
exec Sales.ProcessCustomer @custid  =@curcustid; -- implement the value of @curcustid to @custid
fetch next from cust_cursor into @curcustid; -- Fetch record row by row into the scalar bariable
end;  

close cust_cursor;  -- Close the cursor 
deallocate cust_cursor; -- Deallocate the cursor
go 

----------------------

set nocount on;
declare @curcustid as int;
set @curcustid = (select top(1) custid from Sales.Customers order by custid);

while @curcustid is not null 
begin
exec Sales.ProcessCustomer @custid = @curcustid;
set @curcustid = (select top (1) custid from Sales.Customers where custid > @curcustid order by custid);

end;
go
-----------------------------------------

go

if OBJECT_ID('dbo.GetNums', 'IF') is not null drop function dbo.GetNums;
go 
create function dbo.GetNums(@low as bigint, @high as bigint) returns table
as return 
with 
L0 as (select c from (values(1),(1)) as D(c)),
L1 as (select 1 as c from L0 as A cross join L0 as B), 
L2 as (select 1 as c from L1 as A cross join L1 as B),
L3 as (Select 1 as c from L2 as A cross join L2 as B),
L4 as (select 1 as c from L3 as A cross join L3 as B), 
L5 as (select 1 as c from L4 as A cross join L4 as B), 
nums as (select row_number() over (order by (select null)) as rownum from L5)

select @low + rownum - 1 as n from nums
order by rownum
offset 0 rows fetch first @high - @low + 1 rows only ;
go 


------------------------

if object_id('dbo.transactions', 'U') is not null 
drop table dbo.transactions;
go 

create table dbo.transactions 
(
actid int not null,
tranid int not null,
val money not null, 
constraint PK_transactions primary key(actid, tranid)
);

declare @num_partition as int = 100,
		@rows_per_Partition as int = 10000;
truncate table dbo.transactions;

insert into dbo.transactions with(tablock)(actid, tranid, val)
select np.n, rpp.n,
(ABS(CHECKSUM(newid())%2)*2-1)*(1+ ABS(checksum(newid())%5))
from dbo.GetNums(1, @num_partition) as np cross join dbo.GetNums(1, @rows_per_partition) as rpp; 
go


select * from dbo.transactions;
