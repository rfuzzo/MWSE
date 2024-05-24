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

--- @class mwseMCMMouseBinder : mwseMCMBinder
--- @field allowWheel boolean
local MouseBinder = Parent:new()
MouseBinder.allowButtons = true
MouseBinder.popupId = tes3ui.registerID("MouseBinderPopup")

--- @param data MouseBinder.new.data|nil
--- @return mwseMCMMouseBinder
function MouseBinder:new(data)
	local t = Parent:new(data)

	setmetatable(t, self)
	self.__index = self
	--- @cast t mwseMCMMouseBinder

	--- @diagnostic disable-next-line: need-check-nil
	local bothDisabled = (not t.allowButtons) and (not t.allowWheel)
	assert(bothDisabled ~= true, "[MouseBinder]: Both allowButtons and allowWheel options are false. \z
		At least one needs to be enabled to use MouseBinder.")

	return t
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

function MouseBinder:press()
	self:createPopupMenu()

	--- @param e keyDownEventData|mouseButtonDownEventData|mouseWheelEventData
	local function waitInput(e)
		-- Don't pick up input from the keyboard
		if e.keyCode and e.keyCode ~= tes3.scanCode.esc then
			return
		end

		-- Unregister this function once we got some input
		event.unregister(tes3.event.keyDown, waitInput)
		if self.allowButtons then
			event.unregister(tes3.event.mouseButtonDown, waitInput)
		end
		if self.allowWheel then
			event.unregister(tes3.event.mouseWheel, waitInput)
		end

		local popup = tes3ui.findMenu(self.popupId)
		if popup then
			popup:destroy()
		end

		-- Allow closing the menu using escape, wihout binding anything
		if e.keyCode == tes3.scanCode.esc then
			return
		end
		---@cast e -keyDownEventData
		self:keySelected(self:getKeyComboFromEventData(e))
	end

	-- Allow closing the binding popup by pressing ESC key
	event.register(tes3.event.keyDown, waitInput)
	if self.allowButtons then
		event.register(tes3.event.mouseButtonDown, waitInput)
	end
	if self.allowWheel then
		event.register(tes3.event.mouseWheel, waitInput)
	end
end

return MouseBinder
