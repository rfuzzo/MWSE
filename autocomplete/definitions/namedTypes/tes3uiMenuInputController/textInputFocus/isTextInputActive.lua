
---@return boolean isTextInputActive
local function isTextInputActive()
	local menuController = tes3.worldController.menuController
	local inputFocus = menuController.inputController.textInputFocus
	if (not inputFocus or not inputFocus.visible) then
		return false
	end
	return true
end
