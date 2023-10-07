-- Settings
maxHealth = gameplayVariables["maxblood"]
maxFood = gameplayVariables["maxfood"]
maxThirst = gameplayVariables["maxthirst"]
maxSlots = gameplayVariables["maxslots"]

function checkHealth(source)
	local vHealth = playerStatusTable[source]["blood"] or 0
    if vHealth > maxHealth and not hasObjectPermissionTo ( source, "command.mute" ) then
		if gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 2 then
			playerStatusTable[source]["blood"] = 0
			banPlayer(source,false,false,true,"BattlDayZ","[BattlDayZ] Health Hack detected!",gameplayVariables["bantime"])
		elseif gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 1 then
			playerStatusTable[source]["blood"] = 0
			kickPlayer(source, "[BattlDayZ]: Health Hack detected!")
		end
    end
end

function checkFood(source)
    local vFood = playerStatusTable[source]["food"] or 0
    if vFood > maxFood and not hasObjectPermissionTo ( source, "command.mute" ) then
        if gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 2 then
			playerStatusTable[source]["food"] = 0
			banPlayer(source,false,false,true,"BattlDayZ","[BattlDayZ] Food Hack detected!",gameplayVariables["bantime"])
		elseif gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 1 then
			playerStatusTable[source]["food"] = 0
			kickPlayer(source, "[BattlDayZ]: Food Hack detected!")
		end
    end
end

function checkThirst(source)
    local vThirst = playerStatusTable[source]["thirst"] or 0
    if vThirst > maxThirst and not hasObjectPermissionTo ( source, "command.mute" ) then
		if gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 2 then
			playerStatusTable[source]["thirst"] = 0
			banPlayer(source,false,false,true,"BattlDayZ","[BattlDayZ] Thirst Hack detected!",gameplayVariables["bantime"])
		elseif gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 1 then
			playerStatusTable[source]["thirst"] = 0
			kickPlayer(source, "[BattlDayZ]: Thirst Hack detected!")
		end
	end
end

function checkSlots(source)
    local vSlots = playerStatusTable[source]["MAX_Slots"] or 0
    if vSlots > maxSlots and not hasObjectPermissionTo ( source, "command.mute" ) then
        if gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 2 then
			playerStatusTable[source]["MAX_Slots"] = 8
			banPlayer(source,false,false,true,"BattlDayZ","[BattlDayZ] Backpack Hack detected!",gameplayVariables["bantime"])
		elseif gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 1 then
			playerStatusTable[source]["MAX_Slots"] = 8
			kickPlayer(source, "[BattlDayZ]: Backpack Hack detected!")
		end
    end
end

function checkForCheats()
	if gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 0 then return end
	for i, players in ipairs(getElementsByType("player")) do
		if getElementData(players,"logedin") then
			if playerStatusTable[players] then
				checkHealth(players)
				checkFood(players)
				checkThirst(players)
				checkSlots(players)
			end
		end
	end
end
setTimer(checkForCheats,10000,0)

function banTeleport()
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup("Everyone")) and not hasObjectPermissionTo(source, "command.mute") then
		if gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 2 then
			banPlayer(source,false,false,true,"BattlDayZ","[BattlDayZ] Teleport Hack detected!",gameplayVariables["bantime"])
		elseif gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 1 then
			kickPlayer(source, "[BattlDayZ] Teleport Hack detected!")
		end
	end
end
addEvent("bantp",true)
addEventHandler("bantp",getRootElement(),banTeleport)

function logged()
setTimer(function(source)
	if hasObjectPermissionTo(source, "command.mute") then
		triggerClientEvent(source,"startANTItp",source,1)
	else
		triggerClientEvent(source,"startANTItp",source,2)
	end
end,1000,1,source)
end
addEventHandler("onPlayerSpawn",getRootElement(),logged)

function detectVehicleCheat(theVehicle, seat, jacked)
	if theVehicle then
		if ( getElementModel(theVehicle) == 432 or getElementModel(theVehicle) == 425 or getElementModel(theVehicle) == 501 or getElementModel(theVehicle) == 564 or getElementModel(theVehicle) == 594 or getElementModel(theVehicle) == 601 or getElementModel(theVehicle) == 447 or getElementModel(theVehicle) == 520 ) then
			if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(source)), aclGetGroup ( "Everyone" ) ) and not hasObjectPermissionTo ( source, "command.mute" ) then
				if gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 2 then
					banPlayer(source,false,false,true,"BattlDayZ","[BattlDayZ] Vehicle Hack detected!",gameplayVariables["bantime"])
				elseif gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 1 then
					kickPlayer(source, "[BattlDayZ]: Vehicle Hack detected!")
				end
			end
		end
	end
end
addEventHandler("onPlayerVehicleEnter", getRootElement(), detectVehicleCheat)

WeaponID = {
    [35] = true,
    [36] = true,
    [38] = true,
}

function detectWeaponCheat(previousWeaponID, currentWeaponID)
  if ( WeaponID[currentWeaponID] ) then
    if not hasObjectPermissionTo ( source, "command.mute" ) then
        if gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 2 then
			banPlayer(source,false,false,true,"BattlDayZ","[BattlDayZ] Weapon Hack detected!",gameplayVariables["bantime"])
		elseif gameplayVariables["securitylevel"] and gameplayVariables["securitylevel"] == 1 then
			kickPlayer(source, "[BattlDayZ]: Weapon Hack detected!")
		end
    end
  end
end
addEventHandler("onPlayerWeaponSwitch", getRootElement(), detectWeaponCheat)

local lossCount = {}
local isLosingConnection = false
function checkLoss()
	for i, v in ipairs(getElementsByType("player")) do
		if getElementData(v,"logedin") then
			local loss = getNetworkStats(v)["packetlossLastSecond"]
			if not lossCount[v] then
				lossCount[v] = 0
			end
			if loss > 80 then -- If we have packet loss then send message and add counter.
				if not isLosingConnection then
					isLosingConnection = true
					--triggerClientEvent("onPlayerIsLosingConnection",v,isLosingConnection)
					outputSideChat("Player "..string.gsub(getPlayerName(v), '#%x%x%x%x%x%x', '' ).." is losing connection",root,255,0,0)
				end
				lossCount[v] = lossCount[v] + 1
				if lossCount[v] >= gameplayVariables["packetlossmax"] then -- If counter is equal to gameplayVariables["packetlossmax"] or higher then reset counter and kick player
					lossCount[v] = nil
					kickPlayer(v, "[BattlDayZ]: Packet Loss detected")
				end
			else -- If packet loss was corrected then reset counter
				lossCount[v] = 0
				isLosingConnection = false
				--triggerClientEvent("onPlayerIsLosingConnection",v,isLosingConnection)
			end
		end
	end
end

if gameplayVariables["packetlosskick"] then -- Check boolean to see if we want to kick on packet loss
	setTimer(checkLoss,2000,0) -- Set timer to check every two seconds
end

function onQuitCheckForCombatLog(quitType)
	if gameplayVariables["combatlog"] then
		local time = getRealTime()
		local timeLeft = getElementData (source,"combattime")
		if timeLeft then
			if time.timestamp-timeLeft < 30 then
				local playerAccount = getPlayerAccount(source)
				if (playerAccount) then
					setAccountData(playerAccount,"blood",-5) -- Kill the player for combat logging
				end
			end
		end
	end
end
addEventHandler ("onPlayerQuit",root,onQuitCheckForCombatLog)

function protectedByBattlDayZ()
	setTimer(function(source) 
		outputChatBox("This server is protected by BattlDayZ (v1.2), an anticheat system.",source,255,0,0)
	end,2000,1,source)
end
addEventHandler("onPlayerLogin",root,protectedByBattlDayZ)

function onCombatNotifyServer(player)
	outputDebugString("[BattlDayZ] "..getPlayerName(player).." is in combat")
end
addEvent("onCombatNotifyServer",true)
addEventHandler("onCombatNotifyServer",root,onCombatNotifyServer)
