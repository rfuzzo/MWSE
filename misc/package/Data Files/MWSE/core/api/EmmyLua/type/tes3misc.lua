
--- A core miscellaneous object.
---@class tes3misc : tes3physicalObject
tes3misc = {}

--- The deleted state of the object.
---@type boolean
tes3misc.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3misc.disabled = nil

--- The object's scale.
---@type number
tes3misc.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3misc.sourceMod = nil

--- Determines if this item is a soul gem.
---@type boolean
tes3misc.isSoulGem = nil

--- The weight, in pounds, of the object.
---@type number
tes3misc.weight = nil

--- The value of the object.
---@type number
tes3misc.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3misc.objectType = nil

--- The path to the object's icon.
---@type string
tes3misc.icon = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3misc.boundingBox = nil

--- The scene graph node for this object.
---@type niNode
tes3misc.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3misc.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3misc.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3misc.id = nil

--- Fetches related soul gem data, if this item is a soul gem.
---@type tes3soulGemData
tes3misc.soulGemData = nil

--- The modification state of the object since the last save.
---@type boolean
tes3misc.modified = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3misc.stolenList = nil

--- The raw flags of the object.
---@type number
tes3misc.objectFlags = nil

--- The player-facing name for the object.
---@type string
tes3misc.name = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3misc.owningCollection = nil

--- Access to the flag determining if this item is recognized as a key.
---@type boolean
tes3misc.isKey = nil

--- The next object in parent collection's list.
---@type tes3object
tes3misc.nextInCollection = nil

--- The path to the object's mesh.
---@type string
tes3misc.mesh = nil

--- The script that runs on the object.
---@type tes3script
tes3misc.script = nil


