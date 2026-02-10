/*
File: bodybrowndwarf.sql
Objetc dbo.BodyBrownDwarf
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.BodyBrownDwarf(
	IdBody INT,
	IdBrownDwarf SMALLINT,
CONSTRAINT PK_BodyBrownDwarf_IdBody_IdBrownDwarf
	PRIMARY KEY (IdBody, IdBrownDwarf),
CONSTRAINT FK_BodyBrownDwarf_IdBody
--ON DELETE CASCADE would cause a multiple path delete error
	FOREIGN KEY (IdBody) REFERENCES Body(IdBody) ON DELETE NO ACTION,
CONSTRAINT FK_BodyBrownDwarf_IdBrownDwarf
	FOREIGN KEY (IdBrownDwarf) REFERENCES BrownDwarf(IdBrownDwarf) ON DELETE CASCADE);
GO
