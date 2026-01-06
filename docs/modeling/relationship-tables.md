## English

### Relationship Tables

During the database modeling, a high variation in attributes combination for each celestial body was intended, planets, moons, and brown dwarf; as result, need of relationship tables arose.
 - The atmosphere relationship tables, allowing more detailed information about the atmosphere of each body, not only the most commom element on each one.
 - The rings relationship tables, allowing each celestial body to have more than one ring, each ring with distict composition.
 - The star relationship tables, allowing a body to orbit more than one star, not limiting it to simplicity.
 - The brown dwarf relationship, allowing celestial bodies to orbit it.

First normal form was applied to prevent the existence of composite or multivalued values.
Second normal form was applied to ensure that all values in a table are fully dependent on the primary key of that table, preventing partial dependencies.
Third normal form was applied to prevent any non-key valeu from being dependent on another non-key value.


Attributes that did not have a N:N relationship with any table were not changed during the normalization steps.

## Português (Brasil)

### Tabelas Relacionamento

Durante a modelagem do banco de dados foi procurado permitir grande varição das combinações de atributos de cada corpo, planeta, lua e anã marrom; com isso, foi criada a necessidade de tabelas relacionamento.
  - As de atmosfera, permitindo informações mais detalhadas sobre a atmosfera de cada corpo, não apenas o elemento mais presente.
  - As de anéis, permitindo que cada corpo possua vários anéis e cada um com composições diferentes.
  - As de estrela, permitindo que um corpo orbite mais de uma estrela, não se limitando na simplicidade.
  - As de anã marrom, permitindo que anãs marroms possuam corpos a orbitando.

A primeira forma normal foi aplicada para impedir a existência de valores compostos ou multivalorados.
A segunda forma normal foi aplicada para garantir que todos os valores de uma tabela sejam inteiramente dependentes da chave primária desta tabela, impedindo dependencias parciais.
A terceira forma normal foi aplicada para impedir que qualquer valor não-chave seja dependente de outro valor não-chave.
