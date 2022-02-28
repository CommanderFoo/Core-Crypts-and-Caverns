Game.playerJoinedEvent:Connect(function(player)
	Task.Wait()
	player:ActivateFlying()
end)

Input.actionPressedEvent:Connect(function(player, action)
	if(action == "Toggle Flying") then
		if(player.isFlying) then
			player:ActivateWalking()
		else
			player:ActivateFlying()
		end
	end
end)