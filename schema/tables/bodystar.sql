/*
File: bodystar.sql
Objetc dbo.BodyStar
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.BodyStar(
	IdBody INT,
	IdStar SMALLINT,
CONSTRAINT PK_BodyStar_IdBody_IdStar
--Only the pair of body and star should be unique
	PRIMARY KEY (IdBody, IdStar),
CONSTRAINT FK_BodyStar_IdBody
	FOREIGN KEY (IdBody) REFERENCES Body(IdBody) ON DELETE NO ACTION,
CONSTRAINT FK_BodyStar_IdStar
	FOREIGN KEY (IdStar) REFERENCES Star(IdStar) ON DELETE CASCADE);
GO
