--[[
	OnOffButton: Toggles a variable between true and false, showing "On" or "Off"
	in the button text

]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.settings.Button")

--- @class mwseMCMOnOffButton
local OnOffButton = Parent:new()
OnOffButton.defaultSetting = false

function OnOffButton:getText()
	local text = (self.variable.value and tes3.findGMST(tes3.gmst.sOn).value or tes3.findGMST(tes3.gmst.sOff).value)
	return text --[[@as string]]
end

function OnOffButton:press()
	-- Toggle variable
	self.variable.value = not self.variable.value
	-- Set button text
	self:setText(self:getText())
	-- Do this after changing the variable so the callback is correct
	self:update()
end

return OnOffButton
