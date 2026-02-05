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
CREATE TRIGGER TRG_BodyAtmosphere_AfterInsertUpdate_OneHundredPercentAtmosphere
ON dbo.BodyAtmosphere
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;	
	IF EXISTS (SELECT 1 FROM BodyAtmosphere ba
		JOIN Inserted i
			ON ba.IdBody = i.IdBody
		GROUP BY ba.IdBody
		HAVING SUM(ba.Ratio) > 100)
		BEGIN;
			THROW 50001,	
				'The total atmosphere of a body can not be more than 100%.',
				1
		END;
END;
GO

--Ensures that a planet will only orbit starts that are in the same star system.
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
	BEGIN;
		THROW 50002,
			'A planet can only orbit two or more stars if all are from the same star system.',
			1;
	END;
END;
GO

--Ensures that a moon won't be able to orbit a star
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

--Ensures that a planet will only orbit primary brown dwarfs that are in the same star system.
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

--Ensures that only primary brown dwarf can have rings.
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

--Ensures that a moon can orbit a non-primary brown dwarf, but no primary brown dwarf.
CREATE TRIGGER TRG_BodyBrownDwarf_AfterInsertUpdate_MoonDontOrbitPrimaryBrownDwarfs
ON dbo.BodyBrownDwarf
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT 1 FROM Inserted i
		JOIN Body b
			ON i.IdBody = b.IdBody
		JOIN BrownDwarf bd
			ON i.IdBrownDwarf =  bd.IdBrownDwarf
		JOIN BodyType bt
			ON b.IdBodyType = bt.IdBodyType
		WHERE bt.IdBodyType = 2 AND bd.IsPrimary = 1)
	BEGIN;
		THROW 50007,
		 'A moon can not orbit a primary brown dwarf.',
		 1;
	END;
END;
GO

/*
Following two trigger exists to avoid that a planet or moon can be associated to, orbit, a brown dwarf and a star with both being from different systems.
Since BodyBrownDwarf and BodyStar are two independent tables, a INSERT could associate any body to a star where IdSystem = 1 on table BodyStar and associate the same body to a brown dwarf on BodyBrownDwarf where IdSystem = 2
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

--Ensures that a planet cannot orbit a non primary brown dwarf, only moons should do that.
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

