
--- Almost anything that can be represented in the Construction Set is based on this structure.
---@class tes3physicalObject : tes3object
tes3physicalObject = {}

--- The deleted state of the object.
---@type boolean
tes3physicalObject.deleted = nil

--- The scene graph node for this object.
---@type niNode
tes3physicalObject.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3physicalObject.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3physicalObject.previousInCollection = nil

--- The object's scale.
---@type number
tes3physicalObject.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3physicalObject.sourceMod = nil

--- The modification state of the object since the last save.
---@type boolean
tes3physicalObject.modified = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3physicalObject.stolenList = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3physicalObject.objectType = nil

--- The unique identifier for the object.
---@type string
tes3physicalObject.id = nil

--- The disabled state of the object.
---@type boolean
tes3physicalObject.disabled = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3physicalObject.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3physicalObject.nextInCollection = nil

--- The raw flags of the object.
---@type number
tes3physicalObject.objectFlags = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3physicalObject.boundingBox = nil


