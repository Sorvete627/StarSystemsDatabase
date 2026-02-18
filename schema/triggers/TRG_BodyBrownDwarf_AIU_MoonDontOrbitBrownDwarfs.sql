/*
File: TRG_BodyBrownDwarf_AIU_MoonDontOrbitPrimaryBrownDwarfs.sql
Object: TRG_BodyBrownDwarf_AIU_MoonDontOrbitPrimaryBrownDwarfs
Author: Pedro Henkels
Date: 2026/02/09

Description:
Ensures that a moon cannot orbit brown dwarfs.
*/

CREATE TRIGGER TRG_BodyBrownDwarf_AfterInsertUpdate_MoonDontOrbitBrownDwarfs
ON dbo.BodyBrownDwarf
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT 1 FROM Inserted i
		JOIN Body b
			ON i.IdBody = b.IdBody
		JOIN BodyType bt
			ON b.IdBodyType = bt.IdBodyType
		WHERE bt.IdBodyType = 2)
	BEGIN;
		THROW 50007,
		 'A moon can not orbit a brown dwarf, only planets.',
		 1;
	END;
END;
GO
