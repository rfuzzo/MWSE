
--- A core lockpick object.
---@class tes3lockpick : tes3physicalObject
tes3lockpick = {}

--- The deleted state of the object.
---@type boolean
tes3lockpick.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3lockpick.disabled = nil

--- The object's scale.
---@type number
tes3lockpick.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3lockpick.sourceMod = nil

--- The maximum condition/health of the object.
---@type number
tes3lockpick.condition = nil

--- The weight, in pounds, of the object.
---@type number
tes3lockpick.weight = nil

--- The value of the object.
---@type number
tes3lockpick.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3lockpick.objectType = nil

--- The path to the object's icon.
---@type string
tes3lockpick.icon = nil

--- The quality of the object, with how much of a bonus it has.
---@type number
tes3lockpick.quality = nil

--- The scene graph node for this object.
---@type niNode
tes3lockpick.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3lockpick.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3lockpick.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3lockpick.id = nil

--- The modification state of the object since the last save.
---@type boolean
tes3lockpick.modified = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3lockpick.stolenList = nil

--- The raw flags of the object.
---@type number
tes3lockpick.objectFlags = nil

--- The player-facing name for the object.
---@type string
tes3lockpick.name = nil

--- The script that runs on the object.
---@type tes3script
tes3lockpick.script = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3lockpick.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3lockpick.nextInCollection = nil

--- The path to the object's mesh.
---@type string
tes3lockpick.mesh = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3lockpick.boundingBox = nil


