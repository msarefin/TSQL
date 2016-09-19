use TaxiEarnings
go 

insert into TAXI.TaxiJournal(StartDate,LeaseID, CashEarnings, CreditEarnings, Gas, Tolls, STSRH, IMSRH, CashTrips, CreditTrips)
values
('4/4/2016',	4,	64,	310.04,	10,5.54,10,6,5,15),
('4/5/2016',	4,	128.10,189.45,15,0,9.5,5.7,7,12),
('4/6/2016',	4,	72.60,238.59,16,5.54,11,6.6,7,15);
select * from taxi.TaxiJournal
order by StartDate desc