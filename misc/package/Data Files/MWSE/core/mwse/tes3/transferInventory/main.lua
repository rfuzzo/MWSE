local common = require("mwse.common")

---@param object tes3object
local function reevaluateActorEquipment(object)
	local type = object.objectType
	if type == tes3.objectType.npc
	or type == tes3.objectType.creature then
		---@cast object tes3npcInstance|tes3creatureInstance
		object:reevaluateEquipment()
	end
end


---@param params tes3.transferInventory.params
---@return boolean transfered
function tes3.transferInventory(params)
	-- Validate parameters.
	assert(type(params) == "table", "Invalid parameter. This function must be called with table parameters.")

	local from = common.getRelatedReference(params.from)
	local to = common.getRelatedReference(params.to)
	assert(from, "Invalid 'from' parameter provided. Must be a tes3reference, tes3mobileActor or string.")
	assert(to, "Invalid 'to' parameter provided. Must be a tes3reference, tes3mobileActor or string.")

	local fromObject = from.object
	local toObject = to.object
	assert(common.isActor(fromObject), "Invalid 'from' parameter provided. It must have an inventory.")
	assert(common.isActor(toObject), "Invalid 'to' parameter provided. It must have an inventory.")
	---@cast fromObject tes3creature|tes3creatureInstance|tes3container|tes3container|tes3npc|tes3npcInstance
	---@cast toObject tes3creature|tes3creatureInstance|tes3container|tes3container|tes3npc|tes3npcInstance

	-- Set default parameter values.
	local playSound = table.get(params, "playSound", true)
	local reevaluateEquipment = table.get(params, "reevaluateEquipment", true)

	if not fromObject.isInstance then
		from:clone()
		fromObject = from.object
	end
	---@cast fromObject tes3creatureInstance|tes3containerInstance|tes3npcInstance

	if from.isEmpty then
		return false
	end

	local value = 0
	local firstItem

	for _, stack in pairs(fromObject.inventory) do
		local item = stack.object
		-- Skip uncarryable lights. They are hidden from the interface. A MWSE mod
		-- could make the player glow from transfering such lights, which the player
		-- can't remove. Some creatures like atronaches have uncarryable lights
		-- in their inventory to make them glow that are not supposed to be looted.
		if item.canCarry ~= false then
			value = value + item.value * tes3.transferItem({
				from = from,
				to = to,
				item = item,
				count = stack.count,
				limitCapacity = params.limitCapacity,
				equipProjectiles = params.equipProjectiles,
				reevaluateEquipment = false,
				playSound = false,
				updateGUI = false,
			})
		end
		if not firstItem then
			firstItem = item
		end
	end

	if value == 0 then
		return false
	end

	local targetIsPlayer = (to == tes3.player)

	if playSound then
		local isPlayerInvolved = (to == tes3.player) or (from == tes3.player)
		if isPlayerInvolved then
			tes3.playItemPickupSound({
				item = firstItem,
				pickup = targetIsPlayer
			})
		end
	end

	if params.checkCrime and targetIsPlayer then
		if not tes3.hasOwnershipAccess({ target = from }) then
			local crimeValue = value * tes3.findGMST(tes3.gmst.fCrimeStealing).value
			tes3.triggerCrime({
				type = tes3.crimeType.theft,
				victim = tes3.getOwner(from),
				value = crimeValue,
			})
		end
	end

	if reevaluateEquipment then
		reevaluateActorEquipment(fromObject)
		reevaluateActorEquipment(toObject)
	end

	-- We deferred GUI updating earlier, so update it now.
	tes3.updateInventoryGUI({ reference = from })
	tes3.updateInventoryGUI({ reference = to })
	tes3.updateMagicGUI({ reference = from, updateSpells = false })
	tes3.updateMagicGUI({ reference = to, updateSpells = false })

	return true
end
