# English

## Overview

This file contains information according to the conventions used during database modeling and an explanation of each table within it.

### Conventions

- **Tables:** PascalCase
- **Columns:** PascalCase
- **Relationship Tables:** EntityAEntityB
- **Primary Keys:** IdTable

## Tables

### Planets

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
  - BrownDwarf (0:N) - System (0:N)
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

  - Star (1:1) - System (0:N)
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
 
### System

* **Description:**
Stores all the stellar systems in the database.

* **Reason for existene:**
Create a relationship between all celestial bodies in the database, allowing for differences in the location of each one. Certain stars are in one system and certain stars are in another system.

* **Relationships:**
  - System (0:N) - Star (1:1)
  - System (0:N) - BrownDwarf (1:1)
 
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

---

# Português (Brasil)

## Visão Geral

Neste arquivo está armazenado as convenções utilizadas durante a modelagem do banco de dados e a explicação de cada tabela presente nele.

### Convenções

- **Tabelas:** PascalCase
- **Colunas:** PascalCase
- **Tabelas de Relacionamento:** EntidadeAEntidadeB
- **Chaves Primárias:** IdTabela

## Tabelas

### Planets

* **Descrição:**
Armazena os planetas que orbitam uma estrela ou anã marrom e seus atributos.

* **Motivo da existência:**
Definir planeta como uma entidade própria, tendo atributos únicos e podendo se relacionar com diversas outras entidades, como luas e anéis.

* **Relacionamentos:**

  - Planet (O:N) - Atmosphere (0:N)
  - Planet (O:N) - Moon (1:1)
  - Planet (0:N) - Star (0:N)
  - Planet (1:1) - BodyType (0:N)
  - Planet (0:N) - Ring (0:N)
  - Planet (0:N) - BrownDwarf (0:N)

### Moon

* **Descrição:**
Armazena atributos de cada lua e qual corpo ela orbita.

* **Motivo da existência:**
Definir lua como uma entidade própria e adicionar mais detalhamento à ela, permitindo atributos diversos e relacionamentos claros, principalmente relacionar lua especificamente a qual planeta ou anã marrom ela orbita.

* **Relacionamentos:**

  - Moon (1:1) -  Planet (0:N)
  - Moon (0:N) - Atmosphere (0:N)
  - Moon (1:1) - BodyType (0:N)
  - Moon (0:N) - Ring (0:N)
  - Moon (0:1) - BrownDwarf (0:N)

### BrownDwarf

* **Descrição:**
Armazena todas as anãs marrons existentes.

* **Motivo da existência:**
Definir cada anã marrom como única e permitir a identificação de uma anã marrom caso ela seja uma estrela primária de seu sistema estelar.

* **Relacionamentos:**

  - BrownDwarf (0:N) - Planet (0:N)
  - BrownDwarf (0:N) - Moon (0:1)
  - BrownDwarf (0:N) - Ring (0:N)
  - BrownDwarf (0:N) - System (0:N)
  - BrownDwarf (0:N) - Star (0:N)

### Ring

* **Descrição:**
Armazena todos os tipos possiveis de um anel.

* **Motivo da existência:**
Permitir uma maior variedade de anéis para os corpos celestes, por exemplo: anel rochoso e anel gelado.

* **Relacionamentos:**

  - Ring (0:N) - Planet (0:N)
  - Ring (0:N) - Planet (0:N)
  - Ring (0:N) - Planet (0:N)

### Star

* **Descrição:**
Armazena todas as estrelas, seus atributos e seu respectivo sistema.

* **Motivo da existência:**
Permitir que todos os corpos tenham algo para orbitar, ao invés de apenas ficarem "soltos" em um sistema.

* **Relacionamentos:**

  - Star (1:1) - System (0:N)
  - Star (0:N) - Planet (0:N)
  - Star (0:N) - BrownDwarf (0:N)
  - Star (1:1) - StarType (0:N)

### StarType

* **Descrição:**
Armazena todos os tipos possíveis de uma estrela, por exemplo: gigante vermelha e anã amarela.

* **Motivo da existência:**
Permitir mais profundidade de detalhamento às estrelas, com vários tipos diferentes entre elas.

* **Relacionamentos:**

  - StarType (0:N) Star (1:1)

### Atmosphere

* **Descrição:**
Armazena todos os tipos possíveis de atmosfera para um planeta ou lua.

* **Motivo da existência:**
Aumentar o detalhe dos atributos de cada corpo, garantido mais unicidade para cada um.

* **Relacionamentos:**

  - Atmosphere (0:N) - Planet (0:N)
  - Atmosphere (0:N) - Moon (0:N)

### BodyType

* **Descrição:**
Armazena os vários tipos existentes de planeta ou lua.

* **Motivo da existência**:
Permitir ainda mais diferença entre cada planeta e lua, por exemplo: "planeta metálico"; não apenas "planeta".

* **Relacionamentos:**

  - BodyType (0:N) - Planet (1:1)
  - BodyType (0:N) - Moon (1:1)

### System

* **Descrição:**
Armazena todos os sitemas estelares do banco de dados.

* **Motivo da existência:**
Criar um relacionamento entre todos os corpos celestes do banco de dados permitindo que haja diferenças entre a localização de cada um. Determinadas estrelas estão em um sistema e determinadas estrelas estão em outro sistema.

* **Relacionamentos:**

  - System (0:N) - Star (1:1)
  - System (0:N) - BrownDwarf (1:1)
 
 ### PlanetAtmosphere

 * **Descrição:**
Tabela de relacionamento entre Planet e Atmosphere, também a armazena a porcentagem de cada elemento da atmosfera do planeta.

* **Motivo da existência:**
Um planeta pode não possuir uma atmosféra ou pode possuir uma atmosfera com vários elementos e uma atmosfera pode não estar em nenhum planeta ou pode estar em vários.

### MoonAtmosphere

* **Descrição:**
Tabela de relacionamento entre Moon e Atmosphere, também armazena a porcentagem de cada elemento da atmosfera da lua.

* **Motivo da existência:**
Uma lua pode não possuir nenhuma atmosfera ou pode possuir uma atmosfera com vários elementos e uma atmosfera pode não estar em nenhuma lua ou pode estar em várias.

### PlanetRing

* **Descrição:**
Tabela de relacionamento entre Planet e Ring

* **Motivo da existência:**
Um planeta pode não possuir anéis ou pode possuir diversos anéis e um anel pode não estar associado a um planeta ou pode estar associado a vários planetas.

### MoonRing

* **Descrição:**
Tabela de relacionamento entre Moon e Ring

* **Motivo da existência:**
Uma lua pode não possuir anéis ou pode possuir diversos anéis e um anel pode não estar associado a nenhuma lua ou pode estar associado a várias luas.

### BrownDwarfRing

* **Descrição:**
Tabela de relacionamento entre BrownDwarf e Ring

* **Motivo da existência:**
Uma anã marrom pode não possuir anéis ou pode possuir diversos anéis e um anel pode não estar associado a uma anã marrom ou pode estar associado a várias.

### PlanetStar

* **Descrição:**
Tabela de relacionamento entre Planet e Star

* **Motivo da existência:**
Um planeta pode orbitar nenhuma ou várias estrelas e uma estrela pode ter nenhum ou vários planetas a orbitando.

### BrownDwarfPlanet

* **Descrição:**
Tabela de relacionamento entre BrownDwarf e Planet

* **Motivo da existência:**
Uma anã marrom pode ter vários planetas ou nenhum planeta a orbitando e um planeta pode orbital várias ou nenhuma anã marrom.

### BrownDwarfStar

* **Descrição:**
* Tabela de relacionamento entre BrownDwarf e Star

* **Motivo da existência:**
Uma anã marrom pode orbitar várias ou nenhuma estrela e uma estrela pode ter várias ou nenhuma anã marrom a orbitando.
