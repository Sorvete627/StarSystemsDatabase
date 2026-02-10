/*
File: bodyring.sql
Objetc dbo.BodyRing
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.BodyRing(
	IdBody INT,
	IdRing TINYINT,
--Only the pair of body and ring should be unique
CONSTRAINT PK_BodyRing_IdBody_IdRing
	PRIMARY KEY (IdBody, IdRing),
CONSTRAINT FK_BodyRing_IdBody
	FOREIGN KEY (IdBody) REFERENCES Body(IdBody) ON DELETE CASCADE,
CONSTRAINT FK_BodyRing_IdRing
	FOREIGN KEY (IdRing) REFERENCES Ring(IdRing) ON DELETE CASCADE);
GO
