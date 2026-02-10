/*
File: browndwarfring.sql
Objetct: dbo.BrownDwarfRing
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.BrownDwarfRing(
	IdBrownDwarf SMALLINT,
	IdRing TINYINT,
CONSTRAINT PK_BrownDwarfRing_IdBrownDwarf_IdRing
	PRIMARY KEY (IdBrownDwarf, IdRing),
CONSTRAINT FK_BrownDwarfRing_IdBrownDwarf
	FOREIGN KEY (IdBrownDwarf) REFERENCES BrownDwarf(IdBrownDwarf) ON DELETE CASCADE,
CONSTRAINT FK_BrownDwarfRing_IdRing
--A entire brown dwarf shouldn't no longer exists if it's ring type is deleted.
	FOREIGN KEY (IdRing) REFERENCES Ring(IdRing) ON DELETE NO ACTION);
GO
