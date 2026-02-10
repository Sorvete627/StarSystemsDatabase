/*
File: star.sql
Objetct: dbo.Star
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.Star(
	IdStar SMALLINT IDENTITY (1,1)
		CONSTRAINT PK_Star PRIMARY KEY,
	StarName VARCHAR(100) NOT NULL
		CONSTRAINT UQ_Star_StarName UNIQUE,
	IdStarType TINYINT NOT NULL,
	IdSystem SMALLINT NOT NULL,
CONSTRAINT FK_Star_IdStarType
--If a star type no longer exists every star with that type also shouldn't
	FOREIGN KEY (IdStarType) REFERENCES StarType(IdStarType) ON DELETE CASCADE,
CONSTRAINT FK_Star_IdSystem
--If a star system no longer exists all stars on it also shouldn't
	FOREIGN KEY (IdSystem) REFERENCES StarSystem(IdStarSystem) ON DELETE CASCADE);
GO
