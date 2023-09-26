--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

-- Parent class
local Parent = require("mcm.variables.Variable")

--- Class object
--- @class mwseMCMGlobal
local GlobalVar = Parent:new()
GlobalVar.inGameOnly = true

--- @return number value
function GlobalVar:get()
	return tes3.findGlobal(self.id).value
end

--- @param newValue unknown
function GlobalVar:set(newValue)
	local converter = self.converter
	if (converter) then
		newValue = converter(newValue)
	end

	tes3.findGlobal(self.id).value = newValue
end

return GlobalVar
