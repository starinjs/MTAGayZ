-- PING CHECK
gameplayVariables["ping"] = 600 -- Checks if ping is over the set amount - DEFAULT: 600

-- DAMAGE
gameplayVariables["waterdamage"] = math.random(5500,7100) -- Damage dealt when drowning - DEFAULT: math.random(5500,7100)

-- MISC
gameplayVariables["craftableBandages"] = true -- Whether or not the server should ignore "newclothingsystem" state, thus spawning the new clothing items and allowing players to turn them into bandages.
gameplayVariables["enablenight"] = true -- Whether or not the night should be darker - DEFAULT: true
gameplayVariables["nightCheckInterval"] = 300000 -- Interval (in milliseconds) for client checking if it is currently night - DEFAULT: 300000
gameplayVariables["armachat"] = false -- Activates/deactivates ArmA II style chatbox - DEFAULT: false
gameplayVariables["debugmonitorenabled"] = true --Debug Monitor available to the players? DEFAULT: true

-- HEADSHOT MULTIPLIER
gameplayVariables["headshotdamage_player"] = 1.5 -- Multiplier for damage on head shot (player). DEFAULT: 1.5, EXAMPLE: damage*1.5
gameplayVariables["headshotdamage_zombie"] = 1.5 -- Multiplier for damage on head shot (zombies). DEFAULT: 1.5, EXAMPLE: damage*1.5
	
-- SOUND VOLUME
gameplayVariables["ambiencesoundvolume"] = 0.8 -- How loud ambience sounds should be. Set to 0 to disable, max is 1.0. - DEFAULT: 0.8

outputDebugString("[DayZ] cfgClient loaded")
