## Business Rules

### BR-01
A single moon can only orbit a single celestial body.<br>
**Ensured by:** CK_Moon_IdPlanet

### BR-02
A brown dwarf is not a planet, neither a star or moon.

### BR-03
A moon can only orbit a brown dwarf if it is not considered primary.<br>
**Ensured by:** TRG_Moon_AfterInsert_IsBrownDwarfPrimary

### BR-04
A celestial body atmosphere can be composed by different elements, but the sum of the amount present of them can't be more than 100%.<br>
**Ensured by:** TRG_PlanetAtmosphere_AfterInsert_OneHundredPercentAtmosphere

### BR-05
A planet can only orbit two or more stars if all are from the same system.<br>
**Ensured by:** TRG_PlanetStar_AfterInsert_SameSystemStars

### BR-06
A planet can only orbit two or more brown dwarfs if all are from the same system.<br>
**Ensured by:** TRG_PlanetBrownDwarf_AfterInsert_SameSystemBrownDwarfs

### BR-07
A brown dwarf can only orbit a star if the brown dwarf is not considered primary.<br>
**Ensured by:** TRG_BrownDwarfStar_AfterInsert_IsBrownDwarfPrimary

### BR-08
A brown dwarf can only orbit two or more stars if all are from the same system.<br>
**Ensured by:** TRG_BrownDwarfStar_AfterInsert_SameSystemStars

### BR-09
A planet can not orbit a brown dwarf if it is not considered primary.<br>
**Ensured by:** TRG_PlanetBrownDwarf_AfterInsert_IsBrownDwarfPrimary

### BR-10
A atmosphere element can not be present twice in the same planet. It would allow data redundancy and inconsistency.<br>
**Ensured by:** PK_PlanetAtmosphere_IdPlanet_IdAtmosphere<br>
Note: this pattern is present in every composite primary key in the database
