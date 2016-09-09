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
from hr.Employees

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

-- When you say where condition is null, it simply measn tahat the condition is unknown. so even of the result set exist you will get an empty table becaus its looking for an unknown

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
 

<<<<<<< HEAD
 -----------------------------------

 select serverproperty('isfulltextinstalled');

 exec sys.sp_help_fulltext_system_components 'filter';

-------------

select document_type, path from sys.fulltext_document_types;
=======

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
		for xml path ('Product'), root ('Products'), type)
from Production.ProductSubcategory as psc
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

---------------------------- retrive XML to SQL -----------------------------
go 

declare @x xml;
 

select @x=p
from openrowset (bulk 'c:\users\sunsh\documents\sql server management studio\products.xml', single_blob) as Products(p)

select @x
