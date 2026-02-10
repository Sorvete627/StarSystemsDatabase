/*
File: atmosphere.sql
Objetct: dbo.Atmosphere
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.Atmosphere(
	IdAtmosphere TINYINT IDENTITY (1,1)
		CONSTRAINT PK_Atmosphere PRIMARY KEY,
	AtmosphereName VARCHAR(30) NOT NULL 
		CONSTRAINT UQ_Atmosphere_AtmosphereName UNIQUE);
GO
