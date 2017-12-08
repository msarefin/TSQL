-- UNPIVOT 
use TSQL2012; 
go

if OBJECT_ID('Sales.FreightTotals') is not null drop table Sales.FreightTotals
go 

with pd as
(
select custid, shipperid, freight from sales.orders
)
select * into Sales.FreightTotals from pd 
pivot(sum(freight) for shipperid in ([1],[2],[3])) as p 


select * from Sales.FreightTotals order by custid

--- unpivoting 

select custid, shipperid, freight
from sales.FreightTotals as t 
unpivot(freight for shipperid in ([1],[2],[3])) as u
order by custid, shipperid; 
