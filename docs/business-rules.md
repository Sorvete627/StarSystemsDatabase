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
A planet can only orbit two or more brown dwarf if all are from the same system.<br>
**Ensured by:** TRG_BodyBrownDwarf_AfterInsertUpdate_SameSystemBrownDwarfs

### BR-06
A brown dwarf can only have rings if it is cosidered primary.<br>
**Ensured by:** TRG_BrownDwarfRing_AfterInsertUpdate_PrimaryBrownDwarfRing

### BR-07
A moon can only orbit a single planet
**Ensured by:** PK_PlanetMoon

### BR-08
Only planet can orbit brown dwarfs, moons cannot.<br>
**Ensured by:** TRG_BodyBrownDwarf_AfterInsertUpdate_MoonDontOrbitBrownDwarfs

### BR-09
Only non-primary brown dwarfs can have rings.<br>
**Ensured by:** TRG_BrownDwarfRing_AfterInsertUpdate_PrimaryBrownDwarfRing

### BR-10
A atmosphere element can not be present twice in the same planet. It would allow data redundancy and inconsistency.<br>
**Ensured by:** PK_BodyAtmosphere_IdBody_IdAtmosphere<br>
Note: this pattern is present in every composite primary key in the database
