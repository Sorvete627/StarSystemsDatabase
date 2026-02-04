## Business Rules

### BR-01
A moon can not orbit a star.<br>
**Ensured by:** TRG_BodyStar_AfterInsertUpdate_MoonDontOrbitStar

### BR-02
Brown Dwarfs aren't stars neither planets.<br>

### BR-03
A celestial body atmosphere can be composed by different elements, but the sum of the amount present of them can't be more than 100%.<br>
**Ensured by:** TRG_PlanetAtmosphere_AfterInsert_OneHundredPercentAtmosphere

### BR-04
A planet can only orbit two or more stars if all are from the same system.<br>
**Ensured by:** TRG_PlanetStar_AfterInsert_SameSystemStars

### BR-05
A planet can only orbit two or more brown dwarf if all are from the same system and are considered primary.<br>
**Ensured by:** TRG_BodyBrownDwarf_AfterInsertUpdate_SameSystemPrimaryBrownDwarfs

### BR-06
A brown dwarf can only have rings if it is cosidered primary.<br>
**Ensured by:** TRG_BrownDwarfRing_AfterInsertUpdate_PrimaryBrownDwarfRing

### BR-07
A moon can only orbit a single planet
**Ensured by:** TRG_PlanetMoon_AfterInsertUpdate_MoonOrbitSinglePlanet

### BR-08
Only planet can orbit brown dwarfs considered primary and only moons can orbit brown dwarf not primary.<br>
**Ensured by:** TRG_BodyBrownDwarf_AfterInsertUpdate_MoonDontOrbitPrimaryBrownDwarfs and TRG_BodyBrownDwarf_AfterInsertUpdate_SameSystemPrimaryBrownDwarfs

### BR-09
A atmosphere element can not be present twice in the same planet. It would allow data redundancy and inconsistency.<br>
**Ensured by:** PK_PlanetAtmosphere_IdPlanet_IdAtmosphere<br>
Note: this pattern is present in every composite primary key in the database
