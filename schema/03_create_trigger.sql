/*
File: 03_create_trigger.sql
Project: Star Systems Database
Description: Trigger's creation code
Author: Pedro Henkels
Date: 2026/01/20

Overview
Each trigger only exists because its respective business rule could not be ensured with constraints or via modeling.
After Insert, Update triggers were used because the goal is to execute the transaction if it does not violate any business rule and rollback it if it is before it's commited.
Update events are alo handled because every transaction also need validation when updating the data, not only when creating.
The logic table Inserted is used to allow the trigger to view the data that is being inserted and validate it.
IF EXISTS return an error if at least one record is not inside the business rule, allowing multiple line inserts.
*/

--Ensure business rule in which moon can only orbit a brown dwarf if it is not considered primary.
CREATE TRIGGER TRG_Moon_AfterInsert_IsBrownDwarfPrimary
ON dbo.Moon
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (
		SELECT 1 FROM INSERTED i
		JOIN dbo.BrownDwarf bd
			ON i.IdBrownDwarf = bd.IdBrownDwarf
		WHERE bd.IsPrimary = 1)
	BEGIN;
		THROW 50001,
		'A moon can not orbit a brown dwarf if it is not considered primary.',
		1;
	END;
END;
GO

--Do not allow a total atmosphere of a planet to be more than 100%.
CREATE TRIGGER TRG_PlanetAtmosphere_AfterInsert_OneHundredPercentAtmosphere
ON dbo.PlanetAtmosphere
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM PlanetAtmosphere pa
		JOIN Inserted i
			ON pa.IdPlanet = i.IdPlanet
		GROUP BY pa.IdPlanet
		HAVING SUM(pa.Ratio) > 100)
		BEGIN;
			THROW 50002,	
				'The total atmosphere of a planet can not be more than 100%.',
				1
		END;
END;
GO

--Ensure business rule in which a planet can only orbit multiple stars from the same system.
CREATE TRIGGER TRG_PlanetStar_AfterInsert_SameSystemStars
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
		HAVING COUNT(DISTINCT s.IdSystem) > 1)
	BEGIN;
		THROW 50003,
			'A planet can only orbit two or more stars if all are from the same star system.',
			1;
	END;
END;
GO

--Ensure business rule in which a planet can only orbit multiple brown dwarfs from the same system.
CREATE TRIGGER TRG_PlanetBrownDwarf_AfterInsert_SameSystemBrownDwarfs
ON dbo.PlanetBrownDwarf
AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM PlanetBrownDwarf pb
		JOIN Inserted i
			ON pb.IdPlanet = i.IdPlanet
		JOIN BrownDwarf bd
			ON pb.IdBrownDwarf = bd.IdBrownDwarf
		GROUP BY pb.IdPlanet
		HAVING COUNT(DISTINCT bd.IdSystem) > 1)
	BEGIN;
		THROW 50004,
			'A planet can only orbit two or more brown dwarfs if all are from the same star system.',
			1;
	END;
END;
GO

--Ensure business rule in which brown dwarf can only orbit a star if the brown dwarf is not considered primary.
CREATE TRIGGER TRG_BrownDwarfStar_AfterInsert_IsBrownDwarfPrimary
ON dbo.BrownDwarfStar
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM Inserted i
		JOIN BrownDwarf bd
			ON i.IdBrownDwarf = bd.IdBrownDwarf
		WHERE bd.IsPrimary = 1)
	BEGIN;
		THROW 50005,
			'A brown dwarf which is primary can not orbit a star.',
			1;
	END;
END;
GO

--Ensure business rule in which a brown dwarf can only orbit multiple stars from the same system.
CREATE TRIGGER TRG_BrownDwarfStar_AfterInsert_SameSystemStars
ON dbo.BrownDwarfStar
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM BrownDwarfStar bs
		JOIN Inserted i
			ON bs.IdBrownDwarf = i.IdBrownDwarf
		JOIN Star s
			ON bs.IdStar = s.IdStar
		GROUP BY bs.IdBrownDwarf
		HAVING COUNT(DISTINCT s.IdSystem) > 1)
	BEGIN;
		THROW 50006,
			'A planet can only orbit two or more brown dwarfs if all are from the same star system.',
			1;
	END;
END;
GO

--Ensure business rule in which a planet can only orbit a brown dwarf if is considered primary.
CREATE TRIGGER TRG_PlanetBrownDwarf_AfterInsert_IsBrownDwarfPrimary
ON dbo.PlanetBrownDwarf
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM Inserted i
		JOIN BrownDwarf bd
			ON i.IdBrownDwarf = bd.IdBrownDwarf
		WHERE bd.IsPrimary = 0)
	BEGIN;
		THROW 50007,
			'A planet can only orbit a brown dwarf if it is considered primary.',
			1;
	END;
END;
GO
