/*
File: TRG_BodyStar_AIU_SameSystemStars.sql
Object: TRG_BodyStar_AIU_SameSystemStars
Author: Pedro Henkels
Date: 2026/02/09

Description:
Ensures that a planet will only orbit starts that are in the same star system.
A planet can not orbit stars in two different systems.
*/

CREATE TRIGGER TRG_BodyStar_AfterInsertUpdate_SameSystemStars
ON dbo.BodyStar
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM BodyStar bs
		JOIN Inserted i
			ON bs.IdBody = i.IdBody
		JOIN Star s
			ON i.IdStar = s.IdStar
		GROUP BY bs.IdBody
	    HAVING COUNT(DISTINCT s.IdSystem) > 1)
--Return TRUE if any star is in a different system than the others orbited by the planet.
	BEGIN;
		THROW 50002,
			'A planet can only orbit two or more stars if all are from the same star system.',
			1;
	END;
END;
GO
