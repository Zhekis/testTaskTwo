create view dbo.vw_SKUPrice
as
select
	s.Code as Code, 
	s.Name as Name,
	dbo.udf_GetSKUPrice(s.ID) as SKUPrice
from dbo.SKU as s;
