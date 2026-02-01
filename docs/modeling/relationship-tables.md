## Relationship Tables

During the database modeling, a high variation in attributes combination for each celestial body was intended, planets, moons, and stars; as result, need of relationship tables arose.
 - The atmosphere relationship tables, allowing more detailed information about the atmosphere of each body, not only the most commom element on each one.
 - The rings relationship tables, allowing each celestial body to have more than one ring, each ring with distict composition.
 - The star relationship tables, allowing a body to orbit more than one star, not limiting it to simplicity.

First normal form was applied to prevent the existence of composite or multivalued values.
Second normal form was applied to ensure that all values in a table are fully dependent on the primary key of that table, preventing partial dependencies.
Third normal form was applied to prevent any non-key valeu from being dependent on another non-key value.

Attributes that did not have a N:N relationship with any table were not changed during the normalization steps.
