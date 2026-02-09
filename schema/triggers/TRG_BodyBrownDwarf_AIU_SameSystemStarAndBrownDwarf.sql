/*
File: TRG_BodyBrownDwarf_AIU_SameSystemStarAndBrownDwarf.sql
Object: TRG_BodyBrownDwarf_AIU_SameSystemStarAndBrownDwarf
Author: Pedro Henkels
Date: 2026/02/09

Description:
Avoid that a planet or moon can be associated to, orbit, a brown dwarf and a star with both being from different systems.
Since BodyBrownDwarf and BodyStar are two independent tables, a INSERT could associate any body to a star where IdSystem = 1 on table BodyStar
and associate the same body to a brown dwarf on BodyBrownDwarf where IdSystem = 2
*/

CREATE TRIGGER TRG_BodyBrownDwarf_AfterInsertUpdate_SameSystemStarAndBrownDwarf
ON dbo.BodyBrownDwarf
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM Inserted i
		JOIN BodyStar bs
			ON i.IdBody = bs.IdBody
		JOIN Star s
			ON  bs.IdStar = s.IdStar
		JOIN BrownDwarf bd
			ON i.IdBrownDwarf = bd.IdBrownDwarf
		WHERE s.IdSystem <> bd.IdStarSystem)
	BEGIN;
		THROW 50009,
			'A planet can only orbit a star and a brown dwarf if both are from the same system',
			1;
	END;
END;
GO
