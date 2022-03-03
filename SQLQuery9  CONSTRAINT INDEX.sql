/*---додаю значення UNIQUE
ALTER TABLE Personal_Cards
ADD CONSTRAINT UC_Personal_Cards UNIQUE (Personal_Card)*/--- виконано
--foreign key,primary key
--типи даних , NOT NULL
-- getdate по дефолту табл Visits 
ALTER TABLE Visits
ADD CONSTRAINT DF_Visits_Date DEFAULT GETDATE() FOR Date_visit

--INDEX foreign key,primary key кластерний
CREATE INDEX IDX_StartDay ON  MembershipsOrders (StartDay);
CREATE INDEX IDX_EndDay ON  MembershipsOrders (EndDay);
CREATE INDEX IDX_FLname ON  Customers (FirstName,LastName);
CREATE INDEX IDX_FLnameTrainers ON  Trainers (FName,LName);
CREATE INDEX IDX_DateOfVisit ON  Visits (Date_visit);