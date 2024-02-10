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

function OnOffButton:convertToLabelValue(variableValue)
	return tes3.findGMST(variableValue and tes3.gmst.sOn or tes3.gmst.sOff).value
end

function OnOffButton:press()
	-- Toggle variable
	self.variable.value = not self.variable.value
	-- Do this after changing the variable so the callback is correct, and the text is updated
	self:update()
end

return OnOffButton
