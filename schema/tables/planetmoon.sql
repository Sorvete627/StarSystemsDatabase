/*
File: planetmoon.sql
Objetc dbo.PlanetMoon
Author: Pedro Henkels
Date: 2026/01/08
*/

CREATE TABLE dbo.PlanetMoon(
	IdPlanet INT,
	IdMoon INT
--A moon shouldn't appear more than one time in this table, since a moon can only orbit a single planet.
		CONSTRAINT UQ_PlanetMoon_IdMoon UNIQUE,
CONSTRAINT PK_PlanetMoon_IdPlanet_IdMoon
	PRIMARY KEY(IdPlanet, IdMoon),
CONSTRAINT FK_PlanetMoon_IdPlanet
--If a planet no longer exists it's moon also shouldn't
	FOREIGN KEY (IdPlanet) REFERENCES Body(IdBody) ON DELETE CASCADE,
CONSTRAINT FK_PlanetMoon_IdMoon
--ON DELETE CASCADE would cause a multiple path delete error
	FOREIGN KEY (IdMoon) REFERENCES Body(IdBody) ON DELETE NO ACTION);
GO
