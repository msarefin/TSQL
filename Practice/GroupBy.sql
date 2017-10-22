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

select shipperid, YEAR(shippeddate) as [Shipped Date], COUNT(*) as [Number of orders]
from Sales.orders
group by shipperid, YEAR(shippeddate)

select shipperid, YEAR(shippeddate) as 'Shipped Date', COUNT(*) as 'Number Of Orders'
from Sales.Orders
where shippeddate is not null 
group by shipperid, year(shippeddate)
having COUNT(*) <100;

select shipperid, 
COUNT(*) as 'numoforders',
COUNT(shippeddate) as 'shippedorders', 
min(cast(shippeddate as date)) as 'firstdate',
MAX(cast(shippeddate as date)) as 'lastdate',
SUM(val) as 'TotalValue'
from sales.OrderValues
group by shipperid; 


select shipperid, COUNT(distinct shippeddate) as numshippindate
from Sales.Orders group by shipperid; 

--

select s.shipperid, s.companyname, COUNT(*) as numorders
from Sales.Shippers as s join sales.orders as o 
on s.shipperid=o.shipperid
group by s.shipperid, companyname


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
