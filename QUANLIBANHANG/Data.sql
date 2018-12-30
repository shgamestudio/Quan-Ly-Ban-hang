﻿CREATE DATABASE QUANLIBANHANG
GO

USE QUANLIBANHANG
GO



--TABLE
CREATE TABLE ATABLE
(
	ID INT IDENTITY PRIMARY KEY,
	NAME NVARCHAR(100),
	STATUS NVARCHAR(100) 

)
GO

--FOODCATEGORY
CREATE TABLE FOODCATEGORY
(
	ID INT IDENTITY PRIMARY KEY,
	NAME NVARCHAR(100) NOT NULL,
	
 )
GO
--FOOD
CREATE TABLE FOOD
(	
	ID INT IDENTITY PRIMARY KEY,
	NAME NVARCHAR(100),
	IDCATEGORY INT FOREIGN KEY (IDCATEGORY) REFERENCES FOODCATEGORY(ID),
	PRICE int DEFAULT 0
)
GO
--ACCOUNT
CREATE TABLE ACCOUNT 
(
	USERNAME NVARCHAR(50) NOT NULL PRIMARY KEY,
	NAME NVARCHAR(100) NOT NULL DEFAULT 'VANG LAI',
	PASSWORD NVARCHAR(500) NOT NULL,
	KINDOFACC INT NOT NULL
)
GO

--BILL
CREATE TABLE BILL
(
	ID INT IDENTITY PRIMARY KEY,
	DATECHECKIN SMALLDATETIME NOT NULL DEFAULT GETDATE(),
	DATECHECKOUT SMALLDATETIME,
	IDTABLE INT NOT NULL FOREIGN KEY (IDTABLE) REFERENCES ATABLE(ID),
	ISPAID INT NOT NULL
)
go
--BILLINFO
CREATE TABLE BILLINFO
(
	ID INT IDENTITY PRIMARY KEY,
	IDBILL INT NOT NULL FOREIGN KEY(IDBILL) REFERENCES BILL(ID),
	IDFOOD INT NOT NULL FOREIGN KEY (IDFOOD) REFERENCES FOOD(ID),
	SOLUONG INT NOT NULL DEFAULT 0
)
GO
--Tạo Bàn
INSERT INTO ATABLE VALUES ('BÀN 1', 'TRONG')
INSERT INTO ATABLE VALUES ('BÀN 2', 'TRONG')
INSERT INTO ATABLE VALUES ('BÀN 3', 'TRONG')
INSERT INTO ATABLE VALUES ('BÀN 4', 'TRONG')
INSERT INTO ATABLE VALUES ('BÀN 5', 'TRONG')
INSERT INTO ATABLE VALUES ('BÀN 6', 'TRONG')
INSERT INTO ATABLE VALUES ('BÀN 7', 'TRONG')
INSERT INTO ATABLE VALUES ('BÀN 8', 'TRONG')
INSERT INTO ATABLE VALUES ('BÀN 9', 'TRONG')
INSERT INTO ATABLE VALUES ('BÀN 10', 'TRONG')
GO

--TAO CATAGORY
INSERT INTO FOODCATEGORY VALUES('Hải Sản')
INSERT INTO FOODCATEGORY VALUES('Nông Sản')
INSERT INTO FOODCATEGORY VALUES('Thức Uống')
GO
-- THEM MON AN
INSERT INTO FOOD VALUES('Mực nướng','1','200000')
INSERT INTO FOOD VALUES('Cá Ba Sa Kho','1','100000')
INSERT INTO FOOD VALUES('Khoai Lang Nướng','2','10000')
INSERT INTO FOOD VALUES('Nước Ngọt','3','7000')
GO
--Them Bill (TEMP)
INSERT INTO BILL VALUES(GETDATE(),NULL,'1','0')
INSERT INTO BILL VALUES(GETDATE(),GETDATE(),'2','1')
GO
--Them bill info
INSERT INTO BILLINFO VALUES('1','1','3')
INSERT INTO BILLINFO VALUES('1','2','4')
GO
