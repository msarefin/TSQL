use TSQL2012;
go 

select 
v.custid, 
SUM(val) over(partition by v.custid),
cast(100* val/(SUM(val) over(partition by v.custid)) as numeric(5,2)) as custtotal, 
cast(100* val/(SUM(val) over()) as numeric(5,2)) as grandtotal,
SUM(val) over()
from sales.OrderValues as v 
 


