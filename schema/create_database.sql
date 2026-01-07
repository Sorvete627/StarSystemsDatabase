--Create database

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
