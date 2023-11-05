--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

-- Parent class
local Parent = require("mcm.variables.Variable")

--- Class object
--- @class mwseMCMCustomVariable
local Custom = Parent:new()

function Custom:get()
	return self:getter()
end

--- @param newValue any
function Custom:set(newValue)
	if (self.converter) then
		newValue = self.converter(newValue)
	end

	self:setter(newValue)
end

return Custom
