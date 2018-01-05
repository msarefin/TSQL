-- Querying full text data
use TSQL2012;
go 


-- Check if full text filter is instaled or not?
select serverproperty('Isfulltextinstalled') as 'Is full text search enable?'

--Chekc which filters are installed?

exec sys.sp_help_fulltext_system_components 'filter';

select document_type, path 
from sys.fulltext_document_types

