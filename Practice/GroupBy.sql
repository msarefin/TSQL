use TSQL2012; 
go 

select count(*) as 'NumberOfOrders', shipperid
from sales.Orders
group by shipperid;



select COUNT(shipperid) as 'NumberOfOrders'
from sales.orders
group by shipperid;



select COUNT(*) as [Number of orders]
from sales.orders
group by shipperid; 

---- The NUmberOf Orders in both queries yiels the same numbers


select shipperid, YEAR(shippeddate) as [Shipped Date], COUNT(*) as [Number of orders]
from Sales.orders
group by shipperid, YEAR(shippeddate);

----------------


select shipperid, YEAR(shippeddate) as 'Shipped Date', COUNT(*) as 'Number Of Orders'
from Sales.Orders
where shippeddate is not null 
group by shipperid, year(shippeddate)
having COUNT(*) <100;

------------------------------------------------

select shipperid, YEAR(shippeddate) as 'Shipped Date', COUNT(*) as 'Number Of Orders'
from Sales.Orders
group by shipperid, year(shippeddate)
having year(shippeddate) is not null and COUNT(*) <100;

-------------------------------------------------

select shipperid, 
COUNT(*) as 'numoforders',
COUNT(shippeddate) as 'shippedorders', 
min(cast(shippeddate as date)) as 'firstdate',
MAX(cast(shippeddate as date)) as 'lastdate',
SUM(val) as 'TotalValue'
from sales.OrderValues
group by shipperid; 

-- The shippedorders colum doesnt match the num of orders because there are orders that didn't ship yet.


select shipperid, COUNT(distinct shippeddate) as numshippindate
from Sales.Orders group by shipperid; 



--

select s.shipperid, s.companyname, COUNT(*) as numorders
from Sales.Shippers as s join sales.orders as o 
on s.shipperid=o.shipperid
group by s.shipperid, s.companyname


--

select s.shipperid, MAX(companyname) as numorders, COUNT(*) as shippedorders
from sales.Shippers as s inner join sales.Orders as o 
on s.shipperid=o.shipperid group by s.shipperid;

--- 
with c as 
(
select shipperid, COUNT(*) as numorders
from Sales.orders
group by shipperid
)

select s.shipperid,s.companyname, numorders
from Sales.Shippers as s inner join c on s.shipperid=s.shipperid;
;

--working with multiple Grouping sets 



select shipperid, year(shippeddate) as shipyear, count(*) as numorders
from sales.Orders
group by grouping sets
(
(shipperid, year(shippeddate)),
(shipperid),
(YEAR(shippeddate)),
()
)
;

--

select shipperid, year(shippeddate) as shipyear, count(*) as numorders from sales.Orders
group by grouping sets
(
(shipperid, year(shippeddate)),(shipperid),(year(shippeddate)),()
)
;
go
with cte
as
(
select 
	shipperid, 
	GROUPING(shipperid) as 'gshipperid',
	YEAR(shippeddate) as shipyear, 
	GROUPING(YEAR(shippeddate)) as 'gshipyear',
	COUNT(*) as numorders,
	GROUPING_ID(shipperid, YEAR(shippeddate)) as 'grpid'
from Sales.Orders
group by cube(shipperid, YEAR(shippeddate))
<<<<<<< HEAD
)

select 
	shipperid, 
	gshipperid,
	shipyear, 
	gshipyear,
	CONCAT(gshipperid, gshipyear), 
	grpid
from cte;

/*
grouping accepts one element in the grouping set. 
If the output is 0 then the element is part of the grouping set. 
If the output is 1 then the element is not part of the grouping set.
--------------------------------------------------------------------


*/
=======
;


--- 

use TSQL2012;
go 


select shipperid, year(shippeddate) as shipyear, count(*) as numorders
from sales.orders
group by grouping sets 
(
(shipperid, year(shippeddate)),
(shipperid),
(YEAR(shippeddate)),
()
)
>>>>>>> 2b650e85d589e217811b3f4746ab3a549359360e
