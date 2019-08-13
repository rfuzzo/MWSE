
--- An global variable game object.
---@class tes3globalVariable : tes3baseObject
tes3globalVariable = {}

--- The deleted state of the object.
---@type boolean
tes3globalVariable.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3globalVariable.disabled = nil

--- The raw flags of the object.
---@type number
tes3globalVariable.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3globalVariable.sourceMod = nil

--- The value of the variable. Unlike GMSTs, globals are always numbers.
---@type number
tes3globalVariable.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3globalVariable.objectType = nil

--- The modification state of the object since the last save.
---@type boolean
tes3globalVariable.modified = nil

--- The unique identifier for the object.
---@type string
tes3globalVariable.id = nil


