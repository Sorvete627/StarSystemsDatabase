## Table: Body

| Column            | Type         | Description                               |
|-------------------|--------------|-------------------------------------------|
| (PK)IdBody        | INT          | Unique body identifier                    |
| BodyName          | VARCHAR(100) | Body name                                 |
| (FK)IdBodyType    | TINYINT      | FK to define body type                    |
| (FK)IdBodySubType | TINYINT      | FK to define body subtype                 |
| Landable          | BIT          | Defines if a body is landable             |
| Gravity           | DECIMAL(5,2) | Body gravity compared to Earth            |
| Geo               | BIT          | Defines if a body has geological activity |
| Bio               | BIT          | Defines if a body has biological activity |

## Table: Ring

| Column     | Type         | Description             |
|------------|--------------|-------------------------|
| (PK)IdRing | TINYINT      | Unique ring identifier  |
| RingType   | VARCHAR(50)  | Defines ring's type     |

## Table: Star

| Column         | Type         | Description                                           |
|----------------|--------------|-------------------------------------------------------|
| (PK)IdStar     | SMALLINT     | Unique star identifier                                |
| StarName       | VARCHAR(100) | Star name                                             |
| (FK)IdStarType | TINYINT      | FK to define star's type                              |
| (FK)IdSystem   | SMALLINT     | FK to define which system the star is in              |
| IsPrimary      | BIT          | Define whether a star has its own orbit in the system | 

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
| BodyTypeName   | VARCHAR(30) | Defines body type      |

## Table: BodySubType

| Column            | Type        | Description               |
|-------------------|-------------|---------------------------|
| (PK)IdBodySubType | TINYINT     | Unique subtype identifier |
| IdBodySubTypeName | VARCHAR(30) | Defines body subtype      | 


## Table: StarSystem

| Column          | Type         | Description              |
|-----------------|--------------|--------------------------|
| (PK)IStarSystem | SMALLINT     | Unique system identifier |
| StarSystemName  | VARCHAR(100) | Defines a system name    |

## Table: BodyAtmosphere

| Column               | Type         | Description                                           |
|----------------------|--------------|-------------------------------------------------------|
| (PK, FK)IdBody       | INT          | FK to create relationship between body and atmosphere |
| (PK, FK)IdAtmosphere | TINYINT      | FK to create relationship between atmosphere and body |
| Ratio                | DECIMAL(5,2) | Percentage of the element present in the atmosphere   |

## Table: BodyRing

| Column         | Type    | Description                                     |
|----------------|---------|-------------------------------------------------|
| (PK, FK)IdBody | INT     | FK to create relationship between body and ring |
| (PK, FK)IdRing | TINYINT | FK to create relationship between ring and body |

## Table: BodyStar

| Column         | Type      | Description                                     |
|----------------|-----------|-------------------------------------------------|
| (PK, FK)IdBody | INT       | FK to create relationship between body and star |
| (PK, FK)IdStar | SMALLINT  | FK to create relationship between star and body |
