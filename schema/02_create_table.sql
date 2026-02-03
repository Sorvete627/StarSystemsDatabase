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
	FOREIGN KEY (IdStarType) REFERENCES StarType(IdStarType) ON DELETE CASCADE,
CONSTRAINT FK_Star_IdSystem
--If a star system no longer exists all stars on it also shouldn't
	FOREIGN KEY (IdSystem) REFERENCES StarSystem(IdStarSystem) ON DELETE CASCADE);
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
	IdStarSystem SMALLINT NOT NULL,
	IdBodySubType TINYINT NOT NULL,
--Defines if a body is landable or not
	Landable BIT NOT NULL,
--Gravity is compared to the earth's one, for example, "this body has 3,20 more gravity than earth"
	Gravity DECIMAL(5,2) NOT NULL,
--BIT to indicate if this body has geologial and/or biological activity
	Geo BIT,
	Bio BIT,
CONSTRAINT FK_Body_IdBodyType
--If a body type no longer exists all bodies with that body type also shouldn't
	FOREIGN KEY (IdBodyType) REFERENCES BodyType(IdBodyType) ON DELETE CASCADE,
CONSTRAINT FK_Body_IdBodySubType
--If a body subtype no longer exists all bodies with that body subtype also shouldn't
	FOREIGN KEY (IdBodySubType) REFERENCES BodySubType (IdBodySubType) ON DELETE CASCADE,
CONSTRAINT FK_Body_IdStarSystem
--If a star system no longer exists all bodies on it also shouldn't
	FOREIGN KEY (IdStarSystem) REFERENCES StarSystem(IdStarSystem) ON DELETE CASCADE);
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
	FOREIGN KEY (IdBody) REFERENCES Body(IdBody) ON DELETE NO ACTION,
CONSTRAINT FK_BodyStar_IdStar
	FOREIGN KEY (IdStar) REFERENCES Star(IdStar) ON DELETE CASCADE);
GO

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
CONSTRAINT PK_BodyAtmosphere_IdBody_IdAtmosphere
--Only the pair of body and atmosphere should be unique
	PRIMARY KEY (IdBody, IdAtmosphere),
CONSTRAINT FK_BodyAtmosphere_IdBody
	FOREIGN KEY (IdBody) REFERENCES Body(IdBody) ON DELETE CASCADE,
CONSTRAINT FK_BodyAtmosphere_IdAtmosphere
	FOREIGN KEY (IdAtmosphere) REFERENCES Atmosphere(IdAtmosphere) ON DELETE CASCADE);
GO

CREATE TABLE dbo.PlanetMoon(
	IdPlanet INT,
	IdMoon INT,
CONSTRAINT PK_PlanetMoon_IdPlanet_IdMoon
	PRIMARY KEY(IdPlanet, IdMoon),
CONSTRAINT FK_PlanetMoon_IdPlanet
--If a planet no longer exists it's moon also shouldn't
	FOREIGN KEY (IdPlanet) REFERENCES Body(IdBody) ON DELETE CASCADE,
CONSTRAINT FK_PlanetMoon_IdMoon
--ON DELETE CASCADE would cause a multiple path delete error
	FOREIGN KEY (IdMoon) REFERENCES Body(IdBody) ON DELETE NO ACTION);
GO

CREATE TABLE dbo.BrownDwarfType(
	IdBrownDwarfType TINYINT IDENTITY(1,1)
		CONSTRAINT PK_BrownDwarfType PRIMARY KEY,
	BrownDwarfTypeName VARCHAR(50) NOT NULL 
		CONSTRAINT UQ_BrownDwarfType_BrownDwarfTypeName UNIQUE);
GO
		
CREATE TABLE dbo.BrownDwarf(
	IdBrownDwarf SMALLINT IDENTITY(1,1)
		CONSTRAINT PK_BrownDwarf PRIMARY KEY,
	BrownDwarfName VARCHAR(100) NOT NULL
		CONSTRAINT UQ_BrownDwarf_BrownDwarfName UNIQUE,
	IdBrownDwarfType TINYINT NOT NULL,
	IdStarSystem SMALLINT NOT NULL,
--BIT to define if brown dwarf is cosidered primary(1) or not(0)
	IsPrimary BIT NOT NULL,
CONSTRAINT FK_BronwDwarf_IdBrownDwarfType
--If a brown dwarf type no longer exists all brown dwarfs of the type also shouldn't
	FOREIGN KEY (IdBrownDwarfType) REFERENCES BrownDwarfType(IdBrownDwarfType) ON DELETE CASCADE,
CONSTRAINT FK_BrownDwarf_IdStarSystem
--If a star system no longer exists all brown dwarfs on it also shouldn't
	FOREIGN KEY (IdStarSystem) REFERENCES StarSystem(IdStarSystem) ON DELETE CASCADE);
GO

CREATE TABLE dbo.BodyBrownDwarf(
	IdBody INT,
	IdBrownDwarf SMALLINT,
CONSTRAINT PK_BodyBrownDwarf_IdBody_IdBrownDwarf
	PRIMARY KEY (IdBody, IdBrownDwarf),
CONSTRAINT FK_BodyBrownDwarf_IdBody
--ON DELETE CASCADE would cause a multiple path delete error
	FOREIGN KEY (IdBody) REFERENCES Body(IdBody) ON DELETE NO ACTION,
CONSTRAINT FK_BodyBrownDwarf_IdBrownDwarf
	FOREIGN KEY (IdBrownDwarf) REFERENCES BrownDwarf(IdBrownDwarf) ON DELETE CASCADE);
GO

CREATE TABLE dbo.BrownDwarfRing(
	IdBrownDwarf SMALLINT,
	IdRing TINYINT,
CONSTRAINT PK_BrownDwarfRing_IdBrownDwarf_IdRing
	PRIMARY KEY (IdBrownDwarf, IdRing),
CONSTRAINT FK_BrownDwarfRing_IdBrownDwarf
	FOREIGN KEY (IdBrownDwarf) REFERENCES BrownDwarf(IdBrownDwarf) ON DELETE CASCADE,
CONSTRAINT FK_BrownDwarfRing_IdRing
--A entire brown dwarf shouldn't no longer exists if it's ring type is deleted
	FOREIGN KEY (IdRing) REFERENCES Ring(IdRing) ON DELETE NO ACTION);
