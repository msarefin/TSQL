use TSQL2012; 
go 

declare @shipperid nvarchar(max) ='';


select  @shipperid += quotename(d.shipperid) +',' 
from Sales.Orders as d
group by d.shipperid

set @shipperid = LEFT(@shipperid, LEN(@shipperid)-1)

print @shipperid;

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
