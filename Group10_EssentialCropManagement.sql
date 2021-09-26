PROMPT
PROMPT Everything in one script... 
PAUSE Press ENTER to continue...

-- Script to create all the tables and view them

-- dropping all the tables
DROP TABLE Seed CASCADE CONSTRAINTS;
DROP TABLE Buyer CASCADE CONSTRAINTS;
DROP TABLE Weather CASCADE CONSTRAINTS;
DROP TABLE Owner CASCADE CONSTRAINTS;
DROP TABLE Fertilizer CASCADE CONSTRAINTS;
DROP TABLE Production CASCADE CONSTRAINTS;
DROP TABLE Crop CASCADE CONSTRAINTS;
DROP TABLE MarketInfo CASCADE CONSTRAINTS;


-- creating all the tables with constraints
CREATE TABLE Seed(
Seed_ID NUMBER(7) NOT NULL,
SeedName VARCHAR(15),
PRIMARY KEY (Seed_ID)
);

CREATE TABLE Buyer( 
Buyer_ID NUMBER(7) NOT NULL,
BuyerName VARCHAR(50),
BuyerPhone NUMBER(15) NOT NULL,
Price NUMBER(15) NOT NULL,
PRIMARY KEY (Buyer_ID)
);

CREATE TABLE Weather (
WCondition VARCHAR(10),
Humidity NUMBER(7,2) NOT NULL,
Temperature NUMBER(7,2) NOT NULL,
Rainfall NUMBER(7,2) NOT NULL,
PRIMARY KEY (Temperature)
);

CREATE TABLE Owner (
Owner_ID NUMBER(7) not null,
OwnerName VARCHAR(50) unique,
OwnerAddress VARCHAR(50),
OwnerPhone NUMBER(15) NOT NULL,
PRIMARY KEY (Owner_ID)
);

CREATE TABLE Fertilizer (
FertilizerName VARCHAR(50),
FertilizerID NUMBER(7) NOT NULL,
PRIMARY KEY (FertilizerName)
);

CREATE TABLE Production (
IN_Stock NUMBER(5) UNIQUE,
Owner_ID NUMBER(7) NOT NULL,
BUYER_ID NUMBER(7) NOT NULL,
Produced NUMBER(15) UNIQUE,
Seed_ID NUMBER(7) NOT NULL,
FertilizerName VARCHAR(50),
Temperature Number(7,2),
PRIMARY KEY (IN_Stock, Produced),
FOREIGN KEY (Buyer_ID) REFERENCES Buyer(Buyer_ID) ON DELETE CASCADE,
FOREIGN KEY (Owner_ID) REFERENCES Owner(Owner_ID) ON DELETE CASCADE,
FOREIGN KEY (Seed_ID) REFERENCES Seed(Seed_ID) ON DELETE CASCADE,
FOREIGN KEY (FertilizerName) REFERENCES Fertilizer(FertilizerName) ON DELETE CASCADE,
FOREIGN KEY (Temperature) REFERENCES Weather(Temperature) ON DELETE CASCADE
);

CREATE TABLE Crop (
Crop_ID NUMBER(7) NOT NULL,
CropCategory VARCHAR(50),
Produced NUMBER(15) unique,
FOREIGN KEY (Produced) REFERENCES Production(Produced) ON DELETE CASCADE
);

CREATE TABLE MarketInfo (
In_Stock NUMBER(5) UNIQUE,
Price NUMBER(15) NOT NULL,
Buyer_ID NUMBER(7) NOT NULL,
MarketAddress VARCHAR(50),
PRIMARY KEY (Price),
FOREIGN KEY (IN_Stock) REFERENCES Production(IN_Stock) ON DELETE CASCADE,
FOREIGN KEY (Buyer_ID) REFERENCES Buyer(Buyer_ID) ON DELETE CASCADE
);

PROMPT Inserting Data on tables.
PAUSE Press ENTER to continue...

-- Deleting exiting data from tables
DELETE FROM Seed;
DELETE FROM Buyer;
DELETE FROM Weather;
DELETE FROM Owner;
DELETE FROM Fertilizer;
DELETE FROM Production;
DELETE FROM Crop;
DELETE FROM MarketInfo;

-- Inserting data into Seed
insert into Seed (Seed_ID,SeedName) 
values (20001, 'Wheat');
insert into Seed (Seed_ID,SeedName) 
values (20002, 'Lentils');
insert into Seed (Seed_ID,SeedName) 
values (20003, 'Oil seeds');
insert into Seed (Seed_ID,SeedName) 
values (20004, 'Pulses');
insert into Seed (Seed_ID,SeedName) 
values (20005, 'Maize');
insert into Seed (Seed_ID,SeedName) 
values (20006, 'Rice');
insert into Seed (Seed_ID,SeedName) 
values (20007, 'Mango');
insert into Seed (Seed_ID,SeedName) 
values (20008, 'Jack Fruit');
insert into Seed (Seed_ID,SeedName) 
values (20009, 'Soy Beans');
insert into Seed (Seed_ID,SeedName) 
values (20010, 'Jute');


commit;

-- Inserting data into Buyer
Insert Into Buyer ( Buyer_ID, BuyerName, BuyerPhone, Price) 
Values ( 10001,'Farhan',1615394100,4371 );
Insert Into Buyer ( Buyer_ID, BuyerName, BuyerPhone, Price) 
Values ( 10002,'Jasem',1615394103,3275 );
Insert Into Buyer ( Buyer_ID, BuyerName, BuyerPhone, Price) 
Values ( 10003,'Karim',1615394105,4349 );
Insert Into Buyer ( Buyer_ID, BuyerName, BuyerPhone, Price) 
Values ( 10004,'Rohim',1615394106,4648 );
Insert Into Buyer ( Buyer_ID, BuyerName, BuyerPhone, Price) 
Values ( 10005,'Rifat',1615394104,4253 );
Insert Into Buyer ( Buyer_ID, BuyerName, BuyerPhone, Price) 
Values ( 10006,'Jalil',1615394099,3669 );
Insert Into Buyer ( Buyer_ID, BuyerName, BuyerPhone, Price) 
Values ( 10007,'Ahsan',1615394101,4256 );
Insert Into Buyer ( Buyer_ID, BuyerName, BuyerPhone, Price) 
Values ( 10008,'Ananto',1615394107,3205 );
Insert Into Buyer ( Buyer_ID, BuyerName, BuyerPhone, Price) 
Values ( 10009,'Hasan',1615394108,4807 );
Insert Into Buyer ( Buyer_ID, BuyerName, BuyerPhone, Price) 
Values ( 10010,'Hossian',1615394103,3816 );


commit;

-- Insert data into Weather
Insert Into Weather ( WCondition, Humidity, Temperature, Rainfall) 
Values ( 'Good',71,23.9,139 );
Insert Into Weather ( WCondition, Humidity, Temperature, Rainfall) 
Values ( 'Good',57,30,184 );
Insert Into Weather ( WCondition, Humidity, Temperature, Rainfall) 
Values ( 'Good',65,26.2,125 );
Insert Into Weather ( WCondition, Humidity, Temperature, Rainfall) 
Values ( 'Good',69,29.4,168 );
Insert Into Weather ( WCondition, Humidity, Temperature, Rainfall) 
Values ( 'Good',68,30.9,157 );
Insert Into Weather ( WCondition, Humidity, Temperature, Rainfall) 
Values ( 'Good',72,21.9,200 );
Insert Into Weather ( WCondition, Humidity, Temperature, Rainfall) 
Values ( 'Good',52,21.8,178 );
Insert Into Weather ( WCondition, Humidity, Temperature, Rainfall) 
Values ( 'Good',65,29.2,127 );
Insert Into Weather ( WCondition, Humidity, Temperature, Rainfall) 
Values ( 'Good',86,30.1,186 );
Insert Into Weather ( WCondition, Humidity, Temperature, Rainfall) 
Values ( 'Good',78,28.3,150 );


commit;

-- Insert data into Owner
insert into Owner (Owner_ID,OwnerName,OwnerAddress,OwnerPhone) 
values (1000, 'Raihan', 'Dhaka', 01670000321);

commit;

-- Insert data into Fertilizer
insert into Fertilizer (FertilizerName,FertilizerID) 
values('AGRO RESOURCE CO', 1110);
insert into Fertilizer (FertilizerName,FertilizerID) 
values('Faruq Fertilizers Ltd.', 1120);
insert into Fertilizer (FertilizerName,FertilizerID) 
values('Nippon Trading Corporation Ltd', 1130);
insert into Fertilizer (FertilizerName,FertilizerID) 
values('CARBON HOLDINGS', 1140);
insert into Fertilizer (FertilizerName,FertilizerID) 
values('Agro Technology', 1150);
insert into Fertilizer (FertilizerName,FertilizerID) 
values('Bismillah Corporation Ltd.', 1160);
insert into Fertilizer (FertilizerName,FertilizerID) 
values('Jethro Conglomerates', 1170);
insert into Fertilizer (FertilizerName,FertilizerID) 
values('PIU IMPORT-EXPORT LTD.', 1180);
insert into Fertilizer (FertilizerName,FertilizerID) 
values('BRIGHT BANGLA INTERNATIONAL', 1190);
insert into Fertilizer (FertilizerName,FertilizerID) 
values('Advance Agrotech', 1200);



commit;

-- Insert data into Production
insert into Production (IN_Stock,Owner_ID,Buyer_ID,Produced,Seed_ID,FertilizerName,Temperature)
values (18,1000,10001,424,20001,'AGRO RESOURCE CO',23.9);
insert into Production (IN_Stock,Owner_ID,Buyer_ID,Produced,Seed_ID,FertilizerName,Temperature)
values (14,1000,10002,356,20002,'Faruq Fertilizers Ltd.',30);
insert into Production (IN_Stock,Owner_ID,Buyer_ID,Produced,Seed_ID,FertilizerName,Temperature)
values (11,1000,10003,364,20003,'Nippon Trading Corporation Ltd',26.2);
insert into Production (IN_Stock,Owner_ID,Buyer_ID,Produced,Seed_ID,FertilizerName,Temperature)
values (15,1000,10004,425,20004, 'CARBON HOLDINGS', 29.4);
insert into Production (IN_Stock,Owner_ID,Buyer_ID,Produced,Seed_ID,FertilizerName,Temperature)
values (17,1000,10005,402,20005, 'Agro Technology', 30.9);
insert into Production (IN_Stock,Owner_ID,Buyer_ID,Produced,Seed_ID,FertilizerName,Temperature)
values (13,1000,10006,377,20006, 'Bismillah Corporation Ltd.', 21.9);
insert into Production (IN_Stock,Owner_ID,Buyer_ID,Produced,Seed_ID,FertilizerName,Temperature)
values (19,1000,10007,372,20007, 'Jethro Conglomerates', 21.8);
insert into Production (IN_Stock,Owner_ID,Buyer_ID,Produced,Seed_ID,FertilizerName,Temperature)
values (20,1000,10008,365,20008, 'PIU IMPORT-EXPORT LTD.', 29.2);
insert into Production (IN_Stock,Owner_ID,Buyer_ID,Produced,Seed_ID,FertilizerName,Temperature)
values (16,1000,10009,451,20009, 'BRIGHT BANGLA INTERNATIONAL', 30.1);
insert into Production (IN_Stock,Owner_ID,Buyer_ID,Produced,Seed_ID,FertilizerName,Temperature)
values (10,1000,10010,445,20010, 'Advance Agrotech', 28.3);

commit;

-- Insert data into Crop
insert into Crop (Crop_ID,CropCategory,Produced) 
values (30001, 'Cereal Grain', 424);
insert into Crop (Crop_ID,CropCategory,Produced) 
values (30002, 'Legume', 356);
insert into Crop (Crop_ID,CropCategory,Produced) 
values (30003, 'Pericap', 364);
insert into Crop (Crop_ID,CropCategory,Produced) 
values (30004, 'Legume', 425);
insert into Crop (Crop_ID,CropCategory,Produced) 
values (30005, 'Poaceae', 402);
insert into Crop (Crop_ID,CropCategory,Produced) 
values (30006, 'Cereal Grain', 377);
insert into Crop (Crop_ID,CropCategory,Produced) 
values (30007, 'Fruit', 372);
insert into Crop (Crop_ID,CropCategory,Produced) 
values (30008, 'Fruit', 365);
insert into Crop (Crop_ID,CropCategory,Produced) 
values (30009, 'Legume', 451);
insert into Crop (Crop_ID,CropCategory,Produced) 
values (30010, 'Boro', 445);



commit;

-- Insert data into MarketInfo
Insert Into MarketInfo (  IN_Stock, Price, Buyer_ID, MarketAddress) 
Values (18,4371,10001,'Dhaka' );
Insert Into MarketInfo ( IN_Stock, Price, Buyer_ID, MarketAddress) 
Values (14,3275,10002,'Kishoregonj' );
Insert Into MarketInfo ( IN_Stock, Price, Buyer_ID, MarketAddress) 
Values (11,4349,10003,'Mymensingh' );
Insert Into MarketInfo ( IN_Stock, Price, Buyer_ID, MarketAddress) 
Values (15,4648,10004,'Tangail' );
Insert Into MarketInfo ( IN_Stock, Price, Buyer_ID, MarketAddress) 
Values (17,4253,10005,'Faridpur' );
Insert Into MarketInfo ( IN_Stock, Price, Buyer_ID, MarketAddress) 
Values (13,3669,10006,'Noakhali' );
Insert Into MarketInfo ( IN_Stock, Price, Buyer_ID, MarketAddress) 
Values (19,4256,10007,'Comilla' );
Insert Into MarketInfo ( IN_Stock, Price, Buyer_ID, MarketAddress) 
Values (20,3205,10008,'Bogra' );
Insert Into MarketInfo ( IN_Stock, Price, Buyer_ID, MarketAddress) 
Values (16,4807,10009,'Pabna' );
Insert Into MarketInfo ( IN_Stock, Price, Buyer_ID, MarketAddress) 
Values (10,3816,10010,'Jessore' );

commit;

PROMPT Viewing All the Tables.
PAUSE Press ENTER to continue...

set underline '-'

describe Seed;
describe MarketInfo;
describe Buyer;
describe Weather;
describe Owner;
describe Crop;
describe Fertilizer;
describe Production;

PROMPT
PROMPT viewing the data in the tables
PROMPT

select * from Seed;
select * from MarketInfo;
select * from Buyer;
select * from Weather;
select * from Owner;
select * from Crop;
select * from Fertilizer;
select * from Production;


PROMPT Queries done on tables.
PAUSE Press ENTER to continue...

PROMPT add columns
alter table Buyer add BuyerAddress varchar(50);

PROMPT alter column
alter table Buyer modify price number(20);

PROMPT rename column
alter table Buyer rename column buyeraddress to Buyer_Address;

PROMPT drop column
alter table Buyer drop column Buyer_Address;

PROMPT viewing specific columns with select
select in_stock, price, MarketAddress from MarketInfo;

select IN_Stock, Produced, Seed_ID, FertilizerName, Temperature 
	from Production;

PROMPT Using distinct to eliminate repetation
select DISTINCT(Owner_ID) from Production;

PROMPT calculate averge price between buyers with id 
PROMPT between 10001 and 10008
select BuyerName, BuyerPhone, (Price/10) from Buyer 
	where Buyer_ID between 10001 and 10008;

PROMPT giving avg price as a column name
select BuyerName, BuyerPhone, (Price/10) as AvgPrice from Buyer 
	where Buyer_ID between 10001 and 10008;

PROMPT See all info in production using where 
select * from Production where FertilizerName='Advance Agrotech';

PROMPT comparison search
select Buyer_ID, BuyerName from Buyer where price>3900;

PROMPT compound comparison search with or
select Buyer_ID, BuyerName from Buyer where Price=4349 or Price=4648;

PROMPT Using and
select IN_STOCK, Buyer_ID, Produced, FertilizerName from Production 
	where Seed_ID=20004 and Temperature=29.4;

PROMPT order by
select * from Production order by Temperature;

PROMPT avg temp and production
select avg(Temperature) from Weather;
select avg(Produced) from Production;

PROMPT using between to see production info where temp is between 29-30
select * from Production where Temperature between 29 and 30;

PROMPT checking weather condition
select * from Weather where WCondition in('Good') order by Humidity;

PROMPT seed name with Patern Matching
select * from Seed where SeedName like '%Ri%';
PROMPT fertilizer name 
select * from Fertilizer where FertilizerName like '%Ltd%';

PROMPT Nested query to get buyer id and price from a certain buyer
select Buyer_ID, Price from MarketInfo 
	where Price in (select Price from Buyer where BuyerName='Farhan');

PROMPT buyers details who spends more than 4000
select B.BuyerName, B.BuyerPhone from Buyer B
	where B.Price in (select M.Price from MarketInfo M
		where M.Price>3999);

PROMPT Buyer spending correlation with temperature
select Buyer_ID, Price from Buyer where Price>3999 
	UNION ALL select B.Buyer_ID,B.Price from Buyer B 
		where Buyer_ID in (select Buyer_ID from Production where Temperature>27);

PROMPT inner join to get crop category produced
select Production.Produced, Crop.CropCategory from Production 
	inner join Crop on Crop.Produced=Production.Produced;

PROMPT left join two tables to see production of crops order by temp
select Production.Temperature, Production.Produced,Crop.CropCategory 
	from Production inner join Crop on Crop.Produced=Production.Produced 
		order by Production.Temperature;

select Production.Seed_ID, Production.Produced,Crop.CropCategory 
	from Production inner join Crop on Crop.Produced=Production.Produced 
		order by Production.Seed_ID;

PROMPT natural join to join seed and production table
select Seed_ID, SeedName, Produced, Temperature from Seed natural join Production;

PROMPT joining with clause
select Owner_ID, OwnerName, OwnerAddress, Produced, Temperature 
	from Owner join Production using(Owner_ID);

PROMPT right outer join to merge seed and production 
select P.IN_Stock, P.Produced, P.Seed_ID, S.SeedName 
	from Production P right outer join Seed S 
		ON P.Seed_ID=S.Seed_ID;

PROMPT left outer join
select P.IN_Stock, P.Produced, P.Seed_ID, S.SeedName 
	from Production P left outer join Seed S 
		ON P.Seed_ID=S.Seed_ID;

PROMPT full outer join to merge Market and Production
select M.Buyer_ID, M.MarketAddress, P.Produced, P.Temperature from 
	MarketInfo M FULL OUTER JOIN Production P ON M.Buyer_ID=P.Buyer_ID;

PROMPT count crop category
select count(CropCategory) from Crop;

PROMPT highest produced crop
select max(Produced) as MaxProduction from Production;

PROMPT lowest humidity in wcondition
select min(humidity) as Lowest_Humidity from Weather;

PROMPT total stocks across all markets
select sum(IN_Stock) as Stock_Across_Markets from MarketInfo;

PROMPT group by
select count(FertilizerName), FertilizerID from Fertilizer 
	group by FertilizerID;

PROMPT order by production descending order
select IN_Stock, Temperature, Buyer_ID, Produced from Production 
	order by Produced desc;

