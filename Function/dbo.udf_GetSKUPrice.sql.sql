create function dbo.udf_GetSKUPrice(
	@ID_SKU
)
returns decimal(18,2)
as
begin
	declare @SKUPrice decimal(18,2)
	select @SKUPrice = sum(cast(Value as decimal(18,2))) / sum(cast(Quantity as decimal(18,2)))
	from dbo.Basket
	where ID_SKU = @ID_SKU

	return @SKUPrice
end
