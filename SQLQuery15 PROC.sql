-------------------------------------------------------------------------------------------
------Створення нового клієнта,його замовлення та присвоєння персональної карти------------
-------------------------------------------------------------------------------------------

CREATE PROCEDURE NewMembership
@FirstName varchar(30),
@LastName varchar (30),
@Phone char(12),
@BirthDay date,
@Id_Membership int
AS
BEGIN
DECLARE @Personal_Card int= (SELECT TOP 1 Id FROM Personal_Cards
							WHERE Status = 0
							ORDER BY NEWID())

DECLARE @EndDay date=(
CASE
WHEN @Id_Membership=1 THEN DATEADD(day, 365, GETDATE())
WHEN @Id_Membership=2 THEN DATEADD(day, 182, GETDATE())
WHEN @Id_Membership=3 THEN DATEADD(day, 30, GETDATE())
WHEN @Id_Membership=4 THEN DATEADD(day, 1, GETDATE())
WHEN @Id_Membership=5 THEN DATEADD(day, 1, GETDATE())
END )

INSERT INTO Customers (FirstName,LastName,Phone,BirthDay,Id_Card)
VALUES
(@FirstName,@LastName,@Phone,@BirthDay,@Personal_Card)

UPDATE Personal_Cards
SET Status=1
WHERE Id=@Personal_Card

INSERT INTO MembershipsOrders (Id_Customer,Id_Membership,StartDay,EndDay)
VALUES
(@@IDENTITY,@Id_Membership,GETDATE(),@EndDay)
END

EXEC NewMembership
 @FirstName='Viktoriia'
  ,@LastName='Dobrus'
  ,@Phone='380639906496'
  ,@BirthDay='1998-03-03'
  ,@Id_Membership=1
GO
SELECT * FROM Customers where BirthDay='1998-03-03'
SELECT * from Personal_Cards WHERE Id=9369
SELECT * FROM MembershipsOrders WHERE Id_Customer=504