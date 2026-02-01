/*
File: 02_create_table.sql
Project: Star Systems Database
Description: Database's tables creation
Author: Pedro Henkels
Date: 2026/01/08
*/
CREATE TABLE dbo.StarType(
	IdStarType TINYINT IDENTITY (1,1)
		CONSTRAINT PK_StarType PRIMARY KEY,
	StarTypeName VARCHAR(50) NOT NULL
		CONSTRAINT UQ_StarType_StarTypeName UNIQUE);
GO
		
CREATE TABLE dbo.StarSystem(
	IdStarSystem SMALLINT IDENTITY (1,1)
		CONSTRAINT PK_System PRIMARY KEY,
	StarSystemName VARCHAR(100) NOT NULL
--Star systems with the same name do not exist
		CONSTRAINT UQ_StarSystem_StarSystemName UNIQUE);
GO

CREATE TABLE dbo.Star(
	IdStar SMALLINT IDENTITY (1,1)
		CONSTRAINT PK_Star PRIMARY KEY,
	StarName VARCHAR(100) NOT NULL
		CONSTRAINT UQ_Star_StarName UNIQUE,
	IdStarType TINYINT NOT NULL,
	IdSystem SMALLINT NOT NULL,
	IsPrimary BIT NOT NULL
CONSTRAINT FK_Star_IdStarType
--If a star type no longer exists every star with that type also shouldn't
	FOREIGN KEY (IdStarType) REFERENCES dbo.StarType(IdStarType) ON DELETE CASCADE,
CONSTRAINT FK_Star_IdSystem
--If a star system no longer exists all stars on it also shouldn't
	FOREIGN KEY (IdSystem) REFERENCES dbo.StarSystem(IdStarSystem) ON DELETE CASCADE);
GO
	
CREATE TABLE dbo.BodyType(
	IdBodyType TINYINT IDENTITY (1,1)
		CONSTRAINT PK_BodyType PRIMARY KEY,
	BodyTypeName VARCHAR(30) NOT NULL
	CONSTRAINT UQ_BodyType_BodyTypeName UNIQUE);
GO
	
CREATE TABLE dbo.Ring(
	IdRing TINYINT IDENTITY (1,1)
		CONSTRAINT PK_Ring PRIMARY KEY,
	RingType VARCHAR(50) NOT NULL 
		CONSTRAINT UQ_Ring_RingType UNIQUE);
GO

CREATE TABLE dbo.BodySubType(
	IdBodySubType TINYINT IDENTITY (1,1)
		CONSTRAINT PK_BodySubType PRIMARY KEY,
	BodySubTypeName VARCHAR (30) NOT NULL
		CONSTRAINT UQ_BodySubType_BodySubTypeName UNIQUE);
GO

CREATE TABLE dbo.Body(
	IdBody INT IDENTITY (1,1)
		CONSTRAINT PK_Body PRIMARY KEY,
	BodyName VARCHAR(100) NOT NULL
		CONSTRAINT UQ_Body_BodyName UNIQUE,
	IdBodyType TINYINT NOT NULL,
	IdBodySubType TINYINT NOT NULL,
--Defines if a body is landable or not
	Landable BIT NOT NULL,
--Gravity is compared to the earth's one, for example, "this body has 3,20 more gravity than earth"
	Gravity DECIMAL(5,2) NOT NULL,
--BIT to indicate if this body has geologial and/or biological activity
	Geo BIT,
	Bio BIT,
CONSTRAINT FK_Planet_IdBodyType
--If a body type no longer exists all bodies with that body type also shouldn't
	FOREIGN KEY (IdBodyType) REFERENCES BodyType(IdBodyType) ON DELETE CASCADE,
CONSTRAINT FK_PlanetIdBodySubType
--If a body subtype no longer exists all bodies with that body subtype also shouldn't
	FOREIGN KEY (IdBodySubType) REFERENCES BodySubType (IdBodySubType) ON DELETE CASCADE);
GO
	
CREATE TABLE dbo.BodyRing(
	IdBody INT,
	IdRing TINYINT,
--Only the pair of body and ring should be unique
CONSTRAINT PK_BodyRing_IdBody_IdRing
	PRIMARY KEY (IdBody, IdRing),
CONSTRAINT FK_BodyRing_IdBody
	FOREIGN KEY (IdBody) REFERENCES Body(IdBody) ON DELETE CASCADE,
CONSTRAINT FK_BodyRing_IdRing
	FOREIGN KEY (IdRing) REFERENCES Ring(IdRing) ON DELETE CASCADE);
GO

CREATE TABLE dbo.BodyStar(
	IdBody INT,
	IdStar SMALLINT,
CONSTRAINT PK_BodyStar_IdBody_IdStar
--Only the pair of body and star should be unique
	PRIMARY KEY (IdBody, IdStar),
CONSTRAINT FK_BodyStar_IdBody
	FOREIGN KEY (IdBody) REFERENCES Body(IdBody) ON DELETE CASCADE,
CONSTRAINT FK_BodyStar_IdStar
	FOREIGN KEY (IdStar) REFERENCES Star(IdStar) ON DELETE CASCADE);

CREATE TABLE dbo.Atmosphere(
	IdAtmosphere TINYINT IDENTITY (1,1)
		CONSTRAINT PK_Atmosphere PRIMARY KEY,
	AtmosphereName VARCHAR(30) NOT NULL 
		CONSTRAINT UQ_Atmosphere_AtmosphereName UNIQUE);
GO

CREATE TABLE dbo.BodyAtmosphere(
	IdBody INT,
	IdAtmosphere TINYINT,
	Ratio DECIMAL (5,2) NOT NULL,
CONSTRAINT PK_BodyAtmosphere_IdBod_IdAtmosphere
--Only the pair of body and atmosphere should be unique
	PRIMARY KEY (IdBody, IdAtmosphere),
CONSTRAINT FK_BodyAtmosphere_IdBody
	FOREIGN KEY (IdBody) REFERENCES Body(IdBody) ON DELETE CASCADE,
CONSTRAINT FK_BodyAtmosphere_IdAtmosphere
	FOREIGN KEY (IdAtmosphere) REFERENCES Atmosphere(IdAtmosphere) ON DELETE CASCADE);
GO
