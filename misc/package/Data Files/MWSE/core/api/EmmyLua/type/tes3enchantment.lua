
--- An enchantment game object.
---@class tes3enchantment : tes3object
tes3enchantment = {}

--- The deleted state of the object.
---@type boolean
tes3enchantment.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3enchantment.disabled = nil

--- The raw flags of the object.
---@type number
tes3enchantment.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3enchantment.sourceMod = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3enchantment.objectType = nil

--- The maximum charge for the associated enchantment.
---@type number
tes3enchantment.maxCharge = nil

--- The scene graph reference node for this object.
---@type niNode
tes3enchantment.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3enchantment.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3enchantment.id = nil

--- The cost of using the enchantment.
---@type number
tes3enchantment.chargeCost = nil

--- A bit field for the enchantment's flags.
---@type number
tes3enchantment.flags = nil

--- The modification state of the object since the last save.
---@type boolean
tes3enchantment.modified = nil

---@type number
tes3enchantment.magickaCost = nil

--- The scene graph node for this object.
---@type niNode
tes3enchantment.sceneNode = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3enchantment.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3enchantment.nextInCollection = nil

--- The object's scale.
---@type number
tes3enchantment.scale = nil

--- The enchantment's cast type.
---@type number
tes3enchantment.castType = nil


