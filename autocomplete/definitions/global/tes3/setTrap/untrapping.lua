
---@param reference tes3reference
---@return boolean untrapped
local function untrap(reference)
	local object = reference.object

	-- Skip objects that can't be trapped.
	if object.objectType ~= tes3.objectType.door
	or object.objectType ~= tes3.objectType.container then
		return false
	end

	tes3.setTrap({
		reference = reference,
		spell = nil
	})
	-- Let the game update the activation tooltip otherwise,
	-- the tooltip would still say "Trapped".
	tes3.game:clearTarget()

	return true
end

-- To test aim at a trapped door or container and press "u" key.
local function onKeyDown()
	-- Get the player's target and apply it's spell
	-- on the player if it's trapped.

	local target = tes3.getPlayerTarget()
	if not target then return end

	untrap(target)
end
event.register(tes3.event.keyDown, onKeyDown, { filter = tes3.scanCode.u })
