create table dbo.SKU (
	ID int not null identity,
	Code as 's' + cast(ID as varchar(255)),
	Name varchar(255) not null,
	constraint PK_SKU primary key clustered (ID),
	constraint UK_SKU_Code unique (Code)
);

create table dbo.Family (
	ID int not null identity,
	SurName varchar(255) not null,
	BudgetValue int not null
	constraint PK_Family primary key clustered (ID)
);

create table dbo.Basket (
	ID int not null identity,
	ID_SKU int not null,
	ID_Family int not null,
	Quantity int not null,
	Value int not null,
	DatePurchase datetime not null,
	DiscountValue int not null,
	constraint PK_Basket primary key clustered (ID),
	constraint FK_Basket_ID_SKU_SKU foreign key (ID_SKU) references dbo.SKU(ID),
	constraint FK_Basket_ID_Family_Family foreign key (ID_Family) references dbo.Family(ID),
	constraint DF_Basket_DatePurchase default getdate() for DatePurchase,
	constraint CK_Basket_Quantity check(Quantity >= 0),
	constraint CK_Basket_Value check(Value >= 0)
);
