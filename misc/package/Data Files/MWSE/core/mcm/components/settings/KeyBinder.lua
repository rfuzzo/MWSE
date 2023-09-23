--[[
	Button Setting for binding a key combination. Variable returned in the form:
		{
			keyCode = tes3.scanCode,
			isAltDown = true/false,
			isShiftDown = true/false,
			isControlDown = true/false
		}
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.settings.Button")

--- @class mwseMCMKeyBinder
local KeyBinder = Parent:new()
KeyBinder.allowCombinations = true
KeyBinder.currentCombo = {}
KeyBinder.messageDoRebind = mwse.mcm.i18n("Set new key binding to: %s")
KeyBinder.messageRebinded = mwse.mcm.i18n("Key binding changed to '%s'")
KeyBinder.sOkay = mwse.mcm.i18n("Rebind")
KeyBinder.sNotChanged = mwse.mcm.i18n("Key binding not changed.")
KeyBinder.sCancel = tes3.findGMST(tes3.gmst.sCancel).value --[[@as string]]

--- @return string result
function KeyBinder:getText()
	return self:getComboString(self.variable.value)
end

--- @param keyCode integer|nil
--- @return string|nil letter
function KeyBinder:getLetter(keyCode)
	local letter = table.find(tes3.scanCode, keyCode)
	local returnString = tes3.scanCodeToNumber[keyCode] or letter
	if returnString then
		return string.upper(returnString)
	end
end

--- @param keyCombo mwseKeyCombo
--- @return string result
function KeyBinder:getComboString(keyCombo)
	-- Returns "SHIFT-X" if shift is held down but the active key is not Shift,
	-- otherwise just "X" (X being the key being pressed)
	-- And so on for Alt and Ctrl

	local keyCode = keyCombo.keyCode
	local letter = self:getLetter(keyCode) or string.format("{%s}", mwse.mcm.i18n("unknown key"))

	-- if you set allowCombinations to false, nothing functionally changes
	-- but the player doesn't see the prefix
	if not self.allowCombinations then
		return letter
	end

	local hasAlt = (keyCombo.isAltDown and keyCode ~= tes3.scanCode.lAlt
	                                   and keyCode ~= tes3.scanCode.rAlt)
	local hasShift = (keyCombo.isShiftDown and keyCode ~= tes3.scanCode.lShift
	                                       and keyCode ~= tes3.scanCode.rShift)
	local hasCtrl = (keyCombo.isControlDown and keyCode ~= tes3.scanCode.lCtrl
	                                        and keyCode ~= tes3.scanCode.rCtrl)
	local prefix = (hasAlt and "Alt-" or hasShift and "Shift-" or hasCtrl and "Ctrl-" or "")
	return (prefix .. letter)
end

--- @param e keyDownEventData
function KeyBinder:keySelected(e)
	-- If not set then we ignore this trigger as we've pressed okay or cancel
	if not self.currentCombo.keyCode then
		return
	end
	self.currentCombo = {
		keyCode = e.keyCode,
		isAltDown = e.isAltDown,
		isShiftDown = e.isShiftDown,
		isControlDown = e.isControlDown,
	}

	-- This messagebox forces the next messagebox to have the same layout as the previous one
	tes3.messageBox({ message = "An error has occured", buttons = { self.sOkay } })
	self:showKeyBindMessage(self.currentCombo)
end

--- @param e tes3messageBoxCallbackData
function KeyBinder:bindKey(e)
	-- Retrigger if Spacebar/Return was pressed
	local inputController = tes3.worldController.inputController
	local okay = 0
	if e.button == okay then
		if self.currentCombo == self.variable.value then
			tes3.messageBox(self.sNotChanged)
		else
			tes3.messageBox(self.messageRebinded, self:getComboString(self.currentCombo))
			self.variable.value = self.currentCombo
			self:setText(self:getText())
			if self.callback then
				self:callback()
			end
		end
	end
	self.currentCombo = { keyCode = nil }
end

--- @param keyCombo mwseKeyCombo
function KeyBinder:showKeyBindMessage(keyCombo)
	--- Register keyDown event
	--- @param e keyDownEventData
	event.register("keyDown", function(e)
		self:keySelected(e)
	end, { doOnce = true })

	-- Show keybind Message
	local message = string.format(self.messageDoRebind, self:getComboString(keyCombo))
	tes3.messageBox({
		message = message,
		buttons = { self.sOkay, self.sCancel },
		callback = function(e)
			self:bindKey(e)
		end,
	})
end

function KeyBinder:update()
	-- Initialise combo to existing keybind
	self.currentCombo = self.variable.value
	-- Display message to change keybinding
	self:showKeyBindMessage(self.variable.value)
end

-- UI methods


--- @param parentBlock tes3uiElement
function KeyBinder:createOuterContainer(parentBlock)
	Parent.createOuterContainer(self, parentBlock)
	self.elements.outerContainer.autoWidth = false
	self.elements.outerContainer.widthProportional = 1.0
	-- self.elements.outerContainer.borderRight = self.indent
end

--- @param parentBlock tes3uiElement
function KeyBinder:makeComponent(parentBlock)
	Parent.makeComponent(self, parentBlock)
	-- self.elements.button.absolutePosAlignX = 1.0
end

return KeyBinder
