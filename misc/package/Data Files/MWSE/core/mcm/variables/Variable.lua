--[[
	Base class for variables used by mcm
	To create a subclass, simply create it using Variable:new()
	and override the get/set functions.
	Within get/set functions, use self.id to get the variable id.

	e.g
		local Subclass = require("mcm.variables.Variable"):new()
		function Subclass:get()
			--DO STUFF
		end
		function Subvlass:set(newValue)
			--DO STUFF
		end
		return Subclass
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

--- @class mwseMCMVariable
local Variable = {}
Variable.componentType = "Variable"
Variable.inGameOnly = false
Variable.restartRequiredMessage = mwse.mcm.i18n("The game must be restarted before this change will come into effect.")

--- @param variable string|mwseMCMVariable.new.variable|nil
--- @return mwseMCMVariable variable
function Variable:new(variable)
	local t = variable or {}
	if type(t) == "string" then
		t = { id = t }
	end
	setmetatable(t, self)
	self.__index = Variable.__index
	self.__newindex = Variable.__newindex
	--- @cast t mwseMCMVariable
	return t
end

--- @return unknown value
function Variable:get()
	return rawget(self, "value")
end

--- @param newValue unknown
function Variable:set(newValue)
	if (self.converter) then
		newValue = self.converter(newValue)
	end

	rawset(self, "value", newValue)
end

function Variable.__index(tbl, key)
	local meta = getmetatable(tbl)
	if key == "value" then
		return tbl:get()
	end
	return meta[key]
end

function Variable:__newindex(key, value)
	local meta = getmetatable(self)
	if key == "value" then
		if self.restartRequired then
			local sOk = tes3.findGMST(tes3.gmst.sOK).value --[[@as string]]
			tes3.messageBox { message = self.restartRequiredMessage, buttons = { sOk } }
		end
		self:set(value)
	else
		rawset(self, key, value)
	end
end

return Variable
