## English

### - Overview

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

## Português (Brasil)

### - Visão Geral

Este documento contém as explicações das decisões tomadas no código de criação do banco de dados, tais como, estrutura de arquivos, tamanho inicial do banco e taxa de crescimento.

### - Estrutura de arquivos

O banco de dados utiliza apenas um arquivo de dados(.mdf) e um arquivo de log de transações(.ldf).
Apenas um de cada foi escolhido devido ao pequeno tamanho do banco de dados e sua natureza educacional.

### - Localização dos arquivos

Os arquivos de dados e de log de transações são armazeanados em diretórios dedicados, além disso, o arquivo de log foi armazenado em um disco diferente do arquivo principal, para simular uma organização real e maior performance, separando a escrita sequencial de log do acesso aleatório de dados.

### - Tamanho inicial

O tamanho inicial de 128MB para os arquivos .mdf e .ldf foi escolhido para impedir o aumento constante de tamanho nos estágios iniciais do banco de dados, principalmente durante a inserção de dados. Mesmo este tamanho sendo maior se comparado com o estritamente necessário para este banco de dados, o custo de armazenamento é insignificante.

### - Crescimento automático

O crestimento automático dos arquivos foi defino em valores fixos ao invés de porcentagem com o objetivo de tornar o crescimento mais preditivo e evitar fragmentação excessiva.

### - Outros parâmetros

Qualquer outro parâmetro não especificado no código, como ordenação e modelo de recupeção, foi definido com o valor padrão do Microsoft SQL Server 2025.
