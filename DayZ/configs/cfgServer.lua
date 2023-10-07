shownInfos["nomag"] = "No ammo left for this weapon!"
shownInfos["youconsumed"] = "You consumed"
shownInfos["needwatersource"] = "You have to be inside a body of water!"
shownInfos["filledup"] = "You filled your Water Bottle up!"
shownInfos["noradio"] = "You have no Radio Device!"
	
--GAMEPLAY
gameplayVariables["zombieblood"] = 4500 -- Zombie Blood/Health - DEFAULT: 4500
gameplayVariables["loseWire"] = 1000 -- Amount of losing blood when hitting a Wirefence that's not yours - DEFAULT: 1000
gameplayVariables["playerzombies"] = 6 -- At what amount of zombies should they respawn? - DEFAULT: 6
gameplayVariables["amountzombies"] = 3 -- How often should the script iterate through zombie spawning (= how many zombies should spawn)? - DEFAULT: 3
gameplayVariables["temperaturewater"] = -0.1 -- Amount of temperature to be lost when in water - DEFAULT: -0.01
gameplayVariables["temperaturesprint"] = 0.005 -- Amount of temperature to be gained when sprinting - DEFAULT: 0.005
gameplayVariables["itemrespawntimer"] = 14400000 -- Number of milliseconds that should elapse before the items will respawn - DEFAULT: 14400000
gameplayVariables["autostartaddons"] = true -- Allow the gamemode to autostart resources with addon_ prefix
gameplayVariables["enableprone"] = true --Whether or not prone is enabled for players - DEFAULT: true
gameplayVariables["respawnwarning"] = true -- Should the warning "BEWARE OF MASSIVE LAG" when items are being respawned be displayed? If set to true, warning will be displayed. - DEFAULT: true
gameplayVariables["fuelEnabled"] = true -- Is the vehicle fuel enabled? - DEFAULT: true
gameplayVariables["realtime"] = false -- Enables/Disables real time use. When set to false, gameplayVariables["customtime"] is in effect - DEFAULT: false
gameplayVariables["customtime"] = 10000 -- How long should an ingame minute be (in ms)? Example: 10000ms (10s) realtime = 1 minute gametime - DEFAULT: 10000
gameplayVariables["pingkick"] = true -- Should the ping kicker be enabled? - DEFAULT: true
gameplayVariables["maxzombiesglobal"] = 600 -- Not in use
gameplayVariables["maxPetrolFuelAmount"] = math.random(1,15) -- Determines amount of fuel each petrol station in the world contains - DEFAULT: math.random(1,15)
gameplayVariables["spawnselection"] = false -- Allow player to select his spawnpoint - DEFAULT: false
gameplayVariables["explodedvehiclesrespawn"] = 1800000 -- When should exploded vehicles respawn? - DEFAULT: 1800000 (= 30 Min)
gameplayVariables["watervehiclerespawn"] = 1800000 -- When should vehicles which are submerged in water respawn? - DEFAULT: 1800000 (= 30 Min)
gameplayVariables["zombiedamage"] = 650 -- Damage done by zombies - DEFAULT: 650

-- EXPERIMENTAL FEATURES
gameplayVariables["newzombiespawnsystem"] = false -- Experimental feature, zombies only spawn near loot - DEFAULT: false
gameplayVariables["zombiespawnradius"] = 20 -- If newzombiespawnsystem is set to true, determines the radius where zombies spawn around loot - DEFAULT: 20
gameplayVariables["maxzombiesperloot"] = 6 -- if newzombiespawnsystem is set to true, determines how many zombies should spawn around loot - DEFAULT: 6
gameplayVariables["MySQL"] = false -- if MySQL is set to true, MTA:DayZ will use MySQL to store accounts and items of players - DEFAULT: false
gameplayVariables["MySQL_host"] = "localhost" -- MySQL host IP, example: 127.0.0.1 or localhost
gameplayVariables["MySQL_port"] = "3306" -- MySQL port, example: 3306
gameplayVariables["MySQL_user"] = "root" -- MySQL user
gameplayVariables["MySQL_pass"] = "pass" -- MySQL pass
gameplayVariables["MySQL_DB"]   = "dayz" -- MySQL Database name
gameplayVariables["secret_key"]   = "^^XmakP9*31z{}ç';'" -- WARNING TO SERVERS OWNERS: CHANGE IT (before letting players register) TO ANY OTHER SECURE STRING
	
-- SERVER BACKUP
gameplayVariables["backupenabled"] = true -- Whether or not backup should be enabled. Backup = saves all tents, accounts & vehicles. - DEFAULT: true - Set to false to disable backup.
gameplayVariables["backupinterval"] = 3600000 -- Number of milliseconds that should elapse before backup. Minimum: 50. - 1000 milliseconds = 1 second. - DEFAULT: 3600000ms (= 1 hour)

-- WEAPON SETTINGS
gameplayVariables["silencedDMRs"] = true

outputDebugString("[DayZ] cfgServer loaded")