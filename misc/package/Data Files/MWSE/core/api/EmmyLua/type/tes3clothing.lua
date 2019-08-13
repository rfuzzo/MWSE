
--- A clothing game object.
---@class tes3clothing : tes3physicalObject
tes3clothing = {}

--- The deleted state of the object.
---@type boolean
tes3clothing.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3clothing.disabled = nil

--- The object's scale.
---@type number
tes3clothing.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3clothing.sourceMod = nil

--- The enchantment used by the object.
---@type tes3enchantment
tes3clothing.enchantment = nil

--- The modification state of the object since the last save.
---@type boolean
tes3clothing.modified = nil

--- Determines if the armor is the left part of a pair.
---@type boolean
tes3clothing.isLeftPart = nil

--- The weight, in pounds, of the object.
---@type number
tes3clothing.weight = nil

--- The value of the object.
---@type number
tes3clothing.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3clothing.objectType = nil

--- The path to the object's icon.
---@type string
tes3clothing.icon = nil

--- The scene graph node for this object.
---@type niNode
tes3clothing.sceneNode = nil

--- The script that runs on the object.
---@type tes3script
tes3clothing.script = nil

--- The object's enchantment capacity.
---@type number
tes3clothing.enchantCapacity = nil

--- The unique identifier for the object.
---@type string
tes3clothing.id = nil

--- The raw flags of the object.
---@type number
tes3clothing.objectFlags = nil

--- The slot used by the armor.
---@type number
tes3clothing.slot = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3clothing.boundingBox = nil

--- The name of the slot used by the armor.
---@type string
tes3clothing.slotName = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3clothing.previousInCollection = nil

--- The player-facing name for the object.
---@type string
tes3clothing.name = nil

--- The scene graph reference node for this object.
---@type niNode
tes3clothing.sceneReference = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3clothing.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3clothing.nextInCollection = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3clothing.stolenList = nil

--- The path to the object's mesh.
---@type string
tes3clothing.mesh = nil


