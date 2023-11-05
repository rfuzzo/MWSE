--[[
	Mod configuration system.

	Part of the MWSE Project. This module is responsible for creating a uniform UI that mods can
	extend to provide a single place for users to configure their mods.
]]--

--- Storage for mod config packages.
--- @type table<string, mwseModConfig>
local configMods = {}

--- The current package that we are configuring.
--- @type mwseModConfig?
local currentModConfig = nil

--- The previously selected element.
--- @type tes3uiElement?
local previousModConfigSelector = nil

--- Reusable access to UI elements.
--- @type tes3uiElement?
local modConfigContainer = nil

-- Expose the mcm API.

mwse.mcm = require("mcm.mcm")
mwse.mcm.i18n = mwse.loadTranslations("mcm")

--- Callback for when a mod name has been clicked in the left pane.
--- @param e tes3uiEventData
local function onClickModName(e)
	-- If we have a current mod, fire its close event.
	if (currentModConfig and currentModConfig.onClose) then
		local status, error = pcall(currentModConfig.onClose, modConfigContainer)
		if (status == false) then
			mwse.log("Error in mod config close callback: %s\n%s", error, debug.traceback())
		end
	end

	-- Update the current mod package.
	currentModConfig = configMods[e.source.text]
	if (not currentModConfig) then
		error(string.format("No mod config could be found for key '%s'.", e.source.text))
		return
	end

	if (previousModConfigSelector) then
		previousModConfigSelector.widget.state = tes3.uiState.normal
	end
	e.source.widget.state = tes3.uiState.active
	previousModConfigSelector = e.source

	-- Destroy and recreate the parent container.
	modConfigContainer:destroyChildren()

	-- Fire the mod's creation event if it has one.
	if (currentModConfig.onCreate) then
		local status, error = pcall(currentModConfig.onCreate, modConfigContainer)
		if (status == false) then
			mwse.log("Error in mod config create callback: %s\n%s", error, debug.traceback())
		end
	end

	-- Change the mod config title bar to include the mod's name.
	local menu = tes3ui.findMenu("MWSE:ModConfigMenu") --[[@as tes3uiElement]]
	menu.text = mwse.mcm.i18n("Mod Configuration - %s", { e.source.text })
	menu:updateLayout()
end

--- Callback for when the close button has been clicked.
--- @param e keyDownEventData|tes3uiEventData
local function onClickCloseButton(e)
	event.unregister("keyDown", onClickCloseButton, { filter = tes3.scanCode.escape })

	-- If we have a current mod, fire its close event.
	if (currentModConfig and currentModConfig.onClose) then
		local status, error = pcall(currentModConfig.onClose, modConfigContainer)
		if (status == false) then
			mwse.log("Error in mod config close callback: %s\n%s", error, debug.traceback())
		end
	end

	-- Destroy the mod config menu.
	local modConfigMenu = tes3ui.findMenu("MWSE:ModConfigMenu")
	if (modConfigMenu) then
		modConfigMenu:destroy()
	end

	-- Get the main menu so we can show it again.
	local mainMenu = tes3ui.findMenu(tes3ui.registerID("MenuOptions"))
	if (mainMenu) then
		-- Show the main menu again.
		mainMenu.visible = true
	end
end

--- @param a string
--- @param b string
local function caseInsensitiveSorter(a, b)
	return a:lower() < b:lower()
end

--- @param e tes3uiEventData
local function focusSearchBar(e)
	local searchBar = e.source:findChild("SearchBar")
	if (not searchBar) then return end

	tes3ui.acquireTextInput(searchBar)
end

--- @param modName string
--- @param searchText string
local function filterModByName(modName, searchText)
	-- Perform a basic search.
	local nameMatch = modName:lower():find(searchText, nil, true)
	if (nameMatch ~= nil) then
		return true
	end

	-- Get the mod package.
	local package = configMods[modName]

	-- Do we have a custom filter package?
	if (package.onSearch and package.onSearch(searchText)) then
		return true
	end

	return false
end

--- @param e tes3uiEventData
local function onSearchUpdated(e)
	local lowerSearchText = e.source.text:lower()
	local mcm = e.source:getTopLevelMenu()
	local modList = mcm:findChild("ModList")
	local modListContents = modList:getContentElement()
	for _, child in ipairs(modListContents.children) do
		child.visible = filterModByName(child.text, lowerSearchText)
	end
	mcm:updateLayout()
	modList.widget:contentsChanged()
end

--- @param e tes3uiEventData
local function onSearchCleared(e)
	local mcm = e.source:getTopLevelMenu()
	local modList = mcm:findChild("ModList")
	local modListContents = modList:getContentElement()
	for _, child in ipairs(modListContents.children) do
		child.visible = true
	end
	mcm:updateLayout()
	modList.widget:contentsChanged()
end

local function cleanupMCM(e)
	currentModConfig = nil
	modConfigContainer = nil
	previousModConfigSelector = nil
end

-- Callback for when the mod config button has been clicked.
-- Here, we'll create the GUI and set up everything.
local function onClickModConfigButton()
	-- Play the click sound.
	tes3.worldController.menuClickSound:play()

	local menu = tes3ui.findMenu("MWSE:ModConfigMenu")
	if (not menu) then
		-- Create the main menu frame.
		menu = tes3ui.createMenu({ id = "MWSE:ModConfigMenu", dragFrame = true })
		menu.text = mwse.mcm.i18n("Mod Configuration")
		menu.minWidth = 600
		menu.minHeight = 500
		menu.width = 1200
		menu.height = 800
		menu.positionX = menu.width / -2
		menu.positionY = menu.height / 2
		menu:registerAfter("destroy", cleanupMCM)

		-- Register and block unfocus event, to prevent players
		-- messing up state by opening their inventory.
		menu:register("unfocus", function(e)
			return false
		end)

		-- Create the left-right flow.
		local mainHorizontalBlock = menu:createBlock({ id = "MainFlow" })
		mainHorizontalBlock.flowDirection = "left_to_right"
		mainHorizontalBlock.widthProportional = 1.0
		mainHorizontalBlock.heightProportional = 1.0

		local leftBlock = mainHorizontalBlock:createBlock({ id = "LeftFlow" })
		leftBlock.flowDirection = "top_to_bottom"
		leftBlock.width = 250
		leftBlock.minWidth = 250
		leftBlock.maxWidth = 250
		leftBlock.widthProportional = -1.0
		leftBlock.heightProportional = 1.0

		local searchBlock = leftBlock:createThinBorder({ id = "SearchBlock" })
		searchBlock.widthProportional = 1.0
		searchBlock.autoHeight = true

		local searchBar = searchBlock:createTextInput({
			id = "SearchBar",
			placeholderText = mwse.mcm.i18n("Search..."),
			autoFocus = true,
		})
		searchBar.borderLeft = 5
		searchBar.borderRight = 5
		searchBar.borderTop = 3
		searchBar.borderBottom = 5
		searchBar:registerAfter("textUpdated", onSearchUpdated)
		searchBar:registerAfter("textCleared", onSearchCleared)

		-- Make clicking on the block focus the search input.
		searchBlock:register("mouseClick", focusSearchBar)

		-- Create the mod list.
		local modList = leftBlock:createVerticalScrollPane({ id = "ModList" })
		modList.widthProportional = 1.0
		modList.heightProportional = 1.0
		modList:setPropertyBool("PartScrollPane_hide_if_unneeded", true)

		-- Get a sorted list of mods.
		local sortedConfigModNames = {}
		for name, package in pairs(configMods) do
			-- Allow package.hidden to be set to prevent it from showing up in the list.
			if (not package.hidden) then
				table.insert(sortedConfigModNames, name)
			end
		end
		table.sort(sortedConfigModNames, caseInsensitiveSorter)

		-- Fill in the mod list.
		local modListContents = modList:getContentElement()
		for i = 1, #sortedConfigModNames do
			local modName = sortedConfigModNames[i]
			local entry = modListContents:createTextSelect({ id = "ModEntry", text = modName })
			entry:register("mouseClick", onClickModName)
		end

		-- Create container for mod content. This will be deleted whenever the pane is reloaded.
		modConfigContainer = mainHorizontalBlock:createBlock({ id = "ModContainer" })
		modConfigContainer.flowDirection = "top_to_bottom"
		modConfigContainer.widthProportional = 1.0
		modConfigContainer.heightProportional = 1.0
		modConfigContainer.paddingLeft = 4

		local containerPane = modConfigContainer:createThinBorder({ id = "ContainerPane" })
		containerPane.widthProportional = 1.0
		containerPane.heightProportional = 1.0
		containerPane.paddingAllSides = 12
		containerPane.flowDirection = "top_to_bottom"

		-- Splash screen.
		local splash = containerPane:createImage({ id = "MWSESplash", path = "textures/mwse/menu_modconfig_splash.tga" })
		splash.absolutePosAlignX = 0.5
		splash.borderTop = 25

		-- Create a link back to the website.
		local site = containerPane:createHyperlink({ id = "MWSELink", text = "mwse.github.io/MWSE", url = "https://mwse.github.io/MWSE" })
		site.absolutePosAlignX = 0.5

		-- Create bottom button block.
		local bottomBlock = menu:createBlock({ id = "BottomFlow" })
		bottomBlock.widthProportional = 1.0
		bottomBlock.autoHeight = true
		bottomBlock.childAlignX = 1.0

		-- Add a close button to the bottom block.
		local closeButton = bottomBlock:createButton({
			id = "MWSE:ModConfigMenu_Close",
			text = tes3.findGMST(tes3.gmst.sClose).value --[[@as string]]
		})
		closeButton:register("mouseClick", onClickCloseButton)
		event.register("keyDown", onClickCloseButton, { filter = tes3.scanCode.escape })

		-- Cause the menu to refresh itself.
		menu:updateLayout()
		modList.widget:contentsChanged()
	else
		menu.visible = true
	end

	-- Hide main menu.
	local mainMenu = tes3ui.findMenu(tes3ui.registerID("MenuOptions"))
	if (mainMenu) then
		mainMenu.visible = false
	else
		mwse.log("Couldn't find main menu!")
	end

	tes3ui.enterMenuMode(menu.id)
end

-- Get the number of mods that aren't hidden.
local function getActiveModConfigCount()
	local count = 0
	for _, package in pairs(configMods) do
		-- Allow package.hidden to be set to prevent it from showing up in the list.
		if (not package.hidden) then
			count = count + 1
		end
	end
	return count
end

--- Callback for when the MenuOptions element is created. We'll extend it with our new button.
--- @param e uiActivatedEventData
local function onCreatedMenuOptions(e)
	-- Only interested in menu creation, not updates
	if (not e.newlyCreated) then
		return
	end

	-- Don't show the UI if we don't have any mod configs to show.
	if (getActiveModConfigCount() == 0) then
		return
	end

	local mainMenu = e.element

	local creditsButton = mainMenu:findChild(tes3ui.registerID("MenuOptions_Credits_container"))
	local buttonContainer = creditsButton.parent

	local button = buttonContainer:createImageButton({
		id = tes3ui.registerID("MenuOptions_MCM_container"),
		idleId = tes3ui.registerID("MenuOptions_MCMidlebutton"),
		idle = "textures/mwse/menu_modconfig.dds",
		overId = tes3ui.registerID("MenuOptions_MCMoverbutton"),
		over = "textures/mwse/menu_modconfig_over.dds",
		pressedId = tes3ui.registerID("MenuOptions_MCMpressedbutton"),
		pressed = "textures/mwse/menu_modconfig_pressed.dds",
	})
	button.height = 50
	button.autoHeight = false
	button:register("mouseClick", onClickModConfigButton)

	buttonContainer:reorderChildren(creditsButton, button, 1)

	mainMenu.autoWidth = true
	mainMenu.autoHeight = true

	mainMenu:updateLayout()
end
event.register("uiActivated", onCreatedMenuOptions, { filter = "MenuOptions" })

--- @class mwseModConfig : mwse.registerModConfig.package
--- @field name string
--- @field hidden boolean

--- Define a new function in the mwse namespace that lets mods register for mod config.
--- @param name string
--- @param package mwse.registerModConfig.package
function mwse.registerModConfig(name, package)
	-- Prevent duplicate registration.
	if (configMods[name] ~= nil) then
		error(string.format("mwse.registerModConfig: A mod with the name %s has already been registered!", name))
	end
	--- @cast package mwseModConfig

	-- Add the package to the list.
	package.name = name
	configMods[name] = package
end

--- When we've initialized, set up our UI IDs and let other mods know that we are ready to boogie.
---
--- Set this up to run before most other initialized callbacks.
local function onInitialized()
	event.trigger("modConfigReady")
end
event.register("initialized", onInitialized, { priority = 100 })
