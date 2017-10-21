use TSQL2012; 
go 

-- subqueries 

select productid, productname, unitprice
from Production. Products
where unitprice = (select min(unitprice) from production.Products);

select productid, productname, unitprice
from Production.Products 
where supplierid in (select supplierid from Production.Suppliers where country=N'japan')

-- Correlated SubQUERY

select categoryid, 
productid, 
productname, 
unitprice
from Production.Products as p1
where unitprice = (
select min(unitprice) 
from Production.Products as p2 
where p2.categoryid=p1.categoryid
)
;





