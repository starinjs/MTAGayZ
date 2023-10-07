function makeAnimalsMove()
	for i,ped in ipairs(getElementsByType("ped")) do
		if getElementData(ped,"animal") and not getElementData(ped,"deadman") then
			triggerEvent("onAnimalsMove",root,ped)
		end
    end
end
setTimer(makeAnimalsMove,5000,0)

function animalMovement(ped)
	local rotation = math.random(1,359)
	setPedRotation(ped,rotation)
	setPedAnimation (ped, "ped", "Player_Sneak", -1, true, true, true)
end
addEvent("onAnimalsMove",true)
addEventHandler("onAnimalsMove",getRootElement(),animalMovement)