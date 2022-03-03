--������ �� ��������� ������ �볺���
CREATE TRIGGER NewCustomers ON Customers
AFTER INSERT
AS PRINT '����� ������'

EXEC NewMembership
 @FirstName='Semen'
  ,@LastName='Petrovuch'
  ,@Phone='380635756496'
  ,@BirthDay='2000-12-03'
  ,@Id_Membership=5
GO

---��� ������ ���������� �����
ALTER TRIGGER NewCustomers1 ON Customers
AFTER INSERT
AS 
DECLARE @FirstName varchar(30)= (SELECT FirstName FROM inserted)
DECLARE @LastName varchar(30)= (SELECT LastName FROM inserted)
PRINT 'Customer ' + @FirstName+ ' '+ @LastName + ' was added! '

