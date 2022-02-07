CREATE DATABASE Gym

CREATE TABLE Locations (
Id int NOT NULL IDENTITY CONSTRAINT PK_Locations_Id PRIMARY KEY ,
Address varchar (50) NOT NULL
)

CREATE TABLE Trainers (
Id int NOT NULL IDENTITY CONSTRAINT PK_Trainers_Id PRIMARY KEY ,
FName varchar (30) NOT NULL,
LName varchar (30) NOT NULL,
Bday date NOT NULL,
Phone char(12) NOT NULL,
Qualification varchar (100)
)

CREATE TABLE Memberships(
Id int NOT NULL IDENTITY CONSTRAINT PK_Memberships_Id PRIMARY KEY ,
Name varchar (100),
Price decimal(8,2) NOT NULL
)

CREATE TABLE Personal_Cards(
Id int NOT NULL IDENTITY CONSTRAINT PK_Personal_Cards_Id PRIMARY KEY ,
Personal_Cards int NOT NULL UNIQUE,
Status bit
)

CREATE TABLE Customers (
Id int NOT NULL IDENTITY CONSTRAINT PK_Customers_Id PRIMARY KEY ,
FirstName varchar(30) NOT NULL,
LastName varchar (30) NOT NULL,
Phone char (12),
BirthDay date,
Id_Card int FOREIGN KEY REFERENCES Personal_Cards(Id)
)

CREATE TABLE MembershipsOrders (
Id int NOT NULL IDENTITY CONSTRAINT PK_MembershipsOrdes_Id PRIMARY KEY ,
Id_Castomer int FOREIGN KEY REFERENCES Customers(Id),
Id_Membership int FOREIGN KEY REFERENCES Memberships(Id),
StartDay date NOT NULL,
EndDay date NOT NULL
)

CREATE TABLE Visits (
Id int NOT NULL IDENTITY CONSTRAINT PK_Visits_Id PRIMARY KEY ,
Id_Customer int FOREIGN KEY REFERENCES Customers(Id),
Id_Trainer int FOREIGN KEY REFERENCES Trainers(Id),
Id_Location int FOREIGN KEY REFERENCES Locations(Id),
Date_visit datetime NOT NULL
)

