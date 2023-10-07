function animalDamage(attacker,weapon)
	if attacker == getLocalPlayer() then
		if getElementData(source,"animal") then
			if weapon and weapon > 1 then
				triggerServerEvent("createDeadAnimal",source)
			end
		end
	end	
end
addEventHandler("onClientPedDamage",root,animalDamage)