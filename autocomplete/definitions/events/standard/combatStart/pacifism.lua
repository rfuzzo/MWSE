
---@param actor tes3mobileActor
local function isPacifistTarget(actor)
	-- Here you can filter if the actor should initiate combat with the player.
	-- ...
end

--- @param e combatStartEventData
local function forcedPacifism(e)
	if (e.target == tes3.player and isPacifistTarget(e.actor)) then
		return false
	end
end
event.register(tes3.event.combatStart, forcedPacifism)