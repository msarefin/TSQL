--Taxi Earnings Worksheet

use TaxiEarnings
go 



-----------------------------------------------------------------------------------------------------------------------------------------------------
go 


drop table #temp

----------------------------------------------------------------------------------------------------------------------------------------------------
go 
with taxi_Worksheet as 
(

select 
DATEPART(YEAR, tj.StartDate) as 'Year',
case DATEPART(MONTH,tj.StartDate)
when 1 then 'Jan'
when 2 then 'Feb'
when 3 then 'Mar'
when 4 then 'Apr'
when 5 then 'May'
when 6 then 'Jun'
when 7 then 'Jul'
when 8 then 'Aug'
when 9 then 'Sep'
when 10 then 'Oct'
When 11 then 'Nov'
when 12 then 'Dec'

end 
as 'Months',
case DATEPART(DW,tj.StartDate)
when 1 then 'Sunday'
when 2 then 'Monday'
when 3 then 'Tuesday'
when 4 then 'Wednesday'
when 5 then 'Thurdsday'
when 6 then 'Friday'
when 7 then 'Saturday'
end
as 'DayOfWeek',

DATEPART(DW,tj.StartDate) 'DayNumber',
tj.StartDate, 
DATEADD(DAY,1, tj.StartDate) as EndDate,
tj.LeaseID,
tl.LeaseType ,
tj.CashEarnings as Cash,
tj.CreditEarnings as Credit,

case 
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)


end as Lease,

tj.Gas,
tj.Tolls,
tj.STSRH,
tj.IMSRH, 

(tj.CashEarnings+ tj.CreditEarnings) as [Total Earnings],
((case 
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)


end)+tj.Gas+tj.Tolls+tj.STSRH+tj.IMSRH) as [Total Expenses],

((tj.CashEarnings+ tj.CreditEarnings)
-
((case 
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)


end)+tj.Gas+tj.Tolls+tj.STSRH+tj.IMSRH)
) as 'Profit (Loss)',
(tj.CreditEarnings-
(
(case 
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =1 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 1)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =2 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 2)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =3 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 3)+(select SUM(Amount) from TAXI.ExtraExpense)

when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 1 then (select Sunday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 2 then (select Monday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 3 then (select Tuesday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 4 then (select Wednesday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 5 then (select Thursday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 6 then (select Friday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)
when tj.LeaseID =4 and DATEPART(dw,tj.StartDate) = 7 then (select Saturday from taxi.TaxiLease where ID = 4)+(select SUM(Amount) from TAXI.ExtraExpense)


end)
+tj.Tolls+tj.STSRH+tj.IMSRH)) as 'Amount Owed From (To) Taxi Company',
(tj.CashEarnings-tj.Gas) as 'Cash in Hand',
tj.cashtrips as [Cash Trips],
tj.credittrips as [Credit Trips],
(tj.CashTrips+tj.CreditTrips) as 'Total Trips'
from TAXI.TaxiJournal as tj join TAXI.TaxiLease as tl on tj.LeaseID = tl.ID
)

select * into #temp from taxi_Worksheet;
--select 
--w.Months,w.DayOfWeek, w.StartDate, w.EndDate, w.LeaseType, w.Cash, w.Credit, w.Lease, w.Gas, w.Tolls, w.STSRH, w.IMSRH, w.[Total Earnings], w.[Total Expenses], w.[Profit (Loss)], w.[Amount owed from (to) Taxi Company] as 'From/To',w.[Cash Trips], w.[Credit Trips], w.[Total Trips]
--from taxi_Worksheet w
--order by w.StartDate

select * from #temp order by StartDate;

select distinct t.Year,
COUNT(t.StartDate)'Days Worked', 
t.Months, 
SUM(t.Cash) as 'Cash', 
SUM(t.Credit) as 'Credit', 
SUM(t.Lease) as 'Lease', 
SUM(t.Gas) as 'Gas', 
SUM(t.Lease) as 'Lease',
SUM(t.Tolls) as 'Tolls', 
SUM(t.STSRH) as 'STSRH', 
SUM(t.IMSRH) 'IMSRH', 
SUM(t.[Total Earnings]) as 'Total Earnings' , 
SUM(t.[Total Expenses]) as 'Total Expenses', 
SUM(t.[Profit (Loss)]) as 'Profit/Loss', 
SUM(t.[Amount Owed From (To) Taxi Company]) as 'Amount Owed', 
SUM(t.[Cash in Hand]) as 'Cash in Hand',
SUM(t.[Cash Trips]) as 'Cash Trips', 
SUM(t.[Credit Trips]) as 'Credit Trips', 
SUM(t.[Total Trips]) as 'Total Trips'
from #temp as t 
group by t.Year,t.Months
order by t.Year,t.Months;
