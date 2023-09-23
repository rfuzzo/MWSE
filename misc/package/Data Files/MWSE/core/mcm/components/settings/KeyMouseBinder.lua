--[[
	Button Setting for binding a key/mouse combination. Variable returned in the form:
		{
			keyCode = tes3.scanCode/nil,
			isAltDown = true/false,
			isShiftDown = true/false,
			isControlDown = true/false,
			mouseWheel = integer/nil,
			mouseButton = number/nil,
		}
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.settings.Button")

--- @class mwseMCMKeyMouseBinder
local KeyMouseBinder = Parent:new()

--- @return string result
function KeyMouseBinder:getText()
	return self:getComboString(self.variable.value)
end

--- @param keyCode integer|nil
--- @return string|nil letter
function KeyMouseBinder:getLetter(keyCode)
	local letter = table.find(tes3.scanCode, keyCode)
	local returnString = tes3.scanCodeToNumber[keyCode] or letter
	if returnString then
		return string.upper(returnString)
	end
end

local mouseWheel = {
	up = 1,
	down = -1,
}

--- @param wheel integer|nil
--- @return string|nil
function KeyMouseBinder:getMouseWheelText(wheel)
	if wheel == mouseWheel.up then
		return mwse.mcm.i18n("Mouse wheel up")
	elseif wheel == mouseWheel.down then
		return mwse.mcm.i18n("Mouse wheel down")
	end
end

local mouseButtonMap = {
	left = 0,
	right = 1,
	middle = 2,
}

--- @param buttonIndex number|nil
--- @return string|nil
function KeyMouseBinder:getMouseButtonText(buttonIndex)
	if not buttonIndex then
		return
	end

	if buttonIndex == mouseButtonMap.left then
		return mwse.mcm.i18n("Left mouse button")
	elseif buttonIndex == mouseButtonMap.right then
		return mwse.mcm.i18n("Right mouse button")
	elseif buttonIndex == mouseButtonMap.middle then
		return mwse.mcm.i18n("Middle mouse button")
	else
		return string.format(mwse.mcm.i18n("Mouse %s"), buttonIndex)
	end
end

--- @param keyCombo mwseKeyMouseCombo
--- @return string result
function KeyMouseBinder:getComboString(keyCombo)
	local keyCode = keyCombo.keyCode
	local comboText = self:getLetter(keyCode) or
	                  self:getMouseWheelText(keyCombo.mouseWheel) or
	                  self:getMouseButtonText(keyCombo.mouseButton)

	local hasAlt = (keyCombo.isAltDown and keyCode ~= tes3.scanCode.lAlt
	                                   and keyCode ~= tes3.scanCode.rAlt)
	local hasShift = (keyCombo.isShiftDown and keyCode ~= tes3.scanCode.lShift
	                                       and keyCode ~= tes3.scanCode.rShift)
	local hasCtrl = (keyCombo.isControlDown and keyCode ~= tes3.scanCode.lCtrl
	                                        and keyCode ~= tes3.scanCode.rCtrl)
	local prefix = (hasAlt and "Alt - " or hasShift and "Shift - " or hasCtrl and "Ctrl - " or "")

	return (prefix .. comboText)
end


--- @param e keyUpEventData|mouseButtonDownEventData|mouseWheelEventData
function KeyMouseBinder:keySelected(e)
	local wheel = e.delta and math.clamp(e.delta, -1, 1)

	-- TODO: here, check for modifer key state using tes3inputController
	-- mouseButtonUp/mouseButtonDown events never return isAltDown, isShiftDown, isControlDown
	local IC = tes3.worldController.inputController
	self.variable.value = {
		keyCode = e.keyCode,
		mouseButton = e.button,
		mouseWheel = wheel,
		isAltDown = IC:isKeyDown(tes3.scanCode.lAlt) or IC:isKeyDown(tes3.scanCode.rAlt),
		isShiftDown = IC:isKeyDown(tes3.scanCode.lShift) or IC:isKeyDown(tes3.scanCode.rShift),
		isControlDown = IC:isKeyDown(tes3.scanCode.lCtrl) or IC:isKeyDown(tes3.scanCode.rCtrl),
	}

	self:setText(self:getText())
	if self.callback then
		self:callback()
	end
end

local popupId = tes3ui.registerID("KeyMouseBinderPopup")

--- @return tes3uiElement
function KeyMouseBinder:createMenu()
	local menu = tes3ui.findHelpLayerMenu(popupId)

	if not menu then
		menu = tes3ui.createMenu({ id = popupId, fixedFrame = true })
		menu.absolutePosAlignX = 0.5
		menu.absolutePosAlignY = 0.5
		menu.autoWidth = true
		menu.autoHeight = true
		menu.alpha = tes3.worldController.menuAlpha

		local block = menu:createBlock()
		block.autoWidth = true
		block.autoHeight = true
		block.paddingAllSides = 8
		block.flowDirection = tes3.flowDirection.topToBottom

		local header = block:createLabel({
			text = string.format(mwse.mcm.i18n("SET %s KEYBIND."), self.keybindName)
		})
		header.color = tes3ui.getPalette(tes3.palette.headerColor)

		block:createLabel({
			text = mwse.mcm.i18n("Press any key to set the bind or ESC to cancel.")
		})

		tes3ui.enterMenuMode(popupId)
	end
	menu:getTopLevelMenu():updateLayout()
	return menu
end

function KeyMouseBinder:closeMenu()
	local menu = tes3ui.findMenu(popupId)
	if menu then
		menu:destroy()
	end
end

--- @param eventId string
--- @param callback function
--- @param options? event.isRegistered.options
local function unregisterEvent(eventId, callback, options)
	if event.isRegistered(eventId, callback, options) then
		event.unregister(eventId, callback, options --[[@as event.unregister.options]])
	end
end

function KeyMouseBinder:showKeyBindMessage()
	self:createMenu()

	--- @param e keyUpEventData|mouseButtonDownEventData|mouseWheelEventData
	local function waitInput(e)
		-- Unregister this function once we got some input
		unregisterEvent(tes3.event.keyUp, waitInput)
		unregisterEvent(tes3.event.mouseButtonDown, waitInput)
		unregisterEvent(tes3.event.mouseWheel, waitInput)

		-- Allow closing the menu using escape
		if e.keyCode == tes3.scanCode.esc then
			self:closeMenu()
			return
		end

		self:keySelected(e)
		self:closeMenu()
	end

	event.register(tes3.event.keyUp, waitInput)
	event.register(tes3.event.mouseButtonDown, waitInput)
	event.register(tes3.event.mouseWheel, waitInput)
end

function KeyMouseBinder:update()
	-- Display message to change keybinding
	self:showKeyBindMessage()
end

-- UI methods

--- @param parentBlock tes3uiElement
function KeyMouseBinder:createOuterContainer(parentBlock)
	Parent.createOuterContainer(self, parentBlock)
	self.elements.outerContainer.autoWidth = false
	self.elements.outerContainer.widthProportional = 1.0
end

return KeyMouseBinder
