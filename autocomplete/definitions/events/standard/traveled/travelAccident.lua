
-- The first line here tells our Lua plugin what type the `e` parameter is.
-- When the type is known, it can provide autocomplete suggestions, making
-- it easier to work with.
---@param e traveledEventData
local function onTraveled(e)
	-- :lower() is a method on the string object type.
	-- It makes the string lowercase.
	if e.previousCell.id:lower() == "balmora" and e.cell.id:lower() == "suran" then

		-- math.random generates a random number from range [1, 100]
		-- If the rolled value is bigger than 50 we execute our logic,
		-- which means there is 50 % chance that our accident will happen.
		local roll = math.random(100)
		if roll > 50 then
			-- The player fell of the Silt strider!

			-- This function teleports the player to the specified position.
			-- It's used here to imitate the player falling from the Silt strider.
			tes3.positionCell({
				reference = tes3.player,
				position = { 25112, -34879, 600 }, -- This is a point on the coast of Lake Amaya.
				teleportCompanions = true,
			})
			tes3.messageBox("You fell out during your travel!")
		end
	end
end

event.register(tes3.event.traveled, onTraveled)