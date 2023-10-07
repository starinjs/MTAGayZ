tent_counter = 0
function onPlayerPitchATent (itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	triggerClientEvent(source,"onPlayerActionPlaySound",source,"tent")
	setPedAnimation (source,"BOMBER","BOM_Plant",5000,false,false,nil,false)
	local source = source
	setTimer( function ()		
			local x,y,z = getElementPosition(source)
			local xr,yr,zr = getElementRotation(source)
			px, py, pz = getElementPosition(source)
			prot = getPedRotation(source)
			local offsetRot = math.rad(prot+90)
			local vx = px + 5 * math.cos(offsetRot)
			local vy = py + 5 * math.sin(offsetRot)
			local vz = pz + 2
			local vrot = prot+180
			tent = createObject(3243,vx,vy,z-1,0,0,vrot)
			setObjectScale(tent,1.3)
			tentCol = createColSphere(x,y,z,4)
			attachElements ( tentCol, tent, 0, 0, 0 )
			setElementData(tentCol,"parent",tent)
			setElementData(tent,"parent",tentCol)
			setElementData(tentCol,"tent",true)
			setElementData(tentCol,"vehicle",true)
			setElementData(tentCol,"MAX_Slots",100)
			triggerClientEvent(source,"refreshInventoryManual",source)
			tent_counter = tent_counter+1
			setElementID(tentCol,tostring(getPlayerName(source)).."_"..tent_counter)
	end,1500,1)			
end
addEvent("onPlayerPitchATent",true)
addEventHandler("onPlayerPitchATent",getRootElement(),onPlayerPitchATent)

function onPlayerBuildAWireFence (itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	setPedAnimation (source,"BOMBER","BOM_Plant",1300,false,false,nil,false)
	local source = source
	setTimer( function ()				
			local x,y,z = getElementPosition(source)
			local xr,yr,zr = getElementRotation(source)
			--outputChatBox(zr)
			px, py, pz = getElementPosition(source)
			prot = getPedRotation(source)
			local offsetRot = math.rad(prot+90)
			local vx = px + 1 * math.cos(offsetRot)
			local vy = py + 1 * math.sin(offsetRot)
			local vz = pz + 2
			local vrot = prot+90
			--local x,y = getPointFromDistanceRotation(x,y,5,0)
			tent = createObject(983,vx,vy,pz,xr,yr,vrot)
			setObjectScale(tent,1)
			tentCol = createColSphere(x,y,z,2)
			setElementData(tentCol,"owner",getAccountName(getPlayerAccount(source)))
			attachElements ( tentCol, tent, 0, 0, 0 )
			setElementData(tentCol,"parent",tent)
			setElementData(tent,"parent",tentCol)
			setElementData(tentCol,"wirefence",true)
			triggerClientEvent(source,"refreshInventoryManual",source)
	end,1500,1)			
end
addEvent("onPlayerBuildAWireFence",true)
addEventHandler("onPlayerBuildAWireFence",getRootElement(),onPlayerBuildAWireFence)

function removeWirefence (object)
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
end
addEvent("removeWirefence",true)
addEventHandler("removeWirefence",getRootElement(),removeWirefence)

function removeTent (object)
	setPedAnimation (source,"BOMBER","BOM_Plant",5000,false,false,nil,false)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Tent")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
end
addEvent("removeTent",true)
addEventHandler("removeTent",getRootElement(),removeTent)

function onPlayerMakeAFire (itemName)
	setElementData(source,"Wood Pile",getElementData(source,"Wood Pile")-1)
	local x,y,z = getElementPosition(source)
	local xr,yr,zr = getElementRotation(source)
	px, py, pz = getElementPosition(source)
	prot = getPedRotation(source)
	local offsetRot = math.rad(prot+90)
	local vx = px + 1 * math.cos(offsetRot)
	local vy = py + 1 * math.sin(offsetRot)
	local vz = pz + 2
	local vrot = prot+90
	--local x,y = getPointFromDistanceRotation(x,y,5,0)
	local wood = createObject(2694,vx,vy,pz-0.75,xr,yr,vrot)
	setObjectScale(wood,1.5)
	setElementCollisionsEnabled(wood, false)
	setElementFrozen (wood,true)
	local fire = createObject(3525,vx,vy,pz-0.75,xr,yr,vrot)
	setObjectScale(fire,0)
	local fireCol = createColSphere(x,y,z,2)
	setElementData(fireCol,"parent",wood)
	setElementData(fire,"parent",fireCol)
	setElementData(fireCol,"fireplace",true)
	setElementData(fire,"x",vx)
	setElementData(fire,"y",vy)
	setElementData(fire,"z",pz-0.75)
	triggerClientEvent(source,"refreshInventoryManual",source)
	triggerClientEvent("playCampfireSound",fire)
	setPedAnimation (source,"BOMBER","BOM_Plant",1300,false,false,nil,false)
	setTimer(function()
		triggerClientEvent("stopCampfireSound",fire)
		destroyElement(fireCol)
		destroyElement(fire)
		destroyElement(wood)
	end,120000,1)
end
addEvent("onPlayerMakeAFire",true)
addEventHandler("onPlayerMakeAFire",getRootElement(),onPlayerMakeAFire)

function onPlayerPlaceRoadflare (itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	local x,y,z = getElementPosition(source)
	local object = createObject(354,x,y,z-0.6)
	setTimer(destroyElement,300000,1,object)
	triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerPlaceRoadflare",true)
addEventHandler("onPlayerPlaceRoadflare",getRootElement(),onPlayerPlaceRoadflare)

elementBackpack = {}
function onPlayerEquipBackpack(itemName)
	local backpack_item = 0
	local backpack_weapons = 0
	if elementBackpack[source] and isElement(elementBackpack[source]) then
		detachElementFromBone(elementBackpack[source])
		destroyElement(elementBackpack[source])
		elementBackpack[source] = false
	end
	local x,y,z = getElementPosition(source)
	local rx,ry,rz = getElementRotation(source)
	if itemName == "Assault Pack (ACU)" then
		backpack_item = gameplayVariables["assaultpack_slots"]
		backpack_weapons = gameplayVariables["assaultpack_gunslots"]
		elementBackpack[source] = createObject(1644,x,y,z) -- Assault Pack (ACU)
	elseif itemName == "Czech Vest Pouch" then
		backpack_item = gameplayVariables["czechvest_slots"]
		backpack_weapons = gameplayVariables["czechvest_gunslots"]
		elementBackpack[source] = createObject(1248,x,y,z) -- Czech Vest Pouch
	elseif itemName == "ALICE Pack" then
		backpack_item = gameplayVariables["alice_slots"]
		backpack_weapons = gameplayVariables["alice_gunslots"]
		elementBackpack[source] = createObject(2382,x,y,z) -- ALICE Pack
	elseif itemName == "Survival ACU" then
		backpack_item = gameplayVariables["survival_slots"]
		backpack_weapons = gameplayVariables["survival_gunslots"]
		elementBackpack[source] = createObject(1314,x,y,z) -- Survival ACU
	elseif itemName == "British Assault Pack" then
		backpack_item = gameplayVariables["britishassault_slots"]
		backpack_weapons = gameplayVariables["britishassault_gunslots"]
		elementBackpack[source] = createObject(1318,x,y,z) -- British Assault Pack
	elseif itemName == "Backpack (Coyote)" then
		backpack_item = gameplayVariables["coyote_slots"]
		backpack_weapons = gameplayVariables["coyote_gunslots"]
		elementBackpack[source] = createObject(1252,x,y,z) -- Backpack (Coyote)
	elseif itemName == "Czech Backpack" then
		backpack_item = gameplayVariables["czech_slots"]
		backpack_weapons = gameplayVariables["czech_gunslots"]
		elementBackpack[source] = createObject(1575,x,y,z) -- Czech Backpack
	else
		elementBackpack[source] = createObject(3026,x,y,z) -- Patrol Pack
		backpack_item = 8
		backpack_weapons = 1
	end
	if itemName == "Czech Backpack" then
		attachElementToBone(elementBackpack[source],source,3,0,-0.16,0.05,270,0,180)
	else
		attachElementToBone(elementBackpack[source],source,3,0,-0.225,0.05,90,0,0)
	end
	if getElementData(source,itemName) > 0 then
		setElementData(source,itemName,getElementData(source,itemName)-1)
	end
	playerStatusTable[source]["Backpack_Slots"] = backpack_item -- Not in use
	playerStatusTable[source]["Backpack_Item_Slots"] = backpack_item -- Not in use
	playerStatusTable[source]["Backpack_Weapon_Slots"] = backpack_weapons -- Not in use
	playerStatusTable[source]["MAX_Slots"] = backpack_item
	triggerEvent("onPlayerRetrieveStatusInfo",source,"MAX_Slots",playerStatusTable[source]["MAX_Slots"])
end
addEvent("onPlayerEquipBackpack",true)
addEventHandler("onPlayerEquipBackpack",root,onPlayerEquipBackpack)

-- Needs rework
function updateTotalKills()
	for i, player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			local zombieskilled = getElementData(player,"zombieskilled")
			local murders = getElementData(player,"murders")
			setElementData(player,"totalkills",zombieskilled+murders)
		end
	end
end
--setTimer(updateTotalKills,3000,0)

function antiWaterGlitch()
   if isElementInWater(source) then
      local x, y, z = getElementPosition(source)
      setElementPosition(source, x, y, z+5)
   end
end
addEventHandler("onPlayerQuit", root, antiWaterGlitch)

function changeWeaponMagSize()
	for i, data in ipairs(weaponMagSize) do	
		if playerStatusTable[source]["currentweapon_"..data[1]] == data[2] then
			setWeaponProperty(data[3],"poor","maximum_clip_ammo",data[4])
			setWeaponProperty(data[3],"std","maximum_clip_ammo",data[4])
			setWeaponProperty(data[3],"pro","maximum_clip_ammo",data[4])
		end
	end
end
addEventHandler("onPlayerWeaponSwitch",root,changeWeaponMagSize)
