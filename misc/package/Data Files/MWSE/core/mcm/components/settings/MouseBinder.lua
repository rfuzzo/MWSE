--[[
	Button Setting for binding a mouse button + modifier key combination. Variable returned in the form:
		{
			mouseButton = integer/false,
			mouseWheel = integer/false,
			isAltDown = true/false,
			isShiftDown = true/false,
			isControlDown = true/false,
		}
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.settings.Binder")

--- @class mwseMCMMouseBinder
local MouseBinder = Parent:new()
MouseBinder.allowButtons = true

--- @param data MouseBinder.new.data|nil
--- @return mwseMCMMouseBinder
function MouseBinder:new(data)
	local t = Parent:new(data)

	setmetatable(t, self)
	self.__index = self
	--- @cast t mwseMCMMouseBinder

	local bothDisabled = (not t.allowButtons) and (not t.allowWheel)
	assert(bothDisabled ~= true, "[MouseBinder]: Both allowButtons and allowWheel options are false. \z
		At least one needs to be enabled to use MouseBinder.")

	-- Set up where we are getting input from.
	t.observeEvents = {}
	if t.allowButtons then
		t.observeEvents[tes3.event.mouseButtonDown] = true
	end
	if t.allowWheel then
		t.observeEvents[tes3.event.mouseWheel] = true
	end
	return t
end

--- @param keyCombo mwseKeyMouseCombo
function MouseBinder:isUnbound(keyCombo)
	local buttonBound = self.allowButtons and keyCombo.mouseButton ~= false
	local wheelBound = self.allowWheel and keyCombo.mouseWheel ~= false

	if buttonBound or wheelBound then
		return false
	end

	return true
end

--- @param e mouseButtonDownEventData|mouseWheelEventData
function MouseBinder:getKeyComboFromEventData(e)
	local wheel = e.delta and math.clamp(e.delta, -1, 1)
	local result = {
		mouseButton = e.button or false,
		mouseWheel = wheel or false,
	}

	if self.allowCombinations then
		result.isAltDown = e.isAltDown
		result.isShiftDown = e.isShiftDown
		result.isControlDown = e.isControlDown
	end

	return result
end

return MouseBinder
