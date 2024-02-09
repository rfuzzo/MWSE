--[[
	DistanceSlider:
		A slider that displays game distances using real-world units.
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.settings.Slider")



--- @class mwseMCMDistanceSlider : mwseMCMSlider
local DistanceSlider = Parent:new()

DistanceSlider.min = 0.0
DistanceSlider.max = 22.1 * 10
DistanceSlider.step = 22.1
DistanceSlider.jump = 22.1 * 5


function DistanceSlider:convertToLabelValue(variableValue)
	local feet = variableValue / 22.1
	local meters = 0.3048 * feet
	if self.decimalPlaces == 0 then
		return string.format("%i ft (%.2f m)", feet, meters)
	end
	return string.format(
		string.format("%%.%uf ft (%%.%uf m)", self.decimalPlaces, self.decimalPlaces + 2),
		feet, meters
	)
end

return DistanceSlider