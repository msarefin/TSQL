--Taxi Earnings Worksheet

use TaxiEarnings
go 



-----------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------
go 
create view TAXI.vTaxiWorkSheet
as

(
select 
DATEPART(YEAR, tj.StartDate) as 'Year',
DATEPART(MM,tj.startdate) as 'Month Number',
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
go
select * from taxi.vTaxiWorkSheet
--select 
--w.Months,w.DayOfWeek, w.StartDate, w.EndDate, w.LeaseType, w.Cash, w.Credit, w.Lease, w.Gas, w.Tolls, w.STSRH, w.IMSRH, w.[Total Earnings], w.[Total Expenses], w.[Profit (Loss)], w.[Amount owed from (to) Taxi Company] as 'From/To',w.[Cash Trips], w.[Credit Trips], w.[Total Trips]
--from taxi_Worksheet w
--order by w.StartDate

--select * from vTaxiEarnings order by StartDate

