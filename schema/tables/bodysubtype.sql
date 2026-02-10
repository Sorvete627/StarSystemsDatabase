/*
File: bodysubtype.sql
Objetct: dbo.BodySubType
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.BodySubType(
	IdBodySubType TINYINT IDENTITY (1,1)
		CONSTRAINT PK_BodySubType PRIMARY KEY,
	BodySubTypeName VARCHAR (30) NOT NULL
		CONSTRAINT UQ_BodySubType_BodySubTypeName UNIQUE);
GO
