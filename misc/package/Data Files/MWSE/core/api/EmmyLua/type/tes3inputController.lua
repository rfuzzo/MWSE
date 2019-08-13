
--- A data structure, off of the world controller, that handles input.
---@class tes3inputController
tes3inputController = {}

--- The raw DirectInput mouse state.
---@type tes3directInputMouseState
tes3inputController.mouseState = nil

--- The raw DirectInput mouse state for the previous state.
---@type tes3directInputMouseState
tes3inputController.previousMouseStatement = nil

--- Checks to see if a given scan code is released, and was pressed last frame.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3inputController/isKeyReleasedThisFrame.html).
---@type method
---@param key number { comment = "The scan code to test. Constants available through ``tes3.scanCode``." }
---@return boolean
function tes3inputController:isKeyReleasedThisFrame(key) end

--- Performs a test for a given keybind, and optionally a transition state.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3inputController/keybindTest.html).
---@type method
---@param key number { comment = "The keybind to test. Constants available through ``tes3.keybind``." }
---@param transition number { comment = "Transition state, e.g. down, or up. Constants available through ``tes3.keyTransition``.", optional = "after" }
---@return boolean
function tes3inputController:keybindTest(key, transition) end

--- Performs a key down test for a given scan key code.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3inputController/isKeyDown.html).
---@type method
---@param key number { comment = "The scan code to test. Constants available through ``tes3.scanCode``." }
---@return boolean
function tes3inputController:isKeyDown(key) end

--- Checks to see if a given scan code is pressed, and wasn't pressed last frame.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3inputController/isKeyPressedThisFrame.html).
---@type method
---@param key number { comment = "The scan code to test. Constants available through ``tes3.scanCode``." }
---@return boolean
function tes3inputController:isKeyPressedThisFrame(key) end

--- A bit field representing device capabilities and settings.
---@type number
tes3inputController.creationFlags = nil


