
--- A rotation matrix, translation vector, and scale that marks an object's transformation.
---@class tes3transform
tes3transform = {}

--- The transform's rotation matrix.
---@type tes3matrix33
tes3transform.rotation = nil

--- Creates a copy of the transform.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3transform/copy.html).
---@type method
---@return tes3transform
function tes3transform:copy() end

--- The transform's scale.
---@type number
tes3transform.scale = nil

--- The transform's translation vector.
---@type tes3vector3
tes3transform.translation = nil


