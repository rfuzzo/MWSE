--- @param e dialogueEnvironmentCreatedEventData
local function onDialogueEnvironmentCreated(e)
	-- Cache the environment variables outside the function for easier access.
	-- Dialogue scripters shouldn't have to constantly pass these to the functions anyway.
	local env = e.environment
	local reference = env.reference --- @type tes3reference
	local mobile = reference.mobile --- @type tes3mobileActor
	local dialogue = env.dialogue --- @type tes3dialogue
	local info = env.info --- @type tes3dialogueInfo

	-- These are default environment functions available to dialogue scripters.
	-- They should be designed in a way that is easy for them to be called.

	function env.CloseDialogue()
		error("Not yet implemented.")
	end

	function env.FollowPlayer()
		tes3.setAIFollow({
			reference = reference,
			target = tes3.player,
		})
	end

	function env.WaitHere()
		tes3.setAIWander({
			reference = reference,
			idles = { 60, 10, 10, 1, 10, 5, 2, 2 }
		})
	end

	function env.OpenAlchemyMenu()
		error("Not yet implemented.")
	end

	function env.OpenBarterMenu()
		error("Not yet implemented.")
	end

	function env.OpenClassMenu()
		error("Not yet implemented.")
	end

	function env.OpenCompanionInventory(filter, filterValue)
		local passedFilter

		if type(filter) == "function" then
			passedFilter = filter
		else
			passedFilter = filter and tes3.inventorySelectFilter[filter] or function(e)
				local damageableItems = {
					[tes3.objectType.weapon] = true,
					[tes3.objectType.armor] = true,
				}

				if filter == "weapon" and (e.item.objectType == tes3.objectType.weapon) then
					return true
				elseif filter == "repairItem" and (e.item.objectType == tes3.objectType.repairItem) then
					return true
				elseif filter == "probe" and (e.item.objectType == tes3.objectType.probe) then
					return true
				elseif filter == "miscItem" and (e.item.objectType == tes3.objectType.miscItem) then
					return true
				elseif filter == "lockpick" and (e.item.objectType == tes3.objectType.lockpick) then
					return true
				elseif filter == "light" and (e.item.objectType == tes3.objectType.light) then
					return true
				elseif filter == "clothing" and (e.item.objectType == tes3.objectType.clothing) then
					return true
				elseif filter == "book" and (e.item.objectType == tes3.objectType.book) then
					return true
				elseif filter == "armor" and (e.item.objectType == tes3.objectType.armor) then
					return true
				elseif filter == "apparatus" and (e.item.objectType == tes3.objectType.apparatus) then
					return true
				elseif filter == "ammunition" and (e.item.objectType == tes3.objectType.ammunition) then
					return true
				elseif filter == "alchemy" and (e.item.objectType == tes3.objectType.alchemy) then
					return true
				elseif filter == "damagedItems" and
				damageableItems[e.item.objectType] and
				e.itemData and
				(e.itemData.condition < e.item.maxCondition) then
					return true
				elseif filter == "value" and
				(e.item.value <= filterValue) then
					return true
				else
					return false
				end
			end
		end

		tes3ui.showInventorySelectMenu({
			reference = reference,
			title = reference.object.name,
			callback = function(e)
				if e.item then
					tes3.transferItem({
						from = mobile,
						to = tes3.player,
						item = e.item,
						itemData = e.itemData,
						count = e.count,
					})
				end
			end,
			filter = passedFilter
		})
	end

	function env.OpenEnchantMenu()
		error("Not yet implemented.")
	end

	function env.OpenPersuasionMenu()
		error("Not yet implemented.")
	end

	function env.OpenRaceMenu()
		error("Not yet implemented.")
	end

	function env.OpenRepairMenu()
		tes3.showRepairServiceMenu({ serviceActor = mobile })
	end

	function env.OpenSpellmakingMenu()
		tes3.showSpellmakingMenu({ serviceActor = mobile })
	end

	function env.OpenSpellMenu()
		error("Not yet implemented.")
	end

	function env.OpenTrainingMenu()
		error("Not yet implemented.")
	end

	function env.OpenTravelMenu()
		error("Not yet implemented.")
	end
end
event.register(tes3.event.dialogueEnvironmentCreated, onDialogueEnvironmentCreated, { priority = 100 })
