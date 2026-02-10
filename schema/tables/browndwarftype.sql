/*
File: browndwarftype.sql
Objetc dbo.BrownDwarfType
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.BrownDwarfType(
	IdBrownDwarfType TINYINT IDENTITY(1,1)
		CONSTRAINT PK_BrownDwarfType PRIMARY KEY,
	BrownDwarfTypeName VARCHAR(50) NOT NULL 
		CONSTRAINT UQ_BrownDwarfType_BrownDwarfTypeName UNIQUE);
GO
