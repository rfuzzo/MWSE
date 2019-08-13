
--- An armor game object.
---@class tes3armor : tes3physicalObject
tes3armor = {}

--- The deleted state of the object.
---@type boolean
tes3armor.deleted = nil

--- The modification state of the object since the last save.
---@type boolean
tes3armor.modified = nil

--- The disabled state of the object.
---@type boolean
tes3armor.disabled = nil

--- The object's scale.
---@type number
tes3armor.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3armor.sourceMod = nil

--- The enchantment used by the object.
---@type tes3enchantment
tes3armor.enchantment = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3armor.owningCollection = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3armor.previousInCollection = nil

--- The raw flags of the object.
---@type number
tes3armor.objectFlags = nil

--- Determines if the armor is the left part of a pair.
---@type boolean
tes3armor.isLeftPart = nil

--- The weight, in pounds, of the object.
---@type number
tes3armor.weight = nil

--- The object's maximum condition.
---@type number
tes3armor.maxCondition = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3armor.objectType = nil

--- The path to the object's mesh.
---@type string
tes3armor.mesh = nil

--- The path to the object's icon.
---@type string
tes3armor.icon = nil

--- The scene graph node for this object.
---@type niNode
tes3armor.sceneNode = nil

--- The script that runs on the object.
---@type tes3script
tes3armor.script = nil

--- The slot used by the armor.
---@type number
tes3armor.slot = nil

--- The unique identifier for the object.
---@type string
tes3armor.id = nil

--- The armor's defensive rating.
---@type number
tes3armor.armorRating = nil

--- The scene graph reference node for this object.
---@type niNode
tes3armor.sceneReference = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3armor.boundingBox = nil

--- The name of the slot used by the armor.
---@type string
tes3armor.slotName = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3armor.stolenList = nil

--- The player-facing name for the object.
---@type string
tes3armor.name = nil

--- The value of the object.
---@type number
tes3armor.value = nil

--- The weight class of the armor.
---@type number
tes3armor.weightClass = nil

--- The next object in parent collection's list.
---@type tes3object
tes3armor.nextInCollection = nil

--- The object's enchantment capacity.
---@type number
tes3armor.enchantCapacity = nil

--- Calculates what armor rating is provided for a given mobile actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3armor/calculateArmorRating.html).
---@type method
---@param mobile tes3mobileActor
function tes3armor:calculateArmorRating(mobile) end


