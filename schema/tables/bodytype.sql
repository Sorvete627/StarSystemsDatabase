/*
File: bodytype.sql
Objetct: dbo.BodyType
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.BodyType(
	IdBodyType TINYINT IDENTITY (1,1)
		CONSTRAINT PK_BodyType PRIMARY KEY,
	BodyTypeName VARCHAR(30) NOT NULL
	CONSTRAINT UQ_BodyType_BodyTypeName UNIQUE);
GO
