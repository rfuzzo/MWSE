--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.variables.Variable")

--- @class mwseMCMTableVariable
local TableVariable = Parent:new()

--- @return unknown value
function TableVariable:get()
	if self.table[self.id] == nil then
		self.table[self.id] = self.defaultSetting
	end
	return self.table[self.id]
end

--- @param newVal unknown
function TableVariable:set(newVal)
	if (self.converter) then
		newVal = self.converter(newVal)
	end

	self.table[self.id] = newVal
end

return TableVariable
