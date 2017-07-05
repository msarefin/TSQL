use tempdb;
go 

if OBJECT_ID(N'dbo.TestStructure', 'U') is not null 
drop table dbo.TestStructure
go 

create table dbo.TestStructure
(ID int not null, 
Filter1 char(36) not null, 
Filter2 char(216) not null);

--Generate information about the table

select 
	OBJECT_NAME(object_id) as Table_Name, 
	name as Index_name, 
	type, type_desc
from sys.indexes
where object_id= object_id(N'dbo.TestStructure', 'U');

-- heap allocation check

select 
	index_type_desc,
	page_count, 
	record_count, 
	avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(DB_ID(N'tempdb'),Object_ID(N'dbo.TestStructure'), null, null, 'detailed');

exec dbo.sp_spaceused @objname = N'dbo.TestStructure', @updateusage = true;

insert into dbo.TestStructure(ID, Filter1, Filter2)
values
(1,'a','b');

select 
	ID, 
	Filter1, 
	Filter2
from dbo.TestStructure;

select 
	index_type_desc,
	page_count,
	record_count, 
	avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(DB_ID(N'tempdb'), object_id(N'dbo.TestStructure'), null, null, 'detailed');

exec dbo.sp_spaceused @objname =N'dbo.TestStructure', @updateusage = true;

truncate table dbo.TestStructure

go 

declare @i int = 0;
while @i <30
begin
set @i = @i +1;
print @i
insert into dbo.TestStructure(ID, Filter1, filter2)
values
(@i,'a','b');
end


select * from dbo.TestStructure;

select 
	index_type_desc,
	page_count,
	record_count,
	record_count,
	avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(DB_ID(N'tempdb'), object_id(N'dbo.TestStructure'), null, null, 'detailed');

exec dbo.sp_spaceused @objname = N'dbo.TestStructure', @updateusage = true;

truncate table dbo.TestStructure;

----------------Clustered Index--------------------

create clustered index idx_cl_ID on dbo.TestStructure(ID);


select
	OBJECT_NAME(object_id) as Table_name,
	name as Index_name,
	type, type_desc 
from sys.indexes
where object_id=object_id(N'dbo.TestStructure', 'U');


select * from dbo.TestStructure;

go 

declare @i int = 0;
while @i<18630
begin 
	set @i = @i+1;
	insert into dbo.TestStructure(ID, Filter1, Filter2)
	values 
	(@i, 'a', 'b')
end 

select * from dbo.TestStructure;

select 
	index_type_desc,
	index_depth, 
	index_level,
	page_count,
	record_count,
	avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(DB_ID(N'Tempdb'), object_id(N'dbo.TestStructure'), null , null, 'detailed');

exec dbo.sp_spaceused @objname =N'dbo.TestStructure', @updateusage = true;

go 
truncate table dbo.TestStructure;
declare @i as int = 0 
while @i <8909
begin 
set @i = @i + 1;
insert into dbo.TestStructure(ID, Filter1, Filter2)
values(@i%100, 'a','b')
end ;

--------------------------------

select 
	OBJECT_NAME(object_id) as Table_Name,
	name, 
	type,
	type_desc
from sys.indexes
where object_id = object_id(N'dbo.TestStructure','U');
 
select 
	index_type_desc, 
	index_depth,
	index_level,
	page_count, 
	record_count,
	avg_page_space_used_in_percent
from sys.dm_db_index_physical_stats(DB_ID(N'tempdb'), OBJECT_ID(N'dbo.TestStructure'), null, null, 'detailed');

exec dbo.sp_spaceused @objname = N'dbo.TestStructure', @updateusage = true;

