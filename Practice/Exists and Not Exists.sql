--Not Exist 

select custid, companyname
from sales.Customers as c where not exists (select * from sales.Orders as o where o.custid=c.custid and o.orderid='20070212'); 

-- exists 

select custid, companyname
from sales.Customers as c where exists(select * from sales.orders as o where o.custid= c.custid and o.orderid='20070212');

-- Derived table 

select * 
from (
select ROW_NUMBER() over(partition by categoryid order by unitprice, productid) as rownum, 
categoryid, 
productid,
productname, 
unitprice 
from Production.Products) as d
where rownum <=2
;
