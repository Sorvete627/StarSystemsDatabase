/*
File: TRG_BodyStar_AIU_MoonDontOrbitStar.sql
Object: TRG_BodyStar_AIU_MoonDontOrbitStar
Author: Pedro Henkels
Date: 2026/02/09

Description:
Ensures that a moon won't be able to orbit a star.
Only planets do orbit stars.
*/

CREATE TRIGGER TRG_BodyStar_AfterInsertUpdate_MoonDontOrbitStar
ON dbo.BodyStar
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM Inserted i
		JOIN Body b
			ON i.IdBody = b.IdBody
		JOIN BodyType bt
			ON b.IdBodyType = bt.IdBodyType
	WHERE bt.BodyTypeName = 2) --Moon
	BEGIN;
		THROW 50003,
			'A moon can not orbit a star, only planets',
			1;
	END;
END;
GO
