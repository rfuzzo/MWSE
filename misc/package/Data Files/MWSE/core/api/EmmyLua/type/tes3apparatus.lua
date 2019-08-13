
--- An apparatus game object.
---@class tes3apparatus : tes3physicalObject
tes3apparatus = {}

--- The deleted state of the object.
---@type boolean
tes3apparatus.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3apparatus.disabled = nil

--- The object's scale.
---@type number
tes3apparatus.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3apparatus.sourceMod = nil

--- The weight, in pounds, of the object.
---@type number
tes3apparatus.weight = nil

--- The value of the object.
---@type number
tes3apparatus.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3apparatus.objectType = nil

--- The path to the object's icon.
---@type string
tes3apparatus.icon = nil

--- The quality of the apparatus.
---@type number
tes3apparatus.quality = nil

--- The scene graph node for this object.
---@type niNode
tes3apparatus.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3apparatus.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3apparatus.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3apparatus.id = nil

--- The modification state of the object since the last save.
---@type boolean
tes3apparatus.modified = nil

--- The raw flags of the object.
---@type number
tes3apparatus.objectFlags = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3apparatus.stolenList = nil

--- The script that runs on the object.
---@type tes3script
tes3apparatus.script = nil

--- The player-facing name for the object.
---@type string
tes3apparatus.name = nil

--- The type of the apparatus.
---@type number
tes3apparatus.type = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3apparatus.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3apparatus.nextInCollection = nil

--- The path to the object's mesh.
---@type string
tes3apparatus.mesh = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3apparatus.boundingBox = nil


