
--- An activator game object.
---@class tes3activator : tes3physicalObject
tes3activator = {}

--- The deleted state of the object.
---@type boolean
tes3activator.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3activator.disabled = nil

--- The raw flags of the object.
---@type number
tes3activator.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3activator.sourceMod = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3activator.objectType = nil

--- The path to the object's mesh.
---@type string
tes3activator.mesh = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3activator.boundingBox = nil

--- The scene graph node for this object.
---@type niNode
tes3activator.sceneNode = nil

--- The script that runs on the object.
---@type tes3script
tes3activator.script = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3activator.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3activator.id = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3activator.stolenList = nil

--- The player-facing name for the object.
---@type string
tes3activator.name = nil

--- The modification state of the object since the last save.
---@type boolean
tes3activator.modified = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3activator.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3activator.nextInCollection = nil

--- The scene graph reference node for this object.
---@type niNode
tes3activator.sceneReference = nil

--- The object's scale.
---@type number
tes3activator.scale = nil


