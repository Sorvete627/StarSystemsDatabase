/*
File: body.sql
Objetc dbo.Body
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.Body(
	IdBody INT IDENTITY (1,1)
		CONSTRAINT PK_Body PRIMARY KEY,
	BodyName VARCHAR(100) NOT NULL
		CONSTRAINT UQ_Body_BodyName UNIQUE,
	IdBodyType TINYINT NOT NULL,
	IdStarSystem SMALLINT NOT NULL,
	IdBodySubType TINYINT NOT NULL,
--Defines if a body is landable or not
	Landable BIT NOT NULL,
--Gravity is compared to the earth's one, for example, "this body has 3,20 more gravity than earth"
	Gravity DECIMAL(5,2) NOT NULL,
--BIT to indicate if this body has geologial and/or biological activity
	Geo BIT,
	Bio BIT,
CONSTRAINT FK_Body_IdBodyType
--If a body type no longer exists all bodies with that body type also shouldn't
	FOREIGN KEY (IdBodyType) REFERENCES BodyType(IdBodyType) ON DELETE CASCADE,
CONSTRAINT FK_Body_IdBodySubType
--If a body subtype no longer exists all bodies with that body subtype also shouldn't
	FOREIGN KEY (IdBodySubType) REFERENCES BodySubType (IdBodySubType) ON DELETE CASCADE,
CONSTRAINT FK_Body_IdStarSystem
--If a star system no longer exists all bodies on it also shouldn't
	FOREIGN KEY (IdStarSystem) REFERENCES StarSystem(IdStarSystem) ON DELETE CASCADE);
GO
