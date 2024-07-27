local ffi = require("ffi")

local format = require("mwse.ui.tes3uiElement.createColorPicker.formatHelpers")
local Parent = require("mcm.components.settings.Setting")


-- Defined in oklab\init.lua
local ffiPixel = ffi.typeof("RGB") --[[@as fun(init: ffiImagePixelInit?): ffiImagePixel]]


--- @class mwseMCMColorPickerElements : mwseMCMComponentElements
--- @field picker tes3uiElement

--- @class mwseMCMColorPicker : mwseMCMSetting
--- @field elements mwseMCMColorPickerElements
local ColorPicker = Parent:new()
ColorPicker.initialColor = { r = 1.0, g = 1.0, b = 1.0 }
ColorPicker.showOriginal = true
ColorPicker.showDataRow = true


function ColorPicker:updateVariableValue()
	if self.elements.picker then
		local picker = self.elements.picker.widget.picker --[[@as ColorPicker]]

		self.variable.value = self:convertToVariableValue(picker:getColorAlpha())
		-- TODO: update picker ui elements
	end
end


function ColorPicker:setVariableValue(newValue)
	self.variable.value = newValue
	local picker = self.elements.picker.widget.picker --[[@as ColorPicker]]
	picker:setColor(ffiPixel({ newValue.r, newValue.g, newValue.b }), newValue.a)
	-- TODO: update picker ui elements
	Parent.update(self)
end

function ColorPicker:update()
	self:updateVariableValue()
	Parent.update(self)
end

function ColorPicker:convertToLabelValue(variableValue)
	return "#" .. format.pixelToHex(variableValue)
end

-- UI creation functions

--- @param parentBlock tes3uiElement
function ColorPicker:makeComponent(parentBlock)

	local picker = parentBlock:createColorPicker({
		id = self.id,
		initialColor = self.initialColor,
		alpha = self.alpha,
		initialAlpha = self.initialAlpha,
		showOriginal = self.showOriginal,
		showDataRow = self.showDataRow
	})

	self.elements.picker = picker

	self:insertMouseovers(picker)
end


return ColorPicker
