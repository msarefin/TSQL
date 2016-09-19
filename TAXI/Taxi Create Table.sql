create database TaxiEarnings;
go 
use TaxiEarnings;
go 

create schema TAXI;

go 
--select * from sys.tables

--drop table taxi_journal
 
create table TAXI.TaxiJournal
(
StartDate date,
LeaseID int ,
CashTrips int,
CreditTrips int,
CashEarnings money,
CreditEarnings money,
Gas money,
Tolls money,
STSRH money,
IMSRH money
)

create table TAXI.ExtraExpense
(
ExpenseType Varchar(11),
Amount money)

create table TAXI.TaxiLease
(
ID int primary Key, 
LeaseType varchar(13),
Monday money, 
Tuesday money, 
Wednesday money,
Thursday money,
Friday money,
Saturday money, 
Sunday money
)

alter table TAXI.TaxiJournal
add constraint FK_LeaseID
foreign key (LeaseID)
references TAXI.TaxiLease(ID)

go 
select * from TAXI.TaxiJournal;
select * from TAXI.ExtraExpense
select * from TAXI.TaxiLease



