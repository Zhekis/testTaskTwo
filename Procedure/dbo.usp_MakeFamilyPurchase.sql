create procedure dbo.usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
as
begin
	if exist (select 1 from dbo.Family as f where f.SurName = @FamilySurName)
	begin
		declare 
			@BudgetValue int
			,@ErrorMessage varchar(4000)

		select
			@BudgetValue = sum(b.Value)
		from dbo.Basket as b
			inner join dbo.Family as f on f.ID = b.ID_Family
		where f.SurName = @FamilySurName

		update f
		set BudgetValue = @BudgetValue
		from dbo.Family as f
	end
	else
		begin
			set @ErrorMessage = 'Такой семьи нет'
			raiserror(@ErrorMessage, 3, 1)

			return
		end
end
