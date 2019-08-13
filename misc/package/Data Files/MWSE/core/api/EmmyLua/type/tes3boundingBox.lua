
--- A pair of vectors marking a bounding box.
---@class tes3boundingBox
tes3boundingBox = {}

--- The maximum bound of the box.
---@type tes3vector3
tes3boundingBox.max = nil

--- Creates a copy of the bounding box.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3boundingBox/copy.html).
---@type method
---@return tes3boundingBox
function tes3boundingBox:copy() end

--- The minimum bound of the box.
---@type tes3vector3
tes3boundingBox.min = nil


