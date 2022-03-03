-------------------------------------------------------------------------------------
--------------------статистика продажів---------------------------------------------
-------------------------------------------------------------------------------------

CREATE VIEW SaleStatistics
AS
SELECT m.Name,mo.StartDay AS DateOfSale,COUNT(Name)OVER(Partition by m.Name) AS Quantity,SUM(Price) OVER(Partition by m.Name)  AS Amount   FROM MembershipsOrders mo
Join Memberships m
ON mo.Id_Membership=m.Id;

SELECT * FROM SaleStatistics
SELECT* FROM SaleStatistics
WHERE MONTH(DateOfSale)=2

-------------------------------------------------------------------------------------
-------------------прибуток залу з кожного абонементу--------------------------------
-------------------------------------------------------------------------------------

CREATE VIEW Profit
AS
SELECT m.Name,SUM (Price) AS Amount   FROM MembershipsOrders mo
Join Memberships m
ON mo.Id_Membership=m.Id
GROUP BY m.Name

SELECT * FROM Profit

-------------------------------------------------------------------------------------
-------------кількості тренувань в тренерів з адресою-------------------------------
-------------------------------------------------------------------------------------

CREATE VIEW CountWorkoutsTrainers
AS
SELECT DISTINCT t.FName,t.LName,l.ADDRESS, COUNT (v.Id_Trainer)OVER(PARTITION BY v.Id_Trainer) AS AMOUNT FROM Visits v
Join Trainers t
ON v.Id_Trainer=t.Id
JOIN Locations l
ON v.Id_Location=l.Id;
 
SELECT * FROM CountWorkoutsTrainers
WHERE Address ='St.Boykivska, 5'


-------------------------------------------------------------------------------------
--------------------------відвудування клієнтів--------------------------------------
-------------------------------------------------------------------------------------
CREATE VIEW QuantityVisits
AS
SELECT c.Id,COUNT([Id_Customer]) AS Quantity FROM Visits v
JOIN Customers c
ON c.Id=v.Id_Customer
GROUP BY c.Id

SELECT c.FirstName,c.LastName, q.Quantity FROM QuantityVisits q
JOIN Customers c
ON q.Id=c.Id
ORDER BY q.Quantity DESC

-------------------------------------------------------------------------------------
--------------- id абонементів з к-ть клієнтів що їх замовили------------------------
-------------------------------------------------------------------------------------
CREATE VIEW QuantityMemberships
AS
SELECT Id_Membership, COUNT(ID_CUSTOMER) AS Quantity  FROM MembershipsOrders
GROUP BY Id_Membership;


SELECT m.Name , q.Quantity FROM Memberships m
JOIN QuantityMemberships q
ON q.Id_Membership=m.Id


-------------------------------------------------------------------------------------
--------------------- назва клієнта,загальна сума,дата купівлі-----------------------
-------------------------------------------------------------------------------------
CREATE VIEW TOTALSUM
AS
SELECT c.FirstName,c.LastName,mo.Startday, SUM (Price) OVER(PARTITION BY c.FirstName,c.LastName) AS TOTALSUM FROM MembershipsOrders mo
JOIN Memberships m
ON m.Id=mo.Id_Membership
JOIN Customers c
ON c.Id=mo.Id_Customer

SELECT * FROM TOTALSUM


-------------------------------------------------------------------------------------
------витягуємо для кожного клієнта к-ть днів що залишилось по абонементу------------
-------------------------------------------------------------------------------------

CREATE VIEW QuantityDAY
AS
SELECT ID_Customer,Id,DATEDIFF(day,GETDATE(),Endday) AS QuantityDAY FROM MembershipsOrders;

SELECT* FROM  QuantityDAY
WHERE QuantityDAY>0

