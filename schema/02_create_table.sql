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
		CONSTRAINT UQ_StarType_StarTypeName UNIQUE
	);
GO
		
CREATE TABLE dbo.StarSystem(
	IdStarSystem SMALLINT IDENTITY (1,1)
		CONSTRAINT PK_System PRIMARY KEY,
	StarSystemName VARCHAR(100) NOT NULL
--Star systems with the same name do not exist
		CONSTRAINT UQ_StarSystem_StarSystemName UNIQUE
	);
GO

CREATE TABLE dbo.Star(
	IdStar SMALLINT IDENTITY (1,1)
		CONSTRAINT PK_Star PRIMARY KEY,
	IdStarType TINYINT NOT NULL,
	IdSystem SMALLINT NOT NULL,
CONSTRAINT FK_Star_IdStarType
--If a star type no longer exists every star with that type also shouldn't
	FOREIGN KEY (IdStarType) REFERENCES dbo.StarType(IdStarType) ON DELETE CASCADE,
CONSTRAINT FK_Star_IdSystem
--If a star system no longer exists all stars on it also shouldn't
	FOREIGN KEY (IdSystem) REFERENCES dbo.StarSystem(IdStarSystem) ON DELETE CASCADE
	);
GO
	
CREATE TABLE dbo.BrownDwarf(
	IdBrownDwarf SMALLINT IDENTITY (1,1)
		CONSTRAINT PK_BrownDwarf PRIMARY KEY,
	IdSystem SMALLINT NOT NULL,
	IsPrimary BIT NOT NULL,
CONSTRAINT FK_BrownDwarf_IdSystem
--Same logic than constraint FK_Star_IdSystem
	FOREIGN KEY (IdSystem) REFERENCES dbo.StarSystem(IdStarSystem) ON DELETE CASCADE
	);
GO

CREATE TABLE dbo.BrownDwarfStar(
	IdBrownDwarf SMALLINT,
	IdStar SMALLINT,
--Composite Primary Key because only the pair of brown dwarf and star should be unique
CONSTRAINT PK_BrownDwarfStar_IdBrownDwarf_IdStar
	PRIMARY KEY (IdBrownDwarf, IdStar),
CONSTRAINT FK_BrowDwarfStar 
	FOREIGN KEY (IdBrownDwarf) REFERENCES dbo.BrownDwarf(IdBrownDwarf) ON DELETE CASCADE,
CONSTRAINT FK_BrownDwarfStar
--ON DELETE NO ACTION because ON DELETE CASCADE would cause a delete path multiple error, BrownDwarf and Star table have the same father table, StarSystem table
	FOREIGN KEY (IdStar) REFERENCES dbo.Star(IdStar) ON DELETE NO ACTION
	);
GO
	
CREATE TABLE dbo.BodyType(
	IdBodyType TINYINT IDENTITY (1,1)
		CONSTRAINT PK_BodyType PRIMARY KEY,
	BodyTypeName VARCHAR(50) NOT NULL
	CONSTRAINT UQ_BodyType_BodyTypeName UNIQUE
	);
GO

CREATE TABLE dbo.Ring(
	IdRing TINYINT IDENTITY (1,1)
		CONSTRAINT PK_Ring PRIMARY KEY,
	RingType VARCHAR(50) NOT NULL 
		CONSTRAINT UQ_Ring_RingType UNIQUE
	);
GO

CREATE TABLE dbo.BrownDwarfRing(
	IdBrownDwarf SMALLINT,
	IdRing TINYINT,
--Composite Primary Key because only the pair of brown dwarf and ring should be unique
CONSTRAINT PK_BrownDwarfRing_IdBrownDwarf_IdRing
	PRIMARY KEY (IdBrownDwarf, IdRing),
CONSTRAINT FK_BrownDwarfRing_IdBrownDwarf
	FOREIGN KEY (IdBrownDwarf) REFERENCES BrownDwarf(IdBrownDwarf) ON DELETE CASCADE,
CONSTRAINT FK_BrownDwarfRing_IdRing
	FOREIGN KEY (IdRing) REFERENCES Ring(IdRing) ON DELETE CASCADE
	);
GO
	
CREATE TABLE dbo.Planet(
	IdPlanet INT IDENTITY (1,1)
		CONSTRAINT PK_Planet PRIMARY KEY,
	PlanetName VARCHAR(100) NOT NULL 
		CONSTRAINT UQ_Planet_PlanetName UNIQUE,
	IdBodyType TINYINT NOT NULL,
--Defines if a planet is landable or not
	Landable BIT NOT NULL,
--Gravity is compared to the earth's one, for example, "this planet has 3,20 more gravity than earth"
	Gravity DECIMAL(5,2) NOT NULL,
--BIT to indicate if this planet has geologial and/or biological activity
	Geo BIT,
	Bio BIT,
CONSTRAINT FK_Planet_IdBodyType
--If a body type no longer exists all planets with that body type also shouldn't
	FOREIGN KEY (IdBodyType) REFERENCES BodyType(IdBodyType) ON DELETE CASCADE
	);
GO
	
CREATE TABLE dbo.Moon(
	IdMoon INT IDENTITY (1,1)
		CONSTRAINT PK_Moon PRIMARY KEY,
	MoonName VARCHAR(100) NOT NULL 
		CONSTRAINT UQ_Moon_MoonName UNIQUE,
	IdBodyType TINYINT NOT NULL,
--Defines if a moon is landable or not
	Landable BIT NOT NULL,
--Gravity is compared to the earth's one, for example, "this planet has 3,20 more gravity than earth"
	Gravity DECIMAL(5,2) NOT NULL,
--BIT to indicate if this moon has geologial and/or biological activity
	Geo BIT NOT NULL,
	Bio BIT NOT NULL,
	IdPlanet INT,
	IdBrownDwarf SMALLINT,
CONSTRAINT FK_Moon_IdBodyType
--If a body type no longer exists all moons with that body type also shouldn't
	FOREIGN KEY (IdBodyType) REFERENCES BodyType(IdBodyType) ON DELETE CASCADE,
CONSTRAINT FK_Moon_IdPlanet
	FOREIGN KEY (IdPlanet) REFERENCES Planet(IdPlanet) ON DELETE CASCADE,
CONSTRAINT FK_Moon_IdBrownDwarf
	FOREIGN KEY (IdBrownDwarf) REFERENCES BrownDwarf(IdBrownDwarf) ON DELETE CASCADE,
CONSTRAINT CK_Moon_IdPlanet 
--A moon can only orbit a planet or a brown dwarf at once
	CHECK (
		(IdPlanet IS NOT NULL AND IdBrownDwarf IS NULL) OR 
		(IdPlanet IS NULL AND  IdBrownDwarf  IS NOT NULL)
		)
	);
GO

CREATE TABLE dbo.MoonRing(
	IdMoon INT,
	IdRing TINYINT,
--Only the pair of moon and ring should be unique
CONSTRAINT PK_MoonRing_IdMoon_IdRing
	PRIMARY KEY (IdMoon, IdRing),
CONSTRAINT FK_MoonRing_IdMoon
	FOREIGN KEY (IdMoon) REFERENCES Moon(IdMoon) ON DELETE CASCADE,
CONSTRAINT FK_MoonRing_IdRing
	FOREIGN KEY (IdRing) REFERENCES Ring(IdRing) ON DELETE CASCADE
	);
GO
	
CREATE TABLE dbo.PlanetRing(
	IdPlanet INT,
	IdRing TINYINT,
--Only the pair of planet and ring should be unique
CONSTRAINT PK_PlanetRing_IdPlanet_IdRing
	PRIMARY KEY (IdPlanet, IdRing),
CONSTRAINT FK_PlanetRing_IdPlanet
	FOREIGN KEY (IdPlanet) REFERENCES Planet(IdPlanet) ON DELETE CASCADE,
CONSTRAINT FK_PlanetRing_IdRing
	FOREIGN KEY (IdRing) REFERENCES Ring(IdRing) ON DELETE CASCADE
GO
	
CREATE TABLE dbo.PlanetBrownDwarf(
	IdBrownDwarf SMALLINT, 
	IdPlanet INT,
CONSTRAINT PK_PlanetBrownDwarf_IdBrownDwarf_IdPlanet
--Only the pair of planet and brown dwarf should be unique
	PRIMARY KEY (IdBrownDwarf, IdPlanet),
CONSTRAINT FK_PlanetBrownDwarf_IdBrownDwarf
	FOREIGN KEY (IdBrownDwarf) REFERENCES BrownDwarf(IdBrownDwarf) ON DELETE CASCADE,
CONSTRAINT FK_PlanetBrownDwarf
	FOREIGN KEY (IdPlanet) REFERENCES Planet(IdPlanet) ON DELETE CASCADE
	);
GO

CREATE TABLE dbo.PlanetStar(
	IdPlanet INT,
	IdStar SMALLINT,
CONSTRAINT PK_PlanetStar_IdPlanet_IdStar
--Only the pair of planet and star should be unique
	PRIMARY KEY (IdPlanet, IdStar),
CONSTRAINT FK_PlanetStar_IdPlanet
	FOREIGN KEY (IdPlanet) REFERENCES Planet(IdPlanet) ON DELETE CASCADE,
CONSTRAINT FK_PlanetStar_IdStar
	FOREIGN KEY (IdStar) REFERENCES Star(IdStar) ON DELETE CASCADE
	);
GO

CREATE TABLE dbo.Atmosphere(
	IdAtmosphere TINYINT IDENTITY (1,1)
		CONSTRAINT PK_Atmosphere PRIMARY KEY,
	AtmosphereName VARCHAR(30) NOT NULL 
		CONSTRAINT UQ_Atmosphere_AtmosphereName UNIQUE
	);
GO

CREATE TABLE dbo.PlanetAtmosphere(
	IdPlanet INT,
	IdAtmosphere TINYINT,
	Ratio DECIMAL (5,2) NOT NULL,
CONSTRAINT PK_PlanetAtmosphere_IdPlanet_IdAtmosphere
--Only the pair of planet and atmosphere should be unique
	PRIMARY KEY (IdPlanet, IdAtmosphere),
CONSTRAINT FK_PlanetAtmosphere_IdPlanet
	FOREIGN KEY (IdPlanet) REFERENCES Planet(IdPlanet) ON DELETE CASCADE,
CONSTRAINT FK_PlanetAtmosphere_IdAtmosphere
	FOREIGN KEY (IdAtmosphere) REFERENCES Atmosphere(IdAtmosphere) ON DELETE CASCADE,
	);
GO

CREATE TABLE dbo.MoonAtmosphere(
	IdMoon INT,
	IdAtmosphere TINYINT,
	Ratio DECIMAL (5,2) NOT NULL,
CONSTRAINT PK_MoonAtmosphere_IdMoon_IdAtmosphere
--Only the pair of moon and atmosphere should be unique
	PRIMARY KEY (IdMoon, IdAtmosphere),
CONSTRAINT FK_MoonAtmosphere_IdMoon
	FOREIGN KEY (IdMoon) REFERENCES Moon(IdMoon),
CONSTRAINT FK_MoonAtmosphere_IdAtmosphere
	FOREIGN KEY (IdAtmosphere) REFERENCES Atmosphere(IdAtmosphere)
	);
GO
