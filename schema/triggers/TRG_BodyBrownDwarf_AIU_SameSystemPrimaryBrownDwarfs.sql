/*
File: TRG_BodyBrownDwarf_AIU_SameSystemPrimaryBrownDwarfs.sql
Object: TRG_BodyBrownDwarf_AIU_SameSystemPrimaryBrownDwarfs
Author: Pedro Henkels
Date: 2026/02/09

Description:
Ensures that a planet will only orbit primary brown dwarfs that are in the same star system.
Planets cannot orbit non-primary brown dwarfs.
*/

CREATE TRIGGER TRG_BodyBrownDwarf_AfterInsertUpdate_SameSystemPrimaryBrownDwarfs
ON dbo.BodyBrownDwarf
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT 1 FROM BodyBrownDwarf bb
		JOIN Inserted i
			ON bb.IdBody = i.IdBody
		JOIN BrownDwarf bd
			ON i.IdBrownDwarf = bd.IdBrownDwarf
		GROUP BY bb.IdBody 
		HAVING COUNT(DISTINCT bd.IdStarSystem) > 1)
	BEGIN;
		THROW 50004,
			'A planet can only orbit two or more brown dwarfs if all are from the same star system.',
			1;
	END;
	IF EXISTS(SELECT 1 FROM Inserted i
		JOIN BrownDwarf bd
			ON i.IdBrownDwarf = bd.IdBrownDwarf
		WHERE bd.IsPrimary = 0)
	BEGIN;
		THROW 50004,
			'A planet can only orbit brown dwarfs considered as primary.',
			1;
	END;
END;
GO
