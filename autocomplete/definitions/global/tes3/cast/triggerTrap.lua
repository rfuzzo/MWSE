
--- Filter only the objects that can have a trap.
---@param object tes3object
---@return boolean canHaveTrap
local function canHaveTrap(object)
	local type = object.objectType
	return (type == tes3.objectType.container or
			type == tes3.objectType.door)
end

---@param trappedReference tes3reference
---@param targetReference tes3reference? *Default:* tes3.player
---@return boolean trapApplied
local function triggerTrapSpell(trappedReference, targetReference)

	-- Set the player as default targetReference.
	targetReference = targetReference or tes3.player

	local object = trappedReference.object
	if not canHaveTrap(object) then
		return false
	end

	local lockNode = trappedReference.lockNode
	if not lockNode then
		return false
	end

	local trap = lockNode.trap
	if not trap then
		return false
	end

	tes3.cast({
		reference = trappedReference,
		target = targetReference,
		spell = trap,
	})
	lockNode.trap = nil
	trappedReference.modified = true

	-- Let the game update the activation tooltip otherwise,
	-- the tooltip would still say "Trapped" if the activation
	-- tooltip was active when the triggerTrapSpell() was called.
	tes3.game:clearTarget()
	return true
end

-- To test aim at a trapped door or container and press "u" key.
local function onKeyDown()
	local result = tes3.getPlayerTarget()
	if not result then return end

	triggerTrapSpell(result)
end
event.register(tes3.event.keyDown, onKeyDown, { filter = tes3.scanCode.u })
