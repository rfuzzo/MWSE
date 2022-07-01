---@param e travelFinishedEventData
local function onTravelFinished(e)
	if e.previousCell.id:lower() == "balmora" and e.cell.id:lower() == "suran" then
		local roll = math.random(100)
		if roll > 50 then
			-- The player fell of the Silt strider!
			tes3.positionCell({
				reference = tes3.player,
				position = { 25112, -34879, 600 }, -- This is a point on the coast of Lake Amaya.
				teleportCompanions = true,
			})
			tes3.messageBox("You fell out during your travel!")
		end
	end
end

event.register(tes3.event.travelFinished, onTravelFinished)