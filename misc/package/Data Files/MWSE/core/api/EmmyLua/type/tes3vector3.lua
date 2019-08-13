
--- A simple trio of floating-point numbers.
---@class tes3vector3
tes3vector3 = {}

--- Calculates the dot product with another vector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3/dot.html).
---@type method
---@param vec tes3vector3
---@return tes3vector3
function tes3vector3:dot(vec) end

--- Creates a copy of the vector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3/copy.html).
---@type method
---@return tes3vector3
function tes3vector3:copy() end

--- Calculates the outer product with another vector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3/outerProduct.html).
---@type method
---@param vec tes3vector3
---@return tes3matrix33
function tes3vector3:outerProduct(vec) end

--- The third value in the vector. An alias for z.
---@type number
tes3vector3.b = nil

--- Normalize the vector in-place, or set its components to zero if normalization is not possible. Returns true if the vector was successfully normalized.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3/normalize.html).
---@type method
---@return bool
function tes3vector3:normalize() end

--- Calculates the distance to another vector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3/distance.html).
---@type method
---@param vec tes3vector3
---@return number
function tes3vector3:distance(vec) end

--- The second value in the vector. An alias for y.
---@type number
tes3vector3.g = nil

--- Calculates the cross product with another vector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3/cross.html).
---@type method
---@param vec tes3vector3
---@return tes3vector3
function tes3vector3:cross(vec) end

--- The second value in the vector.
---@type number
tes3vector3.y = nil

--- The first value in the vector.
---@type number
tes3vector3.x = nil

--- Negates all values in the vector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3/negate.html).
---@type method
function tes3vector3:negate() end

--- The third value in the vector.
---@type number
tes3vector3.z = nil

--- Calculates the vertical distance to another vector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3/heightDifference.html).
---@type method
---@param vec tes3vector3
---@return number
function tes3vector3:heightDifference(vec) end

--- Calculates the length of the vector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3/length.html).
---@type method
---@return number
function tes3vector3:length() end

--- Get a normalized copy of the vector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3/normalized.html).
---@type method
---@return tes3vector3
function tes3vector3:normalized() end

--- The first value in the vector. An alias for x.
---@type number
tes3vector3.r = nil


