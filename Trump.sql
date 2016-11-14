with Trump_cte
as 
(
select cast('20161108' as DATETIME) as 'Trump Elected'
)
select 
[Trump Elected], 
DATEDIFF(DAY, [Trump Elected], GETDATE()) as [days passed],
DATEDIFF(MONTH,[Trump Elected], GETDATE()) as [Months passed],
DATEDIFF(YEAR,[Trump Elected], GETDATE()) as [Years Passed],
DATEADD(YEAR,4,[Trump Elected]) as [Next Eletion] 
from Trump_cte