use TaxiEarnings
go

with Cte 
as 
(
select *, ROW_NUMBER() over(PARTITIOn by StartDate order by StartDate) as RowNumber 
from taxi.TaxiJournal
)
delete from Cte where RowNumber > 1;