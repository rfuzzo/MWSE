
--- A 3 by 3 matrix.
---@class tes3matrix33
tes3matrix33 = {}

--- Fills the matrix with values from euler coordinates.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/fromEulerXYZ.html).
---@type method
---@param x number
---@param y number
---@param z number
function tes3matrix33:fromEulerXYZ(x, y, z) end

--- Reorthogonalizes the matrix.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/reorthogonalize.html).
---@type method
---@return boolean
function tes3matrix33:reorthogonalize() end

--- Fills the matrix with values from euler coordinates.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/fromEulerZYX.html).
---@type method
---@param z number
---@param y number
---@param x number
function tes3matrix33:fromEulerZYX(z, y, x) end

--- [Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/toRotationY.html).
---@type method
---@param y number
function tes3matrix33:toRotationY(y) end

--- [Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/toRotationX.html).
---@type method
---@param x number
function tes3matrix33:toRotationX(x) end

--- A copy of the second row of the matrix.
---@type tes3vector3
tes3matrix33.y = nil

--- [Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/toRotationZ.html).
---@type method
---@param z number
function tes3matrix33:toRotationZ(z) end

--- Converts the matrix to the identity matrix's values.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/toIdentity.html).
---@type method
function tes3matrix33:toIdentity() end

--- A copy of the first row of the matrix.
---@type tes3vector3
tes3matrix33.x = nil

--- Zeroes out all values in the matrix.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/toZero.html).
---@type method
function tes3matrix33:toZero() end

--- A copy of the third row of the matrix.
---@type tes3vector3
tes3matrix33.z = nil

--- [Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/toRotation.html).
---@type method
---@param angle number
---@param x number
---@param y number
---@param z number
function tes3matrix33:toRotation(angle, x, y, z) end

--- Creates a copy of the matrix.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/copy.html).
---@type method
---@return tes3matrix33
function tes3matrix33:copy() end

--- Inverts the matrix.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/invert.html).
---@type method
---@return tes3matrix33 { name = "matrix" }
---@return boolean { name = "valid" }
function tes3matrix33:invert() end

--- [Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33/transpose.html).
---@type method
---@return tes3matrix33
function tes3matrix33:transpose() end


