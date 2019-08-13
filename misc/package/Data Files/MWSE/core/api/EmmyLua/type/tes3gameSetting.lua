
--- An GMST game object.
---@class tes3gameSetting : tes3baseObject
tes3gameSetting = {}

--- The deleted state of the object.
---@type boolean
tes3gameSetting.deleted = nil

--- The type of the variable, either 'i', 'f', or 's'.
---@type string
tes3gameSetting.type = nil

--- The disabled state of the object.
---@type boolean
tes3gameSetting.disabled = nil

--- The raw flags of the object.
---@type number
tes3gameSetting.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3gameSetting.sourceMod = nil

--- The default value of the GMST, if no master defines the value.
---@type number|string
tes3gameSetting.defaultValue = nil

--- The modification state of the object since the last save.
---@type boolean
tes3gameSetting.modified = nil

--- The value of the GMST.
---@type number|string
tes3gameSetting.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3gameSetting.objectType = nil

--- The unique identifier for the object.
---@type string
tes3gameSetting.id = nil

--- The array index for the GMST.
---@type number
tes3gameSetting.index = nil


