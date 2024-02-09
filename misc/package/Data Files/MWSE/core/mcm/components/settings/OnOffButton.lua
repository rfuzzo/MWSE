--[[
	OnOffButton: Toggles a variable between true and false, showing "On" or "Off"
	in the button text

]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.settings.VariableButton")



--- @class mwseMCMOnOffButton
local OnOffButton = Parent:new()

function OnOffButton:convertToLabelValue(variableValue)
	return variableValue and tes3.findGMST(tes3.gmst.sOn).value or tes3.findGMST(tes3.gmst.sOff).value
end

return OnOffButton
