use TSQL2012
go 

/*
working with pivote table and unpivote table 
*/

with PivoteData as 
(
select 
	custid,		-- Grouping Column
	shipperid,	-- spreading column
	freight		-- aggirgate column
from Sales.Orders
)
select custid, [1],[2],[3]
from PivoteData
 pivot(sum(freight) for shipperid in ([1],[2],[3])) as p
 order by custid; 

/*select
	custid, 
	shipperid, 
	SUM(freight) 
from sales.Orders 
group by shipperid, custid
order by custid
*/


go
with pt
as (
select custid, shipperid, freight from sales.orders as d)
select custid, [1],[2],[3] from pt pivot (count(freight) for shipperid in ([1],[2],[3])) as p 
order by custid
;

------------------------Dynamic Pivot table----------------


use TSQL2012; 
go 

declare @shipperid nvarchar(max) =''


select  @shipperid += quotename(d.shipperid) +',' 
from Sales.Orders as d
group by d.shipperid

set @shipperid = LEFT(@shipperid, LEN(@shipperid)-1)

--print @shipperid
declare @sql varchar(max) 
set @sql=
'
with pt as 
(
select custid,shipperid, freight 
from Sales.Orders
)

select custid,freight from pt
pivot(sum(freight) for shipperid in ('+@shipperid+')) as pvt
'

exec sp_executesql @Sql;

