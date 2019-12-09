create table Users
(
	ID int not null primary key identity(1,1),
	[User] varchar(10) not null,
	[Password] nvarchar(18) not null,
	Email nvarchar(50) not null
)

create table Documents(
	ID int not null primary key identity(1,1),
	[Format] varchar(5) not null,
	IsDeleted bit not null
)
create table DocumentVersions(
	ID int not null primary key identity(1,1),
	[Name] varchar(128) not null,
	DocumentID int not null foreign key references Documents(ID),
	ChangeOnDateTime datetime not null,
	ChangedByUserID int not null foreign key references Users(ID),
	Comment nvarchar(max) null,
	Content nvarchar(max) null,
	SizeInKB decimal(16, 2) not null,
)
create table DocumentUsers(
	ID int not null primary key identity(1,1),
	UserID int not null foreign key references Users(ID),
	DocumentID int not null foreign key references Documents(ID),
)