/*
File: 03_create_trigger.sql
Project: Star Systems Database
Description: Trigger's creation code
Author: Pedro Henkels
Date: 2026/01/20

-Overview
	Each trigger only exists because its respective business rule could not be ensured with constraints or via modeling.
	After Insert, Update triggers were used because the goal is to execute the transaction if it does not violate any business rule and rollback it if it is before it's commited.
	Update events are alo handled because every transaction also need validation when updating the data, not only when creating.
	The logic table Inserted is used to allow the trigger to view the data that is being inserted and validate it.
	IF EXISTS return an error if at least one record is not inside the business rule, allowing multiple line inserts.
	NOCOUNT ON is used to avoid visual pollution, since triggers usually affects multiple lines.
*/

--Do not allow a total atmosphere of a body to be more than 100%.
CREATE TRIGGER TRG_PlanetAtmosphere_AfterInsertUpdate_OneHundredPercentAtmosphere
ON dbo.PlanetAtmosphere
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM PlanetAtmosphere pa
		JOIN Inserted i
			ON pa.IdPlanet = i.IdPlanet
		GROUP BY pa.IdPlanet
--GROUP BY to SUM Ratio once per body, not all body ratio at once.
		HAVING SUM(pa.Ratio) > 100)
		BEGIN;
			THROW 50002,	
				'The total atmosphere of a body can not be more than 100%.',
				1
		END;
END;
GO

--Ensure business rule in which a planet can only orbit multiple stars from the same system.
CREATE TRIGGER TRG_PlanetStar_AfterInsertUpdate_SameSystemStars
ON dbo.PlanetStar
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM PlanetStar ps
		JOIN Inserted i
			ON ps.IdStar = i.IdStar
		JOIN Star s
			ON i.IdStar = s.IdStar
		GROUP BY ps.IdPlanet
--GROUP BY to count distinct IdSystem only once from a specific IdPlanet
		HAVING COUNT(DISTINCT s.IdSystem) > 1)
	BEGIN;
		THROW 50003,
			'A planet can only orbit two or more stars if all are from the same star system.',
			1;
	END;
END;
GO

--Ensure that a moon dont orbit a star
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
	WHERE bt.BodyTypeName = 'Moon')
	BEGIN;
		THROW 50003,
			'A moon can not orbit a star, only planets',
			1;
	END;
END;
GO

