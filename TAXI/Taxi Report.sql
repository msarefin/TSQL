 use TaxiEarnings
 go
--
select * from  TAXI.vTaxiWorksheet as vt order by vt.StartDate desc;

--Monthly Report 
go 

select 
COUNT(t.StartDate)'Days Worked', 
t.Year,
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
from TAXI.vTaxiWorksheet as t 
group by t.Year,t.Months,t.[Month Number]
order by t.Year,t.[Month Number];

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Taxi Company Money Matters

use TaxiEarnings
go 

declare @date as date ='4/1/2016';

with cte_AmountOwed as 
(select COUNT(v.StartDate) as 'No of days worked',
SUM(v.Cash) as 'Total Cash',
SUM(v.Credit) as 'Total Credit',
SUM(v.[Total Earnings]) as 'Total Earnings',
SUM(v.[Total Expenses]) as 'Total Expense',
SUM(v.[Profit (Loss)]) as 'Profit/-Loss',
SUM(v.[Amount Owed From (To) Taxi Company]) as 'Total Amount Owed From / -To Taxi Comany',
SUM(v.[Cash in Hand]) as 'Cash in Hand'
from TAXI.vTaxiWorksheet as v where v.StartDate between @date and GETDATE())

select * from cte_AmountOwed;
go 

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
---------------------------------------------------------------
--Yearly Income 
--
select a.Year,SUM(a.Cash) as 'Total Cash',sum(a.credit) as 'Total Credit', SUM(a.[Profit (Loss)]) as 'Total Profit'
from TAXI.vTaxiWorksheet as a
group by a.Year

----------------------------------------------------------------
--Monthly Income

select 
v.Year, 
v.Months, 
SUM(v.Cash) as 'Cash', 
SUM(v.Credit) as 'Credit', 
SUM(v.[Total Earnings]) as 'Total Earnings', 
SUM(v.[Total Expenses]) as 'Total Expense',
SUM(v.[Profit (Loss)]) as 'Profit or Loss',
SUM(v.[Amount Owed From (To) Taxi Company]) as 'Amount Owed from / to Taxi Company',
SUM(v.[Total Trips]) as 'Total Trips'
from TAXI.vTaxiWorksheet v
group by v.Months, v.[Month Number],v.Year
order by v.Year, v.[Month Number];

----------------
--Months elapsed 

-------------

select DATEDIFF(MM,t.StartDate, GETDATE()) as 'Months Ago',* 
from TAXI.vTaxiWorksheet as t
order by t.StartDate desc

use TaxiEarnings
go 

-- Average By day

select 
v.Year,
--v.Months,
v.DayOfWeek,
AVG(v.Cash) as 'Avarage Cash',
AVG(v.Credit) as 'Avarage Credit',
AVG(v.[Total Earnings]) as 'Avarage Earnings',
AVG(v.[Total Expenses])as 'Avarae Expense',
AVG(v.[Profit (Loss)]) as 'Average Profit/ Loss',
AVG(v.[Cash in Hand]) as 'Average Cash in Hand'
from taxi.vTaxiWorkSheet as v
where v.Year  = 2016 --and v.[Month Number] = 1 and v.DayNumber = 1
group by v.Year, 
v.DayNumber,
--v.Months,
v.DayOfWeek
order by [Average Profit/ Loss]--, v.Year, v.DayNumber ;

-- daily Average

select 
v.Year,
AVG(v.Cash) 'Average cash', AVG(v.Credit) 'Aerage Credit', AVG(v.[Profit (Loss)]) 'Average Profit' 
from taxi.vTaxiWorkSheet as v
group by v.Year
--

select  
SUM(v.Cash) as cash,
SUM(v.Credit) as credit,
SUM(v.Gas) as gas,
SUM(v.Lease) as lease,
SUM(v.Tolls) as tolls,
SUM(v.STSRH) as STSRH,
SUM(v.IMSRH) as IMSRH,
SUM(v.[Total Earnings]) as 'Total Earnings',
SUM(v.[Total Expenses]) as 'Total Expense',
SUM(v.[Profit (Loss)]) as 'Profit/Loss',
SUM(v.[Amount Owed From (To) Taxi Company]) as 'Amount Owed from LIC',
SUM(v.[Cash in Hand]) as 'Cash in Hand',
SUM(v.[Cash Trips]) as 'Cash Trips',
SUM(v.[Credit Trips]) as 'Credit Trips',
SUM(v.[Total Trips]) as 'Total Trips'
from TAXI.vTaxiWorksheet as v where v.Year = 2016
