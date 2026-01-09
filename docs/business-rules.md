## English

### Business Rules

- A single moon can only orbit a single celestial body. (CHECK necessary)
- A brown dwarf is not a planet, neither a star or moon.
- A moon can only orbit a brown dwarf if it is not considered primary
- A celestial body atmosphere can be composed by different elements, but the sum of the amount present of them can't be more than 100%. (CHECK necessary)
- A planet can only orbit two stars if both are from the same system. (TRIGGER necessary)
- A planet can only orbit two brown dwarfs if both are from the same system. (TRIGGER necessary)
- A brown dwarf can only orbit two stars if both are from the same system and the brown dwarf is not considered primary. (TRIGGER necessary)
- A atmosphere element can not be present twice in the same planet. It would allow data redundancy and inconsistency. (Composite primary key necessary)

---

## Português (Brasil)

### Regras de Negócio

- Uma única lua só pode orbitar um único corpo celeste. (CHECK necessário)
- Uma anã marrom não é nem um planeta, nem uma estrela e nem uma lua.
- Uma lua só pode orbitar uma anã marrom se a anã marrom não for considerada primária. (TRIGGER necessário)
- A atmosfera de um corpo pode ser composta por diversos elemento, mas a soma da quantidade presente deles não pode ser mais do que 100%. (CHECK necessário)
- Um planeta só pode orbitar duas estrelas se ambas estiverem no mesmo sistema. (TRIGGER necessário)
- Um planeta só pode orbitar mais de duas anãs marrons se ambas estiverem no mesmo sistema e ambas forem consideradas primárias. (TRIGGER necessário)
- Uma anã marrom só pode orbitar duas estrelas se ambas estiverem no mesmo sistema e se a anã marrom não for considerada primária. (TRIGGER necessário)
- Um elemento da atmosfera não pode se repetir no mesmo corpo. Isso permitiria duplicatas e inconsistência de dados. (Chave primária composta necessária)
