## Business Rules

### BR-01
A moon can not orbit a star.<br>
**Ensured by:** TRG_BodyStar_AfterInsertUpdate_MoonDontOrbitStar

### BR-02
A celestial body atmosphere can be composed by different elements, but the sum of the amount present of them can't be more than 100%.<br>
**Ensured by:** TRG_PlanetAtmosphere_AfterInsert_OneHundredPercentAtmosphere

### BR-03
A planet can only orbit two or more stars if all are from the same system.<br>
**Ensured by:** TRG_PlanetStar_AfterInsert_SameSystemStars

### BR-4
A atmosphere element can not be present twice in the same planet. It would allow data redundancy and inconsistency.<br>
**Ensured by:** PK_PlanetAtmosphere_IdPlanet_IdAtmosphere<br>
Note: this pattern is present in every composite primary key in the database
