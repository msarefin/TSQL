--Taxi Journal Insert Table Data 
go 
use TaxiEarnings;
go 

--select * from Taxi_Journal;


go 
declare 
@StartDate as Date,
@LeaseID as int, 
@CashTrips as int,
@CreditTrips as int,
@CashEarnings as float,
@CreditEarnings as float,
@Gas as float, 
@Toll as float, 
@STSRH as float,
@IMSRH as float

set @StartDate					='4/3/2016'
set @LeaseID					=4
set @CashEarnings				=164.08
set @CreditEarnings				=236.56
set @Gas						=14
set @Toll						=16.62
set @STSRH						=11.5
set @IMSRH						=6.9
set @CashTrips					=10
set @CreditTrips				=12


--delete from TAXI.TaxiJournal where StartDate = @StartDate
insert into TAXI.TaxiJournal
(StartDate,LeaseID,CashTrips,CreditTrips,CashEarnings,CreditEarnings,Gas,Tolls,STSRH,IMSRH)
values
(@StartDate,@LeaseID,@CashTrips,@CreditTrips,@CashEarnings,@CreditEarnings,@Gas,@Toll,@STSRH,@IMSRH)
--where not exists(select * from taxi_journal where StartDate = @StartDate);


--delete from Taxi_Journal where StartDate = '01/09/2016'

go

with Cte 
as 
(
select *, ROW_NUMBER() over(PARTITIOn by StartDate order by StartDate) as RowNumber 
from taxi.TaxiJournal
)
delete from Cte where RowNumber > 1;

--select * from [Taxi Lease]


--go 
--with taxi_Worksheet as 
--(
--select 
--tj.StartDate, 
--(tj.StartDate+1) as EndDate
--from Taxi_Journal tj
--)
--select * from taxi_Worksheet

select * from TAXI.TaxiJournal order by StartDate desc;

