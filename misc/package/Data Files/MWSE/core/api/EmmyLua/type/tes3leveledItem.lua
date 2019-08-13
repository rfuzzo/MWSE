
--- A leveled creature game object.
---@class tes3leveledItem : tes3physicalObject
tes3leveledItem = {}

--- The deleted state of the object.
---@type boolean
tes3leveledItem.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3leveledItem.disabled = nil

--- The raw flags of the object.
---@type number
tes3leveledItem.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3leveledItem.sourceMod = nil

--- The percent chance, from 0 to 100, for no object to be chosen.
---@type number
tes3leveledItem.chanceForNothing = nil

--- The collection that itself, containing tes3leveledListNodes.
---@type tes3iterator
tes3leveledItem.list = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3leveledItem.objectType = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3leveledItem.boundingBox = nil

--- The scene graph node for this object.
---@type niNode
tes3leveledItem.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3leveledItem.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3leveledItem.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3leveledItem.id = nil

--- The modification state of the object since the last save.
---@type boolean
tes3leveledItem.modified = nil

--- A numerical representation of bit flags for the object.
---@type number
tes3leveledItem.flags = nil

--- The number of possible options in the leveled object container.
---@type number
tes3leveledItem.count = nil

--- Chooses a random item from the list, based on the player's level.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3leveledItem/pickFrom.html).
---@type method
---@return tes3item
function tes3leveledItem:pickFrom() end

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3leveledItem.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3leveledItem.nextInCollection = nil

--- The object's scale.
---@type number
tes3leveledItem.scale = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3leveledItem.stolenList = nil


