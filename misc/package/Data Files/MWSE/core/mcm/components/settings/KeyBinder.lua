--[[
	Button Setting for binding a key/mouse combination. Variable returned in the form:
		{
			keyCode = tes3.scanCode/nil,
			isAltDown = true/false,
			isShiftDown = true/false,
			isControlDown = true/false,
			mouseWheel = integer/nil,
			mouseButton = integer/nil,
		}
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.settings.Binder")

--- @class mwseMCMKeyBinder
local KeyBinder = Parent:new()
KeyBinder.allowMouse = false

-- TODO: Implement flags for enabling the binding of mouse wheel or mouse buttons separately

--- @param data mwseMCMKeyBinder.new.data|nil
--- @return mwseMCMKeyBinder
function KeyBinder:new(data)
	local t = Parent:new(data)

	setmetatable(t, self)
	self.__index = self
	--- @cast t mwseMCMKeyBinder

	-- All KeyBinders observe keyboard input.
	t.observeEvents = { [tes3.event.keyDown] = true }

	-- Check if we also observe input from mouse.
	if t.allowMouse then
		t.observeEvents[tes3.event.mouseButtonDown] = true
		t.observeEvents[tes3.event.mouseWheel] = true
	end
	return t
end

--- @param keyCombo mwseKeyMouseCombo
function KeyBinder:isUnbound(keyCombo)
	if keyCombo.keyCode ~= false then
		return false
	end

	if self.allowMouse and (keyCombo.mouseWheel ~= false or keyCombo.mouseButton ~= false) then
		return false
	end

	return true
end

--- @param e mwseKeyMouseCombo|keyDownEventData|keyUpEventData|mouseButtonDownEventData|mouseWheelEventData
function KeyBinder:getKeyComboFromEventData(e)
	local result = {
		keyCode = e.keyCode or false
	}

	if self.allowMouse then
		local wheel = e.delta and math.clamp(e.delta, -1, 1)
		result.mouseWheel = wheel or false
		result.mouseButton = e.button or false
	end

	if self.allowCombinations then
		result.isAltDown = e.isAltDown
		result.isShiftDown = e.isShiftDown
		result.isControlDown = e.isControlDown
	end

	return result
end

return KeyBinder
