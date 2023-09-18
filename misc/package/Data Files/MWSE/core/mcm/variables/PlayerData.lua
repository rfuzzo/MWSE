--[[
	MCMData structure:
	variable = {
		id
		path			--OPTIONAL: path from tes3.player.data if it's nested in tables,
		class
		defaultSetting
	}
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.variables.Variable")

--- Class object
--- @class mwseMCMPlayerData
local PlayerDataVar = Parent:new()
PlayerDataVar.inGameOnly = true

--- @return unknown value
function PlayerDataVar:get()
	if tes3.player then
		local current = tes3.player.data
		local previous
		for v in string.gmatch(self.path, "[^%.]+") do
			if not current[v] then
				current[v] = {}
			end
			current = current[v]
		end
		if current[self.id] == nil then
			current[self.id] = self.defaultSetting
		end
		return current[self.id]
	end

	return self.defaultSetting
end

--- @param newValue unknown
function PlayerDataVar:set(newValue)
	if not tes3.player then
		return
	end

	local converter = self.converter
	if (converter) then
		newValue = converter(newValue)
	end

	local table = tes3.player.data
	for v in string.gmatch(self.path, "[^%.]+") do
		table = table[v]
	end

	table[self.id] = newValue
end

return PlayerDataVar
