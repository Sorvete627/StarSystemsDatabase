## English

### Business Rules

- A single moon can only orbit a single celestial body. (CHECK necessary)
- A brown dwarf is not a planet, neither a star or moon.
- A moon can only orbit a brown dwarf if it is not considered primary. (TRIGGER necessary)
- A celestial body atmosphere can be composed by different elements, but the sum of the amount present of them can't be more than 100%. (TRIGGER necessary)
- A planet can only orbit two or more stars if all are from the same system. (TRIGGER necessary)
- A planet can only orbit two or more brown dwarfs if all are from the same system. (TRIGGER necessary)
- A brown dwarf can only orbit a star if the brown dwarf is not considered primary. (TRIGGER necessary)
- A brown dwarf can only orbit two or more stars if all are from the same system. (TRIGGER necessary)
- A atmosphere element can not be present twice in the same planet. It would allow data redundancy and inconsistency. (Composite primary key necessary)

---

## Português (Brasil)

### Regras de Negócio

- Uma única lua só pode orbitar um único corpo celeste. (CHECK necessário)
- Uma anã marrom não é nem um planeta, nem uma estrela e nem uma lua.
- Uma lua só pode orbitar uma anã marrom se a anã marrom não for considerada primária. (TRIGGER necessário)
- A atmosfera de um corpo pode ser composta por diversos elemento, mas a soma da quantidade presente deles não pode ser mais do que 100%. (TRIGGER necessário)
- Um planeta só pode orbitar duas ou mais estrelas se todas estiverem no mesmo sistema. (TRIGGER necessário)
- Um planeta só pode orbitar duas ou mais anãs marrons se todas estiverem no mesmo sistema e ambas forem consideradas primárias. (TRIGGER necessário)
- Uma anã marrom só pode orbitar uma estrela se a anã marrom não for considerada primária. (TRIGGER necessário)
- Uma anã marrom só pode orbitar duas ou mais estrelas se todas estiverem no mesmo sistema. (TRIGGER necessário)
- Um elemento da atmosfera não pode se repetir no mesmo corpo. Isso permitiria duplicatas e inconsistência de dados. (Chave primária composta necessária)
