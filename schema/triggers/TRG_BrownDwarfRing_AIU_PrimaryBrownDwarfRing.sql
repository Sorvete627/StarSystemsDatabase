/*
File: TRG_BrownDwarfRing_AIU_PrimaryBrownDwarfRing.sql
Object: TRG_BrownDwarfRing_AIU_PrimaryBrownDwarfRing
Author: Pedro Henkels
Date: 2026/02/09

Description:
Ensures that only non-primary brown dwarf can have rings.
*/

CREATE TRIGGER TRG_BrownDwarfRing_AfterInsertUpdate_PrimaryBrownDwarfRing
ON dbo.BrownDwarfRing
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT 1 FROM Inserted i
		JOIN BrownDwarf bd
			ON i.IdBrownDwarf = bd.IdBrownDwarf
		WHERE bd.IsPrimary = 1)
	BEGIN;
		THROW 50005,
			'Only non-primary brown dwarfs can have rings.',
			1;
	END;
END;
GO
