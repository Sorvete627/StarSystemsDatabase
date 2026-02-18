"""
Projetc: Star System Database
Author: Pedro Henkels

Purpose: 
-  Use the EDSM public API to insert data in SQL Server database
-  Filter only brown dwarf sub type bodies
-  Map the brown dwarf types from the API to the types registered in the database
"""


import pyodbc
import requests

#EDSM API endpoint responsable to return the celestial bodies on a system
url = "https://www.edsm.net/api-system-v1/bodies"

systems = ["ETA CARINAE", "P CARINAE", "BLEIA DRYIAE XJ-R E4-1", "BD-13 842", "BD-14 5523", "BLEAE THAA AA-A H0", "BLEIA DRYIAE HK-Y C17-9","BLO THAE LC-V D2-0",
    "BLU EUQ QO-M B48-8", "BLU EUQ WM-W D1-118", "BLU THUA MN-G B38-4", "BUBBLE SECTOR DL-Y D103", "BUBBLE SECTOR DL-Y D34", "BUBBLE SECTOR PD-S B4-2", "CD-23 13397",
    "CD-26 1339", "CSI+19-20201","CSI+46-20087", "CSI+61-22385", "EOCH FLYUAE PY-R E4-684", "NGC 6231 SECTOR JC-V D2-44", "EZ ORIONIS", "GCRV 2334", "GCRV 715",
    "HD 36920", "HEART SECTOR IR-V B2-0", "HEN 2-215", "HEN 2-65", "HIP 100915", "HIP 48097", "HIP 58670", "HIP 87621", "IC 1805 SECTOR DQ-Y E3",
    "IC 2602 SECTOR DB-X D1-19", "IC 2602 SECTOR PT-Q B5-12", "IC 2602 SECTOR RJ-P B6-11", "IC 2602 SECTOR RJ-P B6-12", "IC 2602 SECTOR YU-Y D21",
    "MUSCA DARK REGION BL-W B2-5", "MUSCA DARK REGION EQ-Y C19", "NGC 40 STAR", "PRAEA EUQ KC-E B53-3", "PRO EURL AQ-G D10-4",
    "PRU EUQ LW-E D11-90", "RUNNING MAN SECTOR EB-X C1-15", "SCHEAU PRAO AW-V E2-53", "SCHEAU PRAO AW-V E2-8891", "SIFI HV-Y D15", "SLEGI PG-W A111-3", "THE VEIL",
    "THEOTOKOS", "TRAIKEE FT-E C26-6", "V947 SCORPII", "SOL"]

#SQL Server connection string with Windows Autentication
connection_string = (
    "DRIVER=ODBC Driver 18 for SQL Server;"
    "SERVER=PCZAODOSORVETE\\MSSQLSERVER17;"
    "DATABASE=StarSystem;"
    "Trusted_connection=yes;"
    "TrustServerCertificate=yes;")

connect = pyodbc.connect(connection_string)
cursor = connect.cursor()
print("Conexao feita!")

#SQL command to insert a brown dwarf in the table Star
command = """INSERT INTO BrownDwarf (BrownDwarfName, IdStarSystem, IdBrownDwarfType, IsPrimary)
                    VALUES (?,?,?,?)"""

for system in systems:
    params = {
        "systemName" : system}

    response =  requests.get(url, params = params)

    if response.status_code == 200:
        data = response.json()

    filtered = []

  #Filter only brown dwarfs
    for item in data["bodies"]:
        if "Brown" in item.get("subType"):
            filtered.append(item)

    starsystemlist = """ SELECT * FROM StarSystem"""
    cursor.execute(starsystemlist)
    starsystems = cursor.fetchall()


    DB_STARSYSTEMNAME_ID_MAP = {
        starsystem.StarSystemName : starsystem.IdStarSystem
        for starsystem in  starsystems}

    browndwarftypelist = """ SELECT * FROM BrownDwarfType"""
    cursor.execute(browndwarftypelist)
    types = cursor.fetchall()

    API_BROWNDWARFTYPENAME_DB_MAP = {
        item.BrownDwarfTypeName.casefold() : item.IdBrownDwarfType
        for item in types}

  #List to store ready tuples for batch insert
    rows = []

    for browndwarf in filtered:
        db_idstarsystem = DB_STARSYSTEMNAME_ID_MAP.get(system)
        db_idbrowndwarftype = API_BROWNDWARFTYPENAME_DB_MAP[browndwarf.get("subType").casefold()]

        rows.append((
           browndwarf.get("name"),
           db_idstarsystem,
           db_idbrowndwarftype,
           browndwarf.get("isMainStar")))


    if rows:
#Batch insert for better perforamnce
#Avoid multiples individual INSERT
        cursor.executemany(command, rows)
        cursor.commit()
    else:
        print("Nenhum registro para inserir")

print("Dados inseridos")

cursor.close()
connect.close()

print("Conexao encerrada")
