IF DB_ID('TaxiEarnings') is null
create database TaxiEarnings
else print 'Database Already Exists';

go 
use TaxiEarnings;
go 

IF not exists (select name from sys.schemas where name = 'TAXI')
execute('
create schema TAXI
')
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

insert into TAXI.TaxiLease(ID, LeaseType, Sunday,Monday, Tuesday, Wednesday, Thursday,Friday,Saturday)
values 
(1,		'Day',			105,	105,	105,	105,	105,	105,	105),
(2,		'Day Hybrid',	108,	108,	108,	108,	108,	108,	108),
(3,		'Night',		115,	115,	115,	120,	129,	129,	129),
(4,		'Night Hubrid',	118,	118,	115,	123,	132,	132,	132)

go 
insert into TAXI.ExtraExpense(ExpenseType,Amount)
values
('Credit Card',11),
('Tax',	4.77)

go 
select * from TAXI.TaxiJournal;
select * from TAXI.ExtraExpense
select * from TAXI.TaxiLease
