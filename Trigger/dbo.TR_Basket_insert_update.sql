create trigger dbo.TR_Basket_insert_update on dbo.Basket
after insert, update
as
begin
	declare
		@ID_SKU int
		,@Count int
	
	select @ID_SKU = ID_SKU
	from inserted
	select @Count = count(*)
	from dbo.Basket
	where ID_SKU = @ID_SKU

	if @Count >= 2
		begin			
    			update b
    			set DiscountValue = Value * 0.05
   			from dbo.Basket as b
    			where b.ID_SKU = @ID_SKU
		end
	else
		begin			
    			update b
    			set DiscountValue = 0
   			from dbo.Basket as b
    			where b.ID_SKU = @ID_SKU
		end
end
