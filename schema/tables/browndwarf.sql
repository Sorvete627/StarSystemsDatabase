/*
File: browndwarf.sql
Objetc dbo.BrownDwarf
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.BrownDwarf(
	IdBrownDwarf SMALLINT IDENTITY(1,1)
		CONSTRAINT PK_BrownDwarf PRIMARY KEY,
	BrownDwarfName VARCHAR(100) NOT NULL
		CONSTRAINT UQ_BrownDwarf_BrownDwarfName UNIQUE,
	IdBrownDwarfType TINYINT NOT NULL,
	IdStarSystem SMALLINT NOT NULL,
--BIT to define if brown dwarf is cosidered primary(1) or not(0)
	IsPrimary BIT NOT NULL,
CONSTRAINT FK_BronwDwarf_IdBrownDwarfType
--If a brown dwarf type no longer exists all brown dwarfs of the type also shouldn't
	FOREIGN KEY (IdBrownDwarfType) REFERENCES BrownDwarfType(IdBrownDwarfType) ON DELETE CASCADE,
CONSTRAINT FK_BrownDwarf_IdStarSystem
--If a star system no longer exists all brown dwarfs on it also shouldn't
	FOREIGN KEY (IdStarSystem) REFERENCES StarSystem(IdStarSystem) ON DELETE CASCADE);
GO
