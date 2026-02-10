/*
File: starsystem.sql
Objetct: dbo.StarSystem
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.StarSystem(
	IdStarSystem SMALLINT IDENTITY (1,1)
		CONSTRAINT PK_System PRIMARY KEY,
	StarSystemName VARCHAR(100) NOT NULL
--Star systems with the same name do not exist
		CONSTRAINT UQ_StarSystem_StarSystemName UNIQUE);
GO
