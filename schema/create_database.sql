/*
File: 01_create_database.sql
Project: Star Systems Database
Description: Database creation code
Author: Pedro Henkels
Date: 2026/01/07
*/
CREATE DATABASE StarSystem ON PRIMARY
(NAME = StarSystem,
FILENAME = 'C:\SQL\StarSystem\StarSystem.mdf',
SIZE = 128MB,
FILEGROWTH = 64MB)
LOG ON 
(NAME = StarSystem_log,
FILENAME = 'E:\SQL\StarSystem\StarSystem.ldf',
SIZE = 128MB,
FILEGROWTH = 64MB)
GO
