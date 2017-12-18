use TSQL2012;
go 


select 
	custid, 
	orderid, 
	val,
	SUM(val) over(partition by custid) as [Cust total],
	sum(val) over() as [grand total]
from sales.OrderValues as v; 

--

select 
	custid, 
	orderid, 
	val, 
	CAST(100*val/sum(val) over(partition by custid) as numeric(5,2)) as pctcust, 
	CAST(100*val/sum(val) over() as numeric(5,2)) as pcttotal 
from sales.OrderValues; 

---- fraiming 

select 
	custid, 
	orderid, 
	orderdate, 
	val,
	SUM(val) over(partition by custid 
	order by orderdate, orderid 
	rows between unbounded preceding and current row) as [running total]
from sales.OrderValues;  

---

select 
	custid, orderid, orderdate, val, 
	sum(val) over(partition by custid order by orderdate, orderid rows unbounded preceding) [Running total]
from sales.OrderValues; 

--- 

select d.custid, d.orderid, cast(d.orderdate as date) as [date], d.val,
sum(val) over(partition by d.custid order by val rows between unbounded preceding and current row) as 'Total'
from sales.ordervalues as d
order by d.orderid
offset 0 rows fetch next 10 rows only
;

select custid,shipperid, freight, 
sum(freight) over(partition by custid order by shipperid, custid rows between unbounded preceding and current row) as RunningTotal
from sales.orders
order by custid; 

select custid, shipperid, freight, 
sum(freight) over(partition by custid order by shipperid, custid rows between unbounded preceding and unbounded following) GrandTotal
from sales.Orders
;

use TSQL2012;
go 

select 
	custid, shipperid, val,
	sum(val) over(partition by custid order by shipperid, custid rows between 1 preceding and 1 following) as [total],
	sum(val) over(partition by custid order by shipperid, custid rows between unbounded preceding and unbounded following) as [Garand total],
	sum(val) over(partition by custid order by shipperid, custid rows between unbounded preceding and current row) as [Running total]
from sales.OrderValues
; 
-------------------------------------

go 
use TSQL2012; 
go

with c
as
(
select n1.n as n1, n2.n as n2 from dbo.Nums as n1 cross join dbo.Nums as n2
where n1.n <=10 and n2.n<=10

union all 

select n1.n as n1, n2.n as n2 from dbo.Nums as n1 cross join dbo.Nums as n2
where n1.n <=10 and n2.n<=10


)

select n1, n2,
--sum(n2) as [Sum], 
--sum(n2) over() as [grand Total], 
--sum(n2) over(order by n1) as [running grand total],
--sum(n2) over(partition by n1) as [Grand total per set ],
--sum(n2) over(partition by n1 order by n2, n2 rows between unbounded preceding and unbounded following) as [Grand Total per set ],

--sum(n2) over(partition by n1 order by n2) as [running total per set ],
--sum(n2) over(partition by n1 order by n2 rows between unbounded preceding and current row) as [Running Total per set],

--sum(n2) over(partition by n1 order by n2 rows between 1 preceding and 1 following) as [Total between], 



sum(n2) over( order by n2 rows between unbounded preceding and current row) as [Running Total],
sum(n2) over( order by n2 rows between unbounded preceding and unbounded following) as [Grand Total],

sum(n2) over( order by n2 range between unbounded preceding and current row) as [Running Total],
sum(n2) over( order by n2 range between unbounded preceding and unbounded following) as [Grand Total]

from c
where n1 <=1--group by n1,n2
--order by n1,n2;
