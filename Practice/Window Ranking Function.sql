use TSQL2012; 
go 
select
	custid, orderid, val, 
	ROW_NUMBER() over(order by val) as [rownum],
	RANK()over(order by val) as [rnk], 
	DENSE_RANK() over(order by val) as [Drnk],
	ntile(100) over(order by val) as [ntile10]
from Sales.OrderValues
; 



