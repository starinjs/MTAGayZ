--Disallow blocking attacks
addEventHandler("onClientRender", root,
function()
	if getPedControlState(localPlayer,"aim_weapon") and getPedControlState(localPlayer,"jump") then
		setPedControlState(localPlayer,"jump",false)
	end
	if not isPlayerInsideSafeZone then
		if getPedWeapon(localPlayer) == 0 then
			toggleControl("fire",false)
			toggleControl("aim_weapon",false)
		else
			toggleControl("fire",true)
			toggleControl("aim_weapon",true)
		end
	end
end)
