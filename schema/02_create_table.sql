/*
File: 02-create-table.sql
Project: Star Systems Database
Description: Database's tables creation
Author: Pedro Henkels
Date: 2026/01/08
*/
CREATE TABLE StarType(
--TINYINT because of the low possible star types
	IdStarType TINYINT CONSTRAINT PK_StarType PRIMARY KEY,
	TypeName VARCHAR(50) NOT NULL
--CONSTRAINT UNIQUE to not duplicate types
		CONSTRAINT UQ_StarType_Type UNIQUE);
