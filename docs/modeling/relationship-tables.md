## English

### Relationship Tables

During the database modeling, a high variation in attributes combination for each celestial body was intended, planets, moons, and brown dwarf; as result, need of relationship tables arose.
 - The atmosphere relationship tables, allowing more detailed information about the atmosphere of each body, not only the most commom element on each one.
 - The rings relationship tables, allowing each celestial body to have more than one ring, each ring with distict composition.
 - The star relationship tables, allowing a body to orbit more than one star, not limiting it to simplicity.
 - The brown dwarf relationship, allowing celestial bodies to orbit it.

Attributes that did not have a N:N relationship with any table were not changed during the normalization steps.

## Português (Brasil)

### Tabelas Relacionamento

Durante a modelagem do banco de dados foi procurado permitir grande varição das combinações de atributos de cada corpo, planeta, lua e anã marrom; com isso, foi criada a necessidade de tabelas relacionamento.
  - As de atmosfera, permitindo informações mais detalhadas sobre a atmosfera de cada corpo, não apenas o elemento mais presente.
  - As de anéis, permitindo que cada corpo possua vários anéis e cada um com composições diferentes.
  - As de estrela, permitindo que um corpo orbite mais de uma estrela, não se limitando na simplicidade.
  - As de anã marrom, permitindo que anãs marroms possuam corpos a orbitando.

Atributos que não exerciam um relacionamento N:N com alguma tabela não sofreram alterações durante as etapas de normalização.
