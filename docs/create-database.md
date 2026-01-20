## Overview

This document contains an explanation of the decisions made in the database creation code, including, file structure, initial database size and growth strategy.

### - File structure

The database uses only one data file (.mdf) and one transaction log file (.ldf).
Only one of each was chosen due to the small size of the database and its educational nature.

### - File location

The data and transaction log files are stored in dedicated directories. Furthermore, the log file is stored on a different disk than the main file to simulate real-world organization and improve performance by separating sequential log writing from random data access.

### - Initial size

The initial size of 128MB for the .mdf and .ldf files was chosen to prevent a constant increase in size during the initial stages of the database, especially during data insertion. Even though this size is larger than strictly necessary for this database, the storage cost is negligible.

### - Auto-growth

The automatic growth of files was defined as fixed values ​​instead of percentages in order to make growth more predictable and avoid excessive fragmentation.

### - Other parameters

Any other parameters not specified in the code, such as collation and recovery model, were set to the default value of Microsoft SQL Server 2025.
