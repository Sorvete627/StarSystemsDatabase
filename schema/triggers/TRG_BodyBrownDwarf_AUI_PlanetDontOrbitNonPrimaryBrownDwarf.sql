/*
File: TRG_BodyBrownDwarf_AUI_PlanetDontOrbitNonPrimaryBrownDwarf.sql
Object:TRG_BodyBrownDwarf_AUI_PlanetDontOrbitNonPrimaryBrownDwarf
Author: Pedro Henkels
Date: 2026/02/09

Description:
Ensures that a planet cannot orbit a non primary brown dwarf, only moons should be able to.
*/

CREATE TRIGGER TRG_BodyBrownDwarf_AfterInsertUpdate_PlanetDontOrbitNonPrimaryBrownDwarf
ON dbo.BodyBrownDwarf
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT 1 FROM Inserted i
		JOIN Body b
			ON i.IdBody = b.IdBody
		JOIN BrownDwarf bd
			ON i.IdBrownDwarf = bd.IdBrownDwarf
		JOIN BodyType bt
			ON b.IdBodyType = bt.IdBodyType
		WHERE bt.IdBodyType = 1 AND bd.IsPrimary = 0)
	BEGIN;
		THROW 50010,
			'A planet can only orbit primary brown dwarfs.',
			1;
	END;
END;
GO
