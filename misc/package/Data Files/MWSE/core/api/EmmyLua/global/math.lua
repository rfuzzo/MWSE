
--- Returns a value, limited by upper and lower bounds.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/math/clamp.html).
---@type function
---@param value number
---@param min number
---@param max number
---@return number
function math.clamp(value, min, max) end

--- Returns a value, scaled from expected values [lowIn, highIn] to [lowOut, highOut].
---|
---|For example, a value of 7 remapped from [0,10] to [0,100] would be 70.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/math/remap.html).
---@type function
---@param value number
---@param lowIn number
---@param highIn number
---@param lowOut number
---@param highOut number
---@return number
function math.remap(value, lowIn, highIn, lowOut, highOut) end

--- Rounds a number to a given count of digits.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/math/round.html).
---@type function
---@param value number
---@param digits number
---@return number
function math.round(value, digits) end


