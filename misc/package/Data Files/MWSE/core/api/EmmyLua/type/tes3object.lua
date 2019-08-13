
--- Almost anything that can be represented in the Construction Set is based on this structure.
---@class tes3object : tes3baseObject
tes3object = {}

--- The deleted state of the object.
---@type boolean
tes3object.deleted = nil

--- The scene graph node for this object.
---@type niNode
tes3object.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3object.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3object.previousInCollection = nil

--- The raw flags of the object.
---@type number
tes3object.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3object.sourceMod = nil

--- The modification state of the object since the last save.
---@type boolean
tes3object.modified = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3object.objectType = nil

--- The unique identifier for the object.
---@type string
tes3object.id = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3object.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3object.nextInCollection = nil

--- The disabled state of the object.
---@type boolean
tes3object.disabled = nil

--- The object's scale.
---@type number
tes3object.scale = nil


