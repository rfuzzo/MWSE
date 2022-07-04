local timeBeforeTravel = 0
local payload = {}

---@param e calcTravelPriceEventData
local function travelStart(e)
	if (not tes3.mobilePlayer.traveling) then -- Get time before traveling
		timeBeforeTravel = tes3.getSimulationTimestamp()

	else -- Travel finished, but calcTravelPrice triggered once again.
		table.copy(e, payload)
		payload.claim = nil
		payload.hoursPassed = tes3.getSimulationTimestamp() - timeBeforeTravel
		payload.previousCell = tes3.mobilePlayer.cell
		timeBeforeTravel = 0

		-- calcTravelPrice event is triggered once for every possible destination on
		-- first opening of the Travel Menu. Once again after a destination has been
		-- selected, but before the player was teleported. This event is triggered
		-- after the player is teleported to the destination.
		timer.frame.delayOneFrame(function()
			payload.cell = tes3.mobilePlayer.cell
			event.trigger(tes3.event.traveled, payload)
		end)
	end
end

event.register(tes3.event.initialized, function()
	event.register(tes3.event.calcTravelPrice, travelStart, { priority = -100 })
end)