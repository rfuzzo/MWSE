
--- A core lockpick object.
---@class tes3probe : tes3physicalObject
tes3probe = {}

--- The deleted state of the object.
---@type boolean
tes3probe.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3probe.disabled = nil

--- The object's scale.
---@type number
tes3probe.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3probe.sourceMod = nil

--- The maximum condition/health of the object.
---@type number
tes3probe.condition = nil

--- The weight, in pounds, of the object.
---@type number
tes3probe.weight = nil

--- The value of the object.
---@type number
tes3probe.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3probe.objectType = nil

--- The path to the object's icon.
---@type string
tes3probe.icon = nil

--- The quality of the object, with how much of a bonus it has.
---@type number
tes3probe.quality = nil

--- The scene graph node for this object.
---@type niNode
tes3probe.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3probe.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3probe.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3probe.id = nil

--- The modification state of the object since the last save.
---@type boolean
tes3probe.modified = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3probe.stolenList = nil

--- The raw flags of the object.
---@type number
tes3probe.objectFlags = nil

--- The player-facing name for the object.
---@type string
tes3probe.name = nil

--- The script that runs on the object.
---@type tes3script
tes3probe.script = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3probe.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3probe.nextInCollection = nil

--- The path to the object's mesh.
---@type string
tes3probe.mesh = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3probe.boundingBox = nil


