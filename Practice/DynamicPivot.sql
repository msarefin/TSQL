use TSQL2012; 
go 

declare @shipperid nvarchar(max) ='';


select  @shipperid += quotename(d.shipperid) +',' 
from Sales.Orders as d
group by d.shipperid

set @shipperid = LEFT(@shipperid, LEN(@shipperid)-1)


print @shipperid;

print 'This is working !'

declare @sql nvarchar(max);

set @sql='
with pt as 
(
select d.empid, d.shipperid,d.freight
from Sales.Orders as d 
)
select empid ,'+@shipperid+' from pt
pivot (sum(freight) for shipperid in ('+@shipperid+'))as p;
'
print @sql
exec sp_executesql @sql;


--- Dynmaic pivot table using derived table

use TSQL2012;
go 

declare @country as nvarchar(max) = '';

select @country += quotename(e.country)+','
from hr.Employees as e 
group by e.country



set @country= LEFT(@country, LEN(@country)-1)

print @country;

declare @sql as nvarchar(max)

set @sql=
'
select name,'+@country+'
from
(select
	CONCAT(e.firstname,'' '',e.lastname) as [name], DATEDIFF(year,e.birthdate, SYSDATETIME()) as [Age], e.country
from hr.Employees as e
) as d 
pivot(max(age) for country in ('+@country+')) as pvt
order by USA desc
'

exec sp_executesql @sql;