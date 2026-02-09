/*
File: TRG_BodyStar_AIU_SameSystemStarAndBrownDwarf.sql
Object: TRG_BodyStar_AIU_SameSystemStarAndBrownDwarf
Author: Pedro Henkels
Date: 2026/02/09

Description:
Avoid that a planet or moon can be associated to, orbit, a brown dwarf and a star with both being from different systems.
Since BodyBrownDwarf and BodyStar are two independent tables, a INSERT could associate any body to a star where IdSystem = 1 on table BodyStar
and associate the same body to a brown dwarf on BodyBrownDwarf where IdSystem = 2
*/

CREATE TRIGGER TRG_BodyStar_AfterInsertUpdate_SameSystemStarAndBrownDwarf
ON dbo.BodyStar
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM Inserted i
		JOIN BodyBrownDwarf bb
			ON i.IdBody = bb.IdBody
		JOIN BrownDwarf bd
			ON bb.IdBrownDwarf = bd.IdBrownDwarf
		JOIN Star s
			ON i.IdStar = s.IdStar
		WHERE s.IdSystem <> bd.IdStarSystem)
	BEGIN;
		THROW 50008,
			'A planet can only orbit a star and a brown dwarf if both are from the same system',
			1;
	END;
END;
GO
