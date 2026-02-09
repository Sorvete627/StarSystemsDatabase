/*
File: TRG_BodyAtmosphere_AIU_OneHundredPercentAtmosphere.sql
Object: TRG_BodyAtmosphere_AIU_OneHundredPercentAtmosphere
Author: Pedro Henkels
Date: 2026/01/20

Description:
Do not allow a total atmosphere of a body to be more than 100%.
*/

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
--GROUP BY to SUM all atmosphere percentage on each planet
		HAVING SUM(ba.Ratio) > 100)
		BEGIN;
			THROW 50001,	
				'The total atmosphere of a body can not be more than 100%.',
				1
		END;
END;
GO
