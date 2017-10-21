--Not Exist 

select custid, companyname
from sales.Customers as c where not exists (select * from sales.Orders as o where o.custid=c.custid and o.orderid='20070212'); 

-- exists 

select custid, companyname
from sales.Customers as c where exists(select * from sales.orders as o where o.custid= c.custid and o.orderid='20070212');

