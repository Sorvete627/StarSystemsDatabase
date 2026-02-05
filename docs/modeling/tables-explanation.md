## Overview

This file contains information according to the conventions used during database modeling and an explanation of each table within it.

### Conventions

- **Tables:** PascalCase
- **Columns:** PascalCase
- **Relationship Tables:** EntityAEntityB
- **Primary Keys:** IdTable

## Tables

### Body

* **Description:**
Stores information about planets, moons and their attributes.

* **Reason for existence:**
To define a celestial body as an entity in its own right, possessing unique attributes and capable of interacting with various other entities, such as stars.

* **Relationships:**

  - Body (0:N) - Atmosphere (0:N)
  - Body (0:N) - Star (0:N)
  - Body (1:1) - BodyType (0:N)
  - Body (0:N) - Ring (0:N)
  - Body (1:1) - SubType (0:N)
  - Body (0:N) - PlanetMoon (1:1)
  - Body (0:N) - BrownDwarf (0:N)

### Ring

* **Description:**
Stores all possible types of a ring.

* **Reason for existence:**
Allowing for a greater variety of rings for celestial bodies, for example: a rocky ring and an icy ring.

* **Relationships:**

  - Ring (0:N) - Body (0:N)
  - Ring (0:N) - BrownDwarf (0:N)

### Star

* **Description:**
Stores all the stars, their attributes, and their respective system.

* **Reason for existence:**
To allow all planets to have something to orbit, instead of just being "loose" in a system.

* **Relationships:**

  - Star (1:1) - StarSystem (0:N)
  - Star (0:N) - Body (0:N)
  - Star (1:1) - StarType (0:N)
 
### StarType

* **Description:**
It stores all possible types of stars, for example: red giant and yellow dwarf.

* **Reason for existence:**
To allow a greater depth of detail in the stars, with several different types among them.

* **Relationships:**

- StarType (0:N) Star (1:1)

### Atmosphere

* **Description:**
It stores all possible types of atmosphere for a planet or moon.

* **Reason for existence:**
To increase the detail of each body's attributes ensures greater uniqueness for each one.

* **Relationships:**

  - Atmosphere (0:N) - Body (0:N)

### BodyType

* **Description:**
It stores if a body is considered a planet or moon.

* **Reason for existence:**
To allow to allow for differentiation between each body.

* **Realtionships:**

  - BodyType (0:N) - Body (1:1)
 
### BodySubType

* **Description:**
It stores the various existing types of planets and moons.

* **Reason for existence:**
To allow even more differentiation between each planet and moon, for example: "metallic planet"; not just "planet."

* **Realtionships:**

  - BodyType (0:N) - Body (1:1)
 
### StarSystem

* **Description:**
Stores all the stellar systems in the database.

* **Reason for existene:**
Create a relationship between all celestial bodies in the database, allowing for differences in the location of each one. Certain stars are in one system and certain stars are in another system.

* **Relationships:**
  - StarSystem (1:N) - Star (1:1)
 
### BrownDwarf

* **Description:**
Stores all brown dwarfs and their attributes.

* **Reason for existence:**
To allown more diversity in what a body can orbit, not being able to orbit only stars.

* **Relationships:**
  -BrownDwarf (1:1) - BrownDwarfType (0:N)
  -BrownDwarf (0:N) - BodyBrownDwarf (0:N)
  -BrownDwarf (0:1) - BrownDwarfRing (0:N)

### BrownDwarfType

* **Description:**
It stores all possible types of brown dwarf.

* **Reason for existence:**
To increase brown dwarfs details and more combination between them.

* **Relationships:**
 -BrownDwarfType (0:N) - BrownDwarf (1:1)

### PlanetMoon

* **Description:**
Stores the relashion ship between a planet and it's moons.

* **Reason for existence:**
Allow the existence of moons, bodies that orbit planets.

* **Relationships:**
 -PlanetMoon (1:N) - Body (0:N)
 
### BodyAtmosphere

* **Description:**
Relationship table between Body and Atmosphere, also stores the percentage of each element in the body atmosphere.

* **Reason for existence:**
A body may not have an atmosphere, or it may have an atmosphere with various elements, and an atmosphere may not be present on any body, or it may be present on several.

### BodyRing

* **Description:**
Relationship table between Body and Ring.

* **Reason for existence:**
A body may have no rings, or it may have several rings, and a ring may not be associated with one body or it may be associated with several bodies.

### BodyStar

* **Description:**
Relationship table between Body and Star.

* **Reason for existence:**
A planet can orbit zero or several stars, and a star can have zero or several planets orbiting it.

### BodyBrownDwarf

* **Description:**
Relationship table between Body and BrownDwarf

* **Reason for existence:**
A body can orbit zero or several brown dwarf, and a brown dwarf can have zero or several bodies orbiting it.

### BrownDwarfRing

* **Description:**
* Relationship table between Ring and BrownDwarf.

* **Reason for existence:**
A brown dwarf may have no rings, or it may have several ring, and a ring may not be associated with one brown dwarf or it may be associated with several brown dwarfs.
