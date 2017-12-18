use TSQL2012; 
go 

select custid, orderid, orderdate, val, 
LAG(val) over(partition by custid order by orderdate, orderid) as prev_val,
LEAD(val) over(partition by custid order by orderdate, orderid) as next_val
from Sales.OrderValues
; 


with TimeElapsed
as (
select 
	custid, 
	cast(orderdate as date) startdate,
	(LEAD(cast(orderdate as date)) over(partition by custid order by orderdate)) lastdate
from Sales.Orders as d
)

select 
custid, DATEDIFF(DAY, startdate, lastdate) as 'Days since last order'
from TimeElapsed order by [Days since last order];

