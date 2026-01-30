## Table: Planet

| Column         | Type         | Description                                 |
|----------------|--------------|---------------------------------------------|
| (PK)IdPlanet   | INT          | Unique planet identifier                    |
| PlanetName     | VARCHAR(100) | Planet's name                               |
| (FK)IdBodyType | TINYINT      | FK to define planet type                    |
| Landable       | BIT          | Defines if a planet is landable             |
| Gravity        | DECIMAL(5,2) | Planet's gravity compared to Earth          |
| Geo            | BIT          | Defines if a planet has geological activity |
| Bio            | BIT          | Defines if a planet has biological activity |

## Table: BrownDwarf

| Column           | Type     | Description                                               |
|------------------|----------|-----------------------------------------------------------|
| (PK)IdBrownDwarf | SMALLINT | Unique brown dwarf identifier                             |
| (FK)IdSystem     | SMALLINT | FK to define which system the brown dwarf is on           |
| IsPrimary        | BIT      | Defines if a brown dwarf is a primary star in it's system |


## Table: Ring

| Column     | Type         | Description             |
|------------|--------------|-------------------------|
| (PK)IdRing | TINYINT      | Unique ring identifier  |
| RingType   | VARCHAR(50)  | Defines ring's type     |

## Table: Star

| Column         | Type      | Description                              |
|----------------|-----------|------------------------------------------|
| (PK)IdStar     | SMALLINT  | Unique star identifier                   |
| (FK)IdStarType | TINYINT   | FK to define star's type                 |
| (FK)IdSystem   | SMALLINT  | FK to define which system the star is in |

## Table: StarType

| Column         | Type        | Description            |
|----------------|-------------|------------------------|
| (PK)IdStarType | TINYINT     | Unique type identifier |
| StarTypeName   | VARCHAR(50) | Defines star's type    |


## Table: Atmosphere

| Column           | Type        | Description                  |
|------------------|-------------|------------------------------|
| (PK)IdAtmosphere | TINYINT     | Unique atmosphere identifier |
| AtmosphereName   | VARCHAR(30) | Defines atmosphere type      |

## Table: BodyType

| Column         | Type        | Description            |
|----------------|-------------|------------------------|
| (PK)IdBodyType | TINYINT     | Unique type identifier |
| BodyTypeName   | VARCHAR(50) | Defines body's type    |


## Table: StarSystem

| Column          | Type         | Description              |
|-----------------|--------------|--------------------------|
| (PK)IStarSystem | SMALLINT     | Unique system identifier |
| StarSystemName  | VARCHAR(100) | Defines a system name    |

## Table: PlanetAtmosphere

| Column               | Type         | Description                                              |
|----------------------|--------------|----------------------------------------------------------|
| (PK, FK)IdPlanet     | INT          | FK to create relationship between planet and atmosphere  |
| (PK, FK)IdAtmosphere | TINYINT      | FK to create relationship between atmosphere and planet  |
| Ratio                | DECIMAL(5,2) | Percentage of the element present in the atmosphere      |

## Table: PlanetRing

| Column           | Type    | Description                                       |
|------------------|---------|---------------------------------------------------|
| (PK, FK)IdPlanet | INT     | FK to create relationship between planet and ring |
| (PK, FK)IdRing   | TINYINT | FK to create relationship between planet and ring |

## Table: BrownDwarfRing

| Column               | Type     | Description                                     |
|----------------------|----------|-------------------------------------------------|
| (PK, FK)IdBrownDwarf | SMALLINT | FK to create relationship between moon and ring |
| (PK, FK)IdRing       | TINYINT  | FK to create relationship between moon and ring |

## Table: PlanetStar

| Column           | Type      | Description                                       |
|------------------|-----------|---------------------------------------------------|
| (PK, FK)IdPlanet | INT       | FK to create relationship between planet and star |
| (PK, FK)IdStar   | SMALLINT  | FK to create relationship between star and planet |

## Table: PlanetBrownDwarf

| Coluna               | Type     | Description                                               |
|----------------------|----------|-----------------------------------------------------------|
| (PK, FK)IdBrownDwarf | SMALLINT | FK to create relationship between brown dwarf and planet  |
| (PK, FK)IdPlanet     | INT      | FK to create relationship between planet and brown dwarf  |

## Table: BrownDwarfStar

| Column               | Type     | Description                                            |
|----------------------|----------|--------------------------------------------------------|
| (PK, FK)IdBrownDwarf | SMALLINT | FK to create relationship between brown dwarf and star |
| (PK, FK)IdStar       | SMALLINT | FK to create relationship between star and brown dwarf |
