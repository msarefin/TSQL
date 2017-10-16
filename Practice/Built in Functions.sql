use TSQL2012; 

go 


--select name, type from sys.tables;

<<<<<<< HEAD
--Data Conversion
=======

>>>>>>> 8519e3279c7041dc76999c9ceca0b0b10af510ec
select CAST('abc' as int); 

select TRY_cast('abc' as int);

select CONVERT(date, '01/02/1982', 102)

select PARSE('1/2/2012' as date using 'fr')

select cast(GETDATE() as date)

<<<<<<< HEAD
--Date and Time function

=======
>>>>>>> 8519e3279c7041dc76999c9ceca0b0b10af510ec
select 
GETDATE() as 'getdate', 
CURRENT_TIMESTAMP as 'current timestamp', 
GETUTCDATE() as 'utc date', 
SYSDATETIME() as 'sys datetime',
SYSDATETIMEOFFSET() as 'sys datetime offset'


select DATEPART(month, '20120114') as month, 
DATEPART(day,'20120114') as day, 
DATEPART(year, '20120114') year,
DATENAME(MONTH, '20120114') as 'month name'

select DATEFROMPARTS(2012,02,24)

select eomonth(sysdatetime())

select DATEADD(YEAR,3,cast(GETDATE() as date))

select datediff(YEAR,'19820105', cast(getdate() as date))

select datename(WEEKDAY, cast(current_timestamp as date))

select SWITCHOFFSET(SYSDATETIMEOFFSET(),'-08:00')


select 
SWITCHOFFSET('20130212 14:00:00.0000000 -08:00', '-05:00') as switchoffset,
todatetimeoffset('20130212 14:00:00.0000000', '-08:00') as todatetimeoffset;


<<<<<<< HEAD
--Character function 
=======

>>>>>>> 8519e3279c7041dc76999c9ceca0b0b10af510ec

select 
	e.empid, 
	e.country, 
	e.region, 
	e.city, 
	e.country + N','+e.region+N','+e.city as location
from hr.Employees as e 

---

select 
empid,
country,
coalesce(region,''), 
city,
country + N','+region+N','+city as location,
CONCAT(country, ',',region,',', city) as location
from HR.Employees; 
<<<<<<< HEAD
--
select SUBSTRING('God is great', 1, 3);
--
select LEFT('abcd',3)
select RIGHT('abcd',3)
--
select CHARINDEX('@', 'name@email.com');
--
select PATINDEX('%[0-9]%','abcd123efgh');
--
select LEN(N'abcd') as length;
--
select DATALENGTH(N'abcd') as bytes;
--
select REPLACE('1.2.3', '.','/');
--
select REPLICATE('*', 10);

select STUFF('/12/3/4', 1,2,'');
--
select  upper(e.firstname), LOWER(e.firstname)
from HR.Employees as e; 
--
select LTRIM(RTRIM('                      What do you think?          '))
--
select FORMAT(1936, '000000000000');
--
=======

select SUBSTRING('God is great', 1, 3);

select LEFT('abcd',3)
select RIGHT('abcd',3)

select CHARINDEX('@', 'name@email.com');

select PATINDEX('%[0-9]%','abcd123efgh');

select LEN(N'abcd') as length;

select DATALENGTH(N'abcd') as bytes;

select REPLACE('1.2.3', '.','/');

select REPLICATE('*', 10);

select STUFF('/12/3/4', 1,2,'');

select  upper(e.firstname), LOWER(e.firstname)
from HR.Employees as e; 

select LTRIM(RTRIM('                      What do you think?          '))

select FORMAT(1936, '000000000000');

>>>>>>> 8519e3279c7041dc76999c9ceca0b0b10af510ec
select p.productid, p.productname, p.unitprice, p.discontinued, 
case p.discontinued
when 0 then 'no'
when 1 then 'Yes'
else 'unknown'
end as discounted_desc
from Production.Products as p; 

select productid, productname, unitprice, 
case
when unitprice <20.00 then 'Low'
when unitprice <40.00 then 'Medium'
when unitprice >= 40.00 then 'HIgh'
else 'unknown'
end as pricerange
from Production.Products
order by pricerange
;
<<<<<<< HEAD
--coalesce vs isnull
=======
>>>>>>> 8519e3279c7041dc76999c9ceca0b0b10af510ec

declare @x as varchar(3) = null, @y as varchar(10) ='1234567890';

select coalesce(@x,@y) as "coalesce", isnull(@x,@y) as [isnull];

<<<<<<< HEAD
select nullif('1234','') 
select nullif('12345','12345')
--
=======
select nullif('1234','')
select nullif('12345','12345')

>>>>>>> 8519e3279c7041dc76999c9ceca0b0b10af510ec
select productid, productname, unitprice, 
case
when unitprice <20.00 then 'Low'
when unitprice <40.00 then 'Medium'
when unitprice >= 40.00 then 'HIgh'
else 'unknown'
end as pricerange,

<<<<<<< HEAD
--iif then else 

=======
>>>>>>> 8519e3279c7041dc76999c9ceca0b0b10af510ec
IIF(unitprice <20, 'Not ideak', 'Ideal') Prefered 
from Production.Products
order by pricerange

select CHOOSE(3, 'x','y','z','W');

