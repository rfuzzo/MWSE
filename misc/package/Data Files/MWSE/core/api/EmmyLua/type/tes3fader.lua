
--- An object that applies a graphical effect on the screen, such as screen glare or damage coloring.
---@class tes3fader
tes3fader = {}

--- Activates a deactivated fader.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3fader/activate.html).
---@type method
function tes3fader:activate() end

--- Updates the fader for the current frame.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3fader/setTexture.html).
---@type method
---@param path string { comment = "A path for the texture that will be displayed on screen." }
function tes3fader:setTexture(path) end

--- Updates the fader for the current frame.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3fader/update.html).
---@type method
function tes3fader:update() end

--- Transitions the fader to a value over a given duration.
---|
---|**Accepts table parameters:**
---|* `value` (*number*): The value to fade to. Default: 1.
---|* `duration` (*number*): The time it takes to fade, in seconds. Default: 1.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3fader/fadeTo.html).
---@type method
---@param params table
function tes3fader:fadeTo(params) end

--- Deactivates an activated fader.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3fader/deactivate.html).
---@type method
function tes3fader:deactivate() end

--- Creates a new fader, and adds it to the fader system.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3fader/new.html).
---@type function
---@return tes3fader
function tes3fader.new() end

--- The activation state for the fader. Setting this effectively calls activate/deactivate.
---@type boolean
tes3fader.active = nil

--- Updates the fader for the current frame.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3fader/removeMaterialProperty.html).
---@type method
---@param value number
function tes3fader:removeMaterialProperty(value) end

--- Transitions the fader to a value of 0 over a given duration.
---|
---|**Accepts table parameters:**
---|* `duration` (*number*): The time it takes to fade, in seconds. Default: 1.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3fader/fadeOut.html).
---@type method
---@param params table
function tes3fader:fadeOut(params) end

--- Transitions the fader to a value of 1 over a given duration.
---|
---|**Accepts table parameters:**
---|* `duration` (*number*): The time it takes to fade, in seconds. Default: 1.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3fader/fadeIn.html).
---@type method
---@param params table
function tes3fader:fadeIn(params) end

--- Applies a coloring effect to the fader.
---|
---|**Accepts table parameters:**
---|* `color` (*tes3vector3|table*): The RGB values to set.
---|* `flag` (*boolean*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3fader/setColor.html).
---@type method
---@param params table
---@return boolean
function tes3fader:setColor(params) end


