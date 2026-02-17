"""
Projetc: Star System Database
Author: Pedro Henkels

Purpose: 
-  Use the EDSM public API to insert data in SQL Server database
-  Filter only star type bodies (except brown dwarfs)
-  Map the star types from the API to the types registered in the database
"""

import requests
import pyodbc

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
    "Driver={ODBC Driver 18 for SQL Server};"
    "Server=PCZAODOSORVETE\\MSSQLSERVER17;"
    "Database=StarSystem;"
    "Trusted_Connection=yes;"
    "TrustServerCertificate=yes;")

connect = pyodbc.connect(connection_string)
cursor = connect.cursor()
print("Conexao feita!")

#SQL command to insert a star in the table Star
command = """INSERT INTO Star (StarName, IdStarType, IdSystem)
                VALUES (?,?,?);"""

for system in systems:
    params = {"systemName" : system}
    response = requests.get(url, params = params)

    if response.status_code == 200:
        data = response.json()
    
    stars = []

#Filter only stars, excluiding brown dwarfs
    for item in data["bodies"]:
        if item.get("type") == "Star" and "brown" not in item.get("subType","").casefold():
            stars.append(item)

    startypesql = """ SELECT * FROM StarType """
    cursor.execute(startypesql)
    startypelist = cursor.fetchall()
    
    DB_STARTYPE_ID_MAP = {
        startype.StarTypeName : startype.IdStarType
        for startype in startypelist}

    API_STARTYPE_MAP = {}

#Dictionary responsable for mapping the subtypes returned by the API
#to the corresponding IdStarType in the database.
#The API and the database have different names,
#therefore is necessary to normalize the values.
    for star in stars:
        apitype = star.get("subType", "").casefold()

        if "o (" in apitype or "o star" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("O (Blue-White) Star")
        elif "b (blue-white) star" in apitype or "b star" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("B (Blue-White) Star")
        elif "b (blue-white super" in apitype or "b super" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("B (Blue-White Super Giant) Star")
        elif "a (blue-white super" in apitype or "a super" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("A (Blue-White Super Giant) Star")
        elif "a (blue-white) star" in apitype or "a star" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("A (Blue-White) Star")
        elif "f (white) star" in apitype or "f star" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("F (White) Star")
        elif "f (white super" in apitype or "f super" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("F (White Super Giant) Star")
        elif "g (white-yellow)" in apitype or "g star" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("G (White-Yellow) Star")
        elif "g (white-yellow super" in apitype or "g super" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("G (White-Yellow Super Giant) Star")
        elif "k (yellow-orange) star" in apitype or "k star" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("K (Yellow-Orange) Star")
        elif "k (yellow-orange giant" in apitype or "k giant" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("K (Yellow-Orange Giant) Star")
        elif "m (red dwarf" in apitype or "m star" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("M (Red Dwarf) Star")
        elif "m (red giant" in apitype or "m giant" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("M (Red Giant) Star")
        elif "m (red super" in apitype or "m super" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("M (Red Super Giant) Star")
        elif "t tauri" in apitype or "t star" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("T Tauri Star")
        elif "herbig ae" in apitype or "herbig star" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("Herbig Ae/Be Star")
        elif "wolf-rayet star" in apitype or "wolf rayet star" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("Wolf-Rayet Star")
        elif "wolf-rayet n" in apitype or "wolf rayet n" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("Wolf-Rayet N Star")
        elif "wolf-rayet nc" in apitype or "wolf rayet nc" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("Wolf-Rayet NC Star")
        elif "wolf-rayet c" in apitype or "wolf rayet c" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("Wolf-Rayet C Star")
        elif "wolf-rayet o" in apitype or "wolf rayet o" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("Wolf-Rayet O Star")
        elif "carbon" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("Carbon Star")
        elif "ms-type" in apitype or "ms type" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("MS-Type Star")
        elif "s-type" in apitype or "s type" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("S-Type Star")
        elif "white dwarf" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("White Dwarf Star")
        elif "neutron" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("Neutron Star")
        elif "supermassive" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("Supermassive Black Hole")
        elif "black" in apitype:
            API_STARTYPE_MAP[apitype] = DB_STARTYPE_ID_MAP.get("Black Hole")

    starsystemsql = """ SELECT * FROM StarSystem"""
    cursor.execute(starsystemsql)
    starsystemlist = cursor.fetchall()

    DB_STARSYSTEMNAME_ID_MAP = {
        system.StarSystemName : system.IdStarSystem
        for system in starsystemlist}

#List to store ready tuples for batch insert
    rows = []

    for star in stars:
        apitype = star.get("subType", "").casefold()
        db_idstartype = API_STARTYPE_MAP.get(apitype)
        db_idstarsystem = DB_STARSYSTEMNAME_ID_MAP.get(system)

        rows.append((
        star.get("name"),
        db_idstartype,
        db_idstarsystem))
    

    if rows:
#Batch insert for better perforamnce
#Avoid multiples individual INSERT
        cursor.executemany(command, rows)
        connect.commit()
    else:
         print("Nenhum registro para inserir")


print("Dados inseridos")
        
cursor.close()
connect.close()

print("Conexao encerrada")
