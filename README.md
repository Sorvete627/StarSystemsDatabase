# StarSystemsDatabase

## Overview

In this repository, i keep track of the creation, since data modeling, development and administration of a database, personally developed, about star systems. Sharing all my knowledge and learning about **database administration, T-SQL, SQL Server** and much more!

## Goal

With this project i expect to show my hard skills in data manipulation and database administration in order to serve as a great evaluation to anyone interested in my knowledge.<br>
Being part of my portfolio to enter the database carrers path.

## Data Stored

The purpose of this database is to store various information about fictional star systems, from the composition of a celestial body's ring to the types of stars present in each system. The data source is a space simulator called Elite Dangerous, which is why some entities have a high level of detail in the stored data, such as the percentage of each element in a planet's atmosphere.

## Main tables

- Planet
- Moon
- BrownDwarf
- Star
- Atmosphere<br>

See [Data Dictionary](/docs/data-dictionary.md) and [Tables Explanation](docs/modeling/tables-explanation.md) for all table's detail.

## Business Rules

This database has database level business rules ensured by triggers, checks and composite primary keys.<br>
See [Business Rules](/docs/business-rules.md) for a complete list and technical details.

## How to run

1. [Create Database](/schema/01_create_database.sql)
2. [Create Tables](/schema/02_create_table.sql)
3. [Create Triggers](/schema/03_create_trigger.sql)

![Entity Relationship Diagram](docs/modeling/erd-image.png)


