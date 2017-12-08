use TSQL2012;
go


/*
with pvt as 
(
select custid, shipperid, freight from Sales.Orders
)
select custid,[1],[2],[3] from pvt
pivot(sum(freight) for shipperid in ([1],[2],[3])) as d 

*/
---- 

go 
use TSQL2012;

if OBJECT_ID('Sales.FreightTotals') is not null drop table Sales.FreightTotals
go 


declare @s as nvarchar(max)='';
declare @sql as nvarchar(max);

select @s += quotename(shipperid)+',' from sales.Orders group by shipperid
set @s = LEFT(@s,LEN(@s)-1);

print @s;

/*
set @sql=

'
with pvt as 
(
select custid, shipperid, freight from Sales.Orders
)
select custid,'+@s+ 'from pvt
pivot(sum(freight) for shipperid in ('+@s+')) as d 

'
*/
set @sql='
select custid, '+@s+' from(
select custid, shipperid, freight from sales.Orders
) as d
pivot (sum(freight) for shipperid in ('+@s+')) as pvt'
exec sp_executesql @sql;
print @sql;


exec ('select * into Sales.FreightTotals from '+@sql); ---- Why will this not work??