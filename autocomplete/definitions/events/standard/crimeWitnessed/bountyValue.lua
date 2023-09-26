
--- This function will return the bounty aquired after a certain
--- crime has been commited. To be used with crimeWitnessed event.
---@param e crimeWitnessedEventData
---@return number bountyValue
local function getBountyValue(e)
	if e.type == "theft"
	or e.type == "stealing" then
		-- Calculate the bounty value for thefts. The default value for fCrimeStealing
		-- is 1, so with vanilla settings it doesn't make a difference, but players
		-- might have mods that alter this GMST, so we need to take it into account.
		return e.value * tes3.findGMST(tes3.gmst.fCrimeStealing).value --[[@as number]]

	elseif e.type == "attack" then
		return tes3.findGMST(tes3.gmst.iCrimeAttack).value --[[@as number]]

	elseif e.type == "killing" then
		return tes3.findGMST(tes3.gmst.iCrimeKilling).value --[[@as number]]

	elseif e.type == "pickpocket" then
		return tes3.findGMST(tes3.gmst.iCrimePickPocket).value --[[@as number]]

	elseif e.type == "trespass" then
		return tes3.findGMST(tes3.gmst.iCrimeTrespass).value --[[@as number]]

	elseif e.type == "werewolf" then
		return tes3.findGMST(tes3.gmst.iWerewolfBounty).value --[[@as number]]
	end

	return 0
end

---@param e crimeWitnessedEventData
local function onCrimeWitnessed(e)
	local bounty = getBountyValue(e)
	-- ...
end
event.register(tes3.event.crimeWitnessed, onCrimeWitnessed)
