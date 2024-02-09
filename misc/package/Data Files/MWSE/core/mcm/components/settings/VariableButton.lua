
--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.settings.Button")

---@class mwseMCMVariableButton : mwseMCMButton
local VariableButton = Parent:new()
VariableButton.defaultSetting = false

function VariableButton:getText()
    return tostring(self:convertToLabelValue(self.variable.value))
end

function VariableButton:press()
	-- Toggle variable
	self.variable.value = not self.variable.value
	-- Set button text
	self:setText(self:getText())
	-- Do this after changing the variable so the callback is correct
	self:update()
end

return VariableButton
