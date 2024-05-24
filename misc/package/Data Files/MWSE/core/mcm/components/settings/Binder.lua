--[[
	An abstract Button Setting for sharing code between various key/mouse binders.
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.settings.Button")

--- @class mwseMCMBinder : mwseMCMButton
---@field keybindName string The name for this action
---@field popupId integer The result of tes3ui.registerID() for this Binder
local Binder = Parent:new()
Binder.allowCombinations = true

--- @param keyCombo mwseKeyMouseCombo
--- @return string result
function Binder:getComboString(keyCombo)
	local comboText = mwse.mcm.getKeyComboName(keyCombo)

	-- Add failsafe for malformed keyCombos
	if not comboText then
		mwse.log("[MCMBinder]: couldn't resolve any text for the given combo:\n%s", json.encode(keyCombo))
		comboText = string.format("{%s}", mwse.mcm.i18n("unknown key"))
	end

	return comboText
end

Binder.convertToLabelValue = Binder.getComboString

--- @param keyCombo mwseKeyMouseCombo
function Binder:keySelected(keyCombo)
	self.variable.value = keyCombo
	self:update()
	self.elements.outerContainer:updateLayout()
end

--- @return tes3uiElement menu
function Binder:createPopupMenu()
	local menu = tes3ui.findHelpLayerMenu(self.popupId)

	if not menu then
		menu = tes3ui.createMenu({ id = self.popupId, fixedFrame = true })
		menu.absolutePosAlignX = 0.5
		menu.absolutePosAlignY = 0.5
		menu.autoWidth = true
		menu.autoHeight = true
		menu.alpha = tes3.worldController.menuAlpha

		local block = menu:createBlock()
		block.autoWidth = true
		block.autoHeight = true
		block.paddingAllSides = 8
		block.flowDirection = tes3.flowDirection.topToBottom

		local headerText = mwse.mcm.i18n("SET NEW KEYBIND.")
		if self.keybindName then
			headerText = string.format(mwse.mcm.i18n("SET %s KEYBIND."), self.keybindName)
		end
		local header = block:createLabel({
			text = headerText
		})
		header.color = tes3ui.getPalette(tes3.palette.headerColor)

		block:createLabel({
			text = mwse.mcm.i18n("Press any key to set the bind or ESC to cancel.")
		})

		tes3ui.enterMenuMode(self.popupId)
	end
	menu:getTopLevelMenu():updateLayout()
	return menu
end


-- UI methods


--- @param parentBlock tes3uiElement
function Binder:createOuterContainer(parentBlock)
	Parent.createOuterContainer(self, parentBlock)
	self.elements.outerContainer.autoWidth = false
	-- self.elements.outerContainer.borderRight = self.indent
end

return Binder
