## Table: Planet

| Column        | Type          | Description |
|---------------|---------------|-------------|
| PlanetID    | INT             | Unique planet identifier                   |
| PlanetName  | VARCHAR(100)    | Planet's name                              |
| IdType      | INT             | FK for planet type                         |
| Landable    | BOOL            | Define if a planet is landable             |
| Gravity     | DECIMAL(3,2)    | Planet's gravity compared to Earth         |
| Geo         | BOOL            | Define if a planet has geological activity |
| Bio         | BOOL            | Define if a planet has biological activity |

## Table: Moon

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


## Table: BrownDwarf

| Coluna        | Tipo          | Descrição |
|--------------|--------------|-----------|
| PlanetID     | INT          | Identificador único do planeta |
| Name         | NVARCHAR(100)| Nome do planeta |
| StarID       | INT          | FK para a estrela que orbita |
| OrbitalPeriod| INT          | Período orbital em dias |


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
