## Table: Planet

| Column       | Type         | Description                                 |
|--------------|--------------|---------------------------------------------|
| (PK)PlanetID | INT          | Unique planet identifier                    |
| PlanetName   | VARCHAR(100) | Planet's name                               |
| (FK)IdType   | INT          | FK to define planet type                    |
| Landable     | BOOL         | Defines if a planet is landable             |
| Gravity      | DECIMAL(3,2) | Planet's gravity compared to Earth          |
| Geo          | BOOL         | Defines if a planet has geological activity |
| Bio          | BOOL         | Defines if a planet has biological activity |

## Table: Moon

| Column           | Type         | Description                                |
|------------------|--------------|--------------------------------------------|
| (PK)IdMoon       | INT          | Unique moon identifier                     |
| MoonName         | VARCHAR(100) | Moon's name                                |
| (FK)IdType       | INT          | FK to define moon type                     |
| Gravity          | Gravity(3,2) | Moon's gravity compared to Earth           |
| Landable         | BOOL         | Defines if a moons is landable             |
| Geo              | BOOL         | Defines if a moon has geological activity  |
| Bio              | BOOL         | Defines if a moon has biological activity  |
| (FK)IdlPlanet    | INT          | FK to define wich planet a moon orbit      |
| (FK)IdBrownDwarf | INT          | FK to define wich brown dwarf a moon orbit |

## Table: BrownDwarf

| Column           | Type | Description                                               |
|------------------|------|-----------------------------------------------------------|
| (PK)IdBrownDwarf | INT  | Unique brown dwarf identifier                             |
| (FK)IdSystem     | INT  | FK to define wich system the brown dwarf is on            |
| Primary          | BOOL | Defines if a brown dwarf is a primary star in it's system |


## Table: Ring

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: Star

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: StarType

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: Atmosphere

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: BodyType

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: System

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: PlanetAtmosphere

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |

## Table: MoonAtmosphere

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: PlanetRing

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: MoonRing

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: BrownDwarfRing

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: PlanetStar

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: BrownDwarfPlanet

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: BrownDwarfStar

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |
