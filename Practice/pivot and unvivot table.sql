use TSQL2012
go 

/*
working with pivote table and unpivote table 
*/

with PivoteData as 
(
select 
	custid, 
	shipperid, 
	freight
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

