
--- An ingredient game object.
---@class tes3ingredient : tes3physicalObject
tes3ingredient = {}

--- The deleted state of the object.
---@type boolean
tes3ingredient.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3ingredient.disabled = nil

--- The object's scale.
---@type number
tes3ingredient.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3ingredient.sourceMod = nil

--- An array-style table access the skills associated with the effects.
---@type string
tes3ingredient.effectsSkillIds = nil

--- The weight, in pounds, of the object.
---@type number
tes3ingredient.weight = nil

--- The value of the object.
---@type number
tes3ingredient.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3ingredient.objectType = nil

--- The path to the object's mesh.
---@type string
tes3ingredient.mesh = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3ingredient.boundingBox = nil

--- The scene graph node for this object.
---@type niNode
tes3ingredient.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3ingredient.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3ingredient.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3ingredient.id = nil

--- An array-style table access the attributes associated with the effects.
---@type string
tes3ingredient.effectAttributeIds = nil

--- An array-style table access to the four ingredient effects. Unlike alchemy or enchanting objects, these are simple numbers representing the effect ID.
---@type string
tes3ingredient.effects = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3ingredient.stolenList = nil

--- The modification state of the object since the last save.
---@type boolean
tes3ingredient.modified = nil

--- The player-facing name for the object.
---@type string
tes3ingredient.name = nil

--- The raw flags of the object.
---@type number
tes3ingredient.objectFlags = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3ingredient.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3ingredient.nextInCollection = nil

--- The script that runs on the object.
---@type tes3script
tes3ingredient.script = nil

--- The path to the object's icon.
---@type string
tes3ingredient.icon = nil


