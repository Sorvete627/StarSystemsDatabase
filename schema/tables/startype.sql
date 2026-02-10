/*
File: startype.sql
Objetc dbo.StarType
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.StarType(
	IdStarType TINYINT IDENTITY (1,1)
		CONSTRAINT PK_StarType PRIMARY KEY,
	StarTypeName VARCHAR(50) NOT NULL
		CONSTRAINT UQ_StarType_StarTypeName UNIQUE);
GO
