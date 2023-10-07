function kickPlayerOnHighPing ()
	if gameplayVariables["pingkick"] then
		outputChatBox (getPlayerName(source).." was kicked due to high ping!",getRootElement(),255,0,0,true)	
		kickPlayer(source,"Your ping was too high!")
	end
end
addEvent("kickPlayerOnHighPing",true)
addEventHandler("kickPlayerOnHighPing",root,kickPlayerOnHighPing)