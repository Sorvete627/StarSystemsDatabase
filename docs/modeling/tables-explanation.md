## Overview

This file contains information according to the conventions used during database modeling and an explanation of each table within it.

### Conventions

- **Tables:** PascalCase
- **Columns:** PascalCase
- **Relationship Tables:** EntityAEntityB
- **Primary Keys:** IdTable

## Tables

### Planet

* **Description:**
Stores the planets that orbit a star or brown dwarf and their attributes.

* **Reason for existence:**
To define a planet as an entity in its own right, possessing unique attributes and capable of interacting with various other entities, such as moons and rings.

* **Relationships:**

  - Planet (0:N) - Atmosphere (0:N)
  - Planet (0:N) - Moon (1:1)
  - Planet (0:N) - Star (0:N)
  - Planet (1:1) - BodyType (0:N)
  - Planet (0:N) - Ring (0:N)
  - Planet (0:N) - BrownDwarf (0:N)
 
### Moon

* **Description:**
Stores attributes of each moon and which body it orbits.

* **Reason for existence:**
To define the moon as a distinct entity and adding more detail to it, allowing for diverse attributes and clear relationships, especially relating the moon specifically to which planet or brown dwarf it orbits.

*  **Relationships:**

  - Moon (1:1) -  Planet (0:N)
  - Moon (0:N) - Atmosphere (0:N)
  - Moon (1:1) - BodyType (0:N)
  - Moon (0:N) - Ring (0:N)
  - Moon (0:1) - BrownDwarf (0:N)

### BrownDwar

* **Description:**
It stores all existing brown dwarfs.

* **Reason for existence:**
To define each brown dwarf as unique and allow for the identification of a brown dwarf if it is a primary star in its stellar system.

* **Realtionships:**

  - BrownDwarf (0:N) - Planet (0:N)
  - BrownDwarf (0:N) - Moon (0:1)
  - BrownDwarf (0:N) - Ring (0:N)
  - BrownDwarf (0:N) - StarSystem (0:N)
  - BrownDwarf (0:N) - Star (0:N)

### Ring

* **Description:**
Stores all possible types of a ring.

* **Reason for existence:**
Allowing for a greater variety of rings for celestial bodies, for example: a rocky ring and an icy ring.

* **Relationships:**

  - Ring (0:N) - Planet (0:N)
  - Ring (0:N) - Planet (0:N)
  - Ring (0:N) - Planet (0:N)

### Star

* **Description:**
Stores all the stars, their attributes, and their respective system.

* **Reason for existence:**
To allow all bodies to have something to orbit, instead of just being "loose" in a system.

* **Relationships:**

  - Star (1:1) - StarSystem (0:N)
  - Star (0:N) - Planet (0:N)
  - Star (0:N) - BrownDwarf (0:N)
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

  - Atmosphere (0:N) - Planet (0:N)
  - Atmosphere (0:N) - Moon (0:N)
 
### BodyType

* **Description:**
It stores the various existing types of planets or moons.

* **Reason for existence:**
To allow even more differentiation between each planet and moon, for example: "metallic planet"; not just "planet."

* **Realtionships:**

  - BodyType (0:N) - Planet (1:1)
  - BodyType (0:N) - Moon (1:1)
 
### StarSystem

* **Description:**
Stores all the stellar systems in the database.

* **Reason for existene:**
Create a relationship between all celestial bodies in the database, allowing for differences in the location of each one. Certain stars are in one system and certain stars are in another system.

* **Relationships:**
  - StarSystem (0:N) - Star (1:1)
  - StarSystem (0:N) - BrownDwarf (1:1)
 
### PlanetAtmosphere

* **Description:**
Relationship table between Planet and Atmosphere, also stores the percentage of each element in the planet's atmosphere.

* **Reason for existence:**
A planet may not have an atmosphere, or it may have an atmosphere with various elements, and an atmosphere may not be present on any planet, or it may be present on several.

### MoonAtmosphere

* **Description:**
Relationship table between Moon and Atmosphere, also stores the percentage of each element in the moon's atmosphere.

* **Reason for existence:**
A moon may have no atmosphere at all, or it may have an atmosphere with various elements, and an atmosphere may not exist on any moon or it may exist on several.

### PlanetRing

* **Description:**
Relationship table between Planet and Ring.

* **Reason for existence:**
A planet may have no rings, or it may have several rings, and a ring may not be associated with one planet or it may be associated with several planets.

### MoonRing

* **Description:**
Relationship table between Moon and Ring

* **Reason for existence:**
A moon may have no rings, or it may have several rings, and a ring may not be associated with any moon, or it may be associated with several moons.

### BrownDwarfRing

* **Description:**
Relationship table between BrownDwarf and Ring.

* **Reason for existence:**
A brown dwarf may have no rings, or it may have several rings, and a ring may not be associated with a brown dwarf, or it may be associated with several.

### PlanetStar

* **Description:**
Relationship table between Planet and Star

* **Reason for existence:**
A planet can orbit zero or several stars, and a star can have zero or several planets orbiting it.

### BrownDwarfPlanet

* **Description:**
Relationship table between BrownDwarf and Planet

* **Reason for existence:**
A brown dwarf can have several planets or no planets orbiting it, and a planet can orbit several brown dwarfs or none at all.

### BrownDwarfStar

* **Descriptio:**
Relationship table between BrownDwarf and Star.

* **Reason for existence:**
A brown dwarf can orbit several stars or none at all, and a star can have several brown dwarfs orbiting it or none at all.
