if object_id('Incheck') is not null drop table Incheck
if object_id('[Events]') is not null drop table [Events]
if object_id('[DocumentUsers]') is not null drop table DocumentUsers
if object_id('[Operation]') is not null drop table Operation
if object_id('[Tag]') is not null drop table Tag
if object_id('[Documents]') is not null drop table Documents
if object_id('[Users]') is not null drop table Users

create table Users
(
	ID int not null primary key identity(1,1),
	[Name] varchar(10) not null,
	[Password] nvarchar(18) not null,
	Email nvarchar(50) not null,
)


create table Documents(
	ID int not null primary key identity(1,1),
	Title nvarchar(64) not null,
	Content nvarchar(max),
	[Format] varchar(5) not null,
	[URL] varchar(128),
	IsDeleted bit not null,
)


create table Tag(
	ID int not null primary key identity(1,1),
	Type varchar(5) not null,
	Data nvarchar(max),
)


create table Incheck(
	ID int not null primary key identity(1,1),
	DocumentID int not null foreign key references Documents(ID),
	TagID int not null foreign key references Tag(ID)
)


create table Operation(
	ID int not null primary key identity(1,1),
	[Name] varchar(128) not null,
)


create table [Events](
	ID int not null primary key identity(1,1),
	DocumentID int not null foreign key references Documents(ID),
	OperationID int not null foreign key references Operation(ID),
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
