
-- An example of a simple configuration setup
local defaultConfig = {
	---@type mwseKeyMouseCombo
	combo = {
		-- Alt + Left mouse button
		mouseButton = 0,
		isAltDown = true,
		isControlDown = false,
		isShiftDown = false,
	},
}
local config = mwse.loadConfig("myModConfig", defaultConfig)

local function registerModConfig()
	local template = mwse.mcm.createTemplate({ name = "Test Mod" })
	template:register()

	local page = template:createSideBarPage({ label = "Settings" })

	page:createKeyBinder({
		label = "My combo",
		description = "This combo does...",
		allowMouse = true,
		variable = mwse.mcm.createTableVariable({
			id = "combo",
			table = config
		}),
	})
end
event.register(tes3.event.modConfigReady, registerModConfig)


--- @param e keyDownEventData|mouseButtonDownEventData|mouseWheelEventData
local function sayHi(e)
	local IC = tes3.worldController.inputController

	-- Let's construct the table with the currently pressed key combination.
	-- This will handle event data from keyDown, mouseButtonDown and mouseWheel events.
	--- @type mwseKeyMouseCombo
	local actual = {
		keyCode = e.keyCode,
		isAltDown = IC:isAltDown(),
		isControlDown = IC:isControlDown(),
		isShiftDown = IC:isShiftDown(),
		mouseButton = e.button,
		delta = e.delta
	}
	if not tes3.isKeyEqual({ expected = config.combo, actual = actual }) then
		-- Nothing to do if the pressed combination isn't equal to our expected combination.
		return
	end

	-- Now do our logic
	tes3.messageBox("Hi!")
end

event.register(tes3.event.keyDown, sayHi)
event.register(tes3.event.mouseButtonDown, sayHi)
event.register(tes3.event.mouseWheel, sayHi)
