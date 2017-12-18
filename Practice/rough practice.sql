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


print charindex('t','constantinople')
---- 
select patindex('%[baba]%','constantinople')

select datalength(N'constantinople') bytes 

select STUFF('constantinople', 2,3,'')
go 


select GETDATE(), SYSDATETIME(), CURRENT_TIMESTAMP
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

Insert into Sales.FreightTotals Exec sp_executesql @sql;
--exec ('select * into Sales.FreightTotals from '+@sql); ---- Why will this not work??

select * from Sales.FreightTotals




use TSQL2012; 
go 

select  
	v.custid,cast(v.orderdate as date) as [date], v.empid, val, 
	SUM(val) over(partition by v.custid order by orderdate, custid 
	rows between unbounded preceding and current row)
from sales.OrderValues as v
; 

select 
	v.custid, CAST(v.orderdate as date), val, 
	sum(val) over(partition by v.custid order by v.orderdate, v.custid
	rows between unbounded preceding and current row) 
from sales.OrderValues as v 
; 

select 
	custid, 
	CAST(orderdate) as [date],
	val, 
	SUM(val) over(partition by custid order by orderdate, custid
	rows between unbounded preceding and current row)
from sales.OrderValues
;

use TSQL2012; 
go

select top 5
	custid, CAST(orderdate as date) as [Date],
	count(val) over(order by val range between unbounded preceding and current row)
from sales.OrderValues as v; 

select top 5
v.custid, 
cast(v.orderdate as date) as [date], 
count(v.val) over(order by val rows between unbounded preceding and current row)
from sales.OrderValues as v 

select  top 5
	custid, 
	cast(orderdate as date) as [date], 
	count(val) over(partition by custid order by val rows between unbounded preceding and current row)
from sales.OrderValues
