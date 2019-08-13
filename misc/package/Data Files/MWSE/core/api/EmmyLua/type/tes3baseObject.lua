
--- Almost anything that can be represented in the Construction Set is based on this structure.
---@class tes3baseObject
tes3baseObject = {}

--- The deleted state of the object.
---@type boolean
tes3baseObject.deleted = nil

--- The modification state of the object since the last save.
---@type boolean
tes3baseObject.modified = nil

--- The disabled state of the object.
---@type boolean
tes3baseObject.disabled = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3baseObject.objectType = nil

--- The raw flags of the object.
---@type number
tes3baseObject.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3baseObject.sourceMod = nil

--- The unique identifier for the object.
---@type string
tes3baseObject.id = nil


