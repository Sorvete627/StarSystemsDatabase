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
- A planet can not orbit a brown dwarf if it is not considered primary. (TRIGGER necessary)
- A atmosphere element can not be present twice in the same planet. It would allow data redundancy and inconsistency. (Composite primary key necessary)
