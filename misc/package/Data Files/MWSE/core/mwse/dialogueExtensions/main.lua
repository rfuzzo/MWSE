local dialogueMenuUIID = nil
local goodbyeButtonUIID = nil
local barterButtonUIID = nil
local shareButtonUIID = nil
local enchantingButtonUIID = nil
local persuasionButtonUIID = nil
local repairButtonUIID = nil
local spellmakingButtonUIID = nil
local spellsButtonUIID = nil
local trainingButtonUIID = nil
local travelButtonUIID = nil

local alchemyMenuUIID = nil
local barterMenuUIID = nil
local classMenuUIID = nil
local companionShareMenuUIID = nil
local enchantingMenuUIID = nil
local persuastionMenuUIID = nil
local raceMenuUIID = nil
local repairMenuUIID = nil
local spellmakingMenuUIID = nil
local spellsServiceMenuUIID = nil
local trainingMenuUIID = nil
local travelMenuUIID = nil

local function onInitialized()
	dialogueMenuUIID = tes3ui.registerID("MenuDialog")
	goodbyeButtonUIID = tes3ui.registerID("MenuDialog_button_bye")
	barterButtonUIID = tes3ui.registerID("MenuDialog_service_barter")
	shareButtonUIID = tes3ui.registerID("MenuDialog_service_companion")
	enchantingButtonUIID = tes3ui.registerID("MenuDialog_service_enchanting")
	persuasionButtonUIID = tes3ui.registerID("MenuDialog_persuasion")
	repairButtonUIID = tes3ui.registerID("MenuDialog_service_repair")
	spellmakingButtonUIID = tes3ui.registerID("MenuDialog_service_spellmaking")
	spellsButtonUIID = tes3ui.registerID("MenuDialog_service_spells")
	trainingButtonUIID = tes3ui.registerID("MenuDialog_service_training")
	travelButtonUIID = tes3ui.registerID("MenuDialog_service_travel")

	alchemyMenuUIID = tes3ui.registerID("MenuAlchemy")
	barterMenuUIID = tes3ui.registerID("MenuBarter")
	classMenuUIID = tes3ui.registerID("MenuClassChoice")
	companionShareMenuUIID = tes3ui.registerID("MenuContents")
	enchantingMenuUIID = tes3ui.registerID("MenuEnchantment")
	persuastionMenuUIID = tes3ui.registerID("MenuPersuasion")
	raceMenuUIID = tes3ui.registerID("MenuRaceSex")
	repairMenuUIID = tes3ui.registerID("MenuServiceRepair")
	spellmakingMenuUIID = tes3ui.registerID("MenuSpellmaking")
	spellsServiceMenuUIID = tes3ui.registerID("MenuServiceSpells")
	trainingMenuUIID = tes3ui.registerID("MenuServiceTraining")
	travelMenuUIID = tes3ui.registerID("MenuServiceTravel")
end
event.register(tes3.event.initialized, onInitialized)

--- The function opens a menu within dialogue window. Returns true if the menu is open or was opened.
---@param menuID number The id of the menu to open.
---@param buttonID number The id of the button that opens the menu from dialogue menu window.
---@return boolean opened
local function openMenu(menuID, buttonID)
	local menu = tes3ui.findMenu(menuID)
	if menu then
		return true
	end

	local dialogueMenu = tes3ui.findMenu(dialogueMenuUIID)
	if dialogueMenu then
		local button = dialogueMenu:findChild(buttonID)
		button:triggerEvent(tes3.uiEvent.mouseClick)
		return true
	end
	return false
end

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

	function env.CloseDialogue(force)
		return tes3.closeDialogueMenu({ force = force })
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
		return openMenu(barterMenuUIID, barterButtonUIID)
	end

	function env.OpenClassMenu()
		error("Not yet implemented.")
	end

	function env.OpenCompanionInventory()
		return openMenu(companionShareMenuUIID, shareButtonUIID)
	end

	function env.OpenEnchantMenu()
		return openMenu(enchantingMenuUIID, enchantingButtonUIID)
	end

	function env.OpenPersuasionMenu()
		-- This menu is opened under the mouse cursor
		return openMenu(persuastionMenuUIID, persuasionButtonUIID)
	end

	function env.OpenRaceMenu()
		error("Not yet implemented.")
	end

	function env.OpenRepairMenu()
		return openMenu(repairMenuUIID, repairButtonUIID)
	end

	function env.OpenSpellmakingMenu()
		return openMenu(spellmakingMenuUIID, spellmakingButtonUIID)
	end

	function env.OpenSpellMenu()
		return openMenu(spellsServiceMenuUIID, spellsButtonUIID)
	end

	function env.OpenTrainingMenu()
		return openMenu(trainingMenuUIID, trainingButtonUIID)
	end


	function env.OpenTravelMenu()
		-- Opening travel menu by using :triggerEvent crashes the game if used
		-- on a NPC that doesn't provide travelling services. Handle that.
		local travelDestinations = reference.object.aiConfig.travelDestinations
		if travelDestinations == nil then
			return false
		end
		return openMenu(travelMenuUIID, travelButtonUIID)
	end
end
event.register(tes3.event.dialogueEnvironmentCreated, onDialogueEnvironmentCreated, { priority = 100 })
