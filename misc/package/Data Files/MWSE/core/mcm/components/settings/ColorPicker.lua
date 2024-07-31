local format = require("mwse.ui.tes3uiElement.createColorPicker.formatHelpers")
local UIID = require("mwse.ui.tes3uiElement.createColorPicker.uiid")
local update = require("mwse.ui.tes3uiElement.createColorPicker.updateHelpers")

local Parent = require("mcm.components.settings.Setting")


--- @class mwseMCMColorPickerElements : mwseMCMComponentElements
--- @field picker tes3uiElement

--- @class mwseMCMColorPicker : mwseMCMSetting
--- @field elements mwseMCMColorPickerElements
--- @field alpha boolean
--- @field variable mwseMCMTableVariable
local ColorPicker = Parent:new()
ColorPicker.initialColor = { r = 1.0, g = 1.0, b = 1.0 }
ColorPicker.initialAlpha = 1.0

--- Used when a color with different Hue was picked.
--- @param newColor ffiImagePixel|ImagePixel
--- @param alpha number
function ColorPicker:hueChanged(newColor, alpha)
	local parent = self.elements.picker
	local picker = parent.widget.picker --[[@as ColorPicker]]
	update.hueChanged(picker, parent, newColor, alpha)
	update.updateIndicatorPositions(parent, newColor, alpha)
end

--- @param newValue ImagePixelA
function ColorPicker:setVariableValue(newValue)
	-- Make sure we don't create a reference to newValue table (which is usually self.variable.defaultSetting).
	self.variable.value = table.copy(newValue)
	self:hueChanged(newValue, newValue.a)
	self:update()
end

--- Updates the value stored in the variable. Doesn't update the widget.
--- @param newValue ImagePixelA
function ColorPicker:updateVariableValue(newValue)
	-- Make sure we don't create a reference to newValue table.
	self.variable.value = table.copy(newValue)
	self:update()
end

--- @param element tes3uiElement
--- @param eventID tes3.uiEvent
--- @param callback fun(e: tes3uiEventData): boolean?
local function registerRecursive(element, eventID, callback)
	element:register(eventID, callback)
	for _, child in ipairs(element.children) do
		registerRecursive(child, eventID, callback)
	end
end

-- nop
local function blockInteraction() end

-- An array of all the events used in the ColorPicker widget implementation.
local blockedEvents = {
	tes3.uiEvent.mouseDown,
	tes3.uiEvent.mouseRelease,
	tes3.uiEvent.mouseStillPressed,
	tes3.uiEvent.partScrollBarChanged,
	tes3.uiEvent.keyEnter,
	tes3.uiEvent.mouseClick,
}

function ColorPicker:disable()
	Parent.disable(self)

	local parent = self.elements.picker
	for _, eventID in ipairs(blockedEvents) do
		registerRecursive(parent, eventID, blockInteraction)
	end

	-- Also disable the value input below the main picker.
	local textInputContainer = parent:findChild(UIID.dataRowContainer)
	textInputContainer.visible = false
end

function ColorPicker:convertToLabelValue(variableValue)
	return "#" .. format.pixelToHex(variableValue)
end

-- UI creation functions

--- @param parentBlock tes3uiElement
function ColorPicker:makeComponent(parentBlock)
	local variable = self.variable
	local initialColor = variable.value or variable.defaultSetting or self.initialColor
	local initialAlpha = initialColor.a or self.initialAlpha

	local pickerElement = parentBlock:createColorPicker({
		id = "mwseMCMColorPicker",
		initialColor = initialColor,
		alpha = self.alpha,
		initialAlpha = initialAlpha,
		showOriginal = true,
		showDataRow = true,
	})
	-- Make sure our variable stays in sync with the currently picked color.
	pickerElement:register("colorChanged", function(e)
		local picker = pickerElement.widget.picker --[[@as ColorPicker]]
		self:updateVariableValue(picker:getRGBA())
	end)

	self.elements.picker = pickerElement
	self:insertMouseovers(pickerElement)
end


return ColorPicker
