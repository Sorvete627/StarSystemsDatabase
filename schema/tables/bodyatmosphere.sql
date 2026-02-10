/*
File: bodyatmosphere.sql
Objetct: dbo.BodyAtmosphere
Author: Pedro Henkels
Date: 2026/01/08
*/

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
