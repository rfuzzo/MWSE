
--- A book game object.
---@class tes3book : tes3physicalObject
tes3book = {}

--- The deleted state of the object.
---@type boolean
tes3book.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3book.disabled = nil

--- The object's scale.
---@type number
tes3book.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3book.sourceMod = nil

--- The skill learned from the book, or -1 if the book doesn't have one, or has already been read.
---@type number
tes3book.skill = nil

--- The modification state of the object since the last save.
---@type boolean
tes3book.modified = nil

--- The weight, in pounds, of the object.
---@type number
tes3book.weight = nil

--- The value of the object.
---@type number
tes3book.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3book.objectType = nil

--- The path to the object's mesh.
---@type string
tes3book.mesh = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3book.boundingBox = nil

--- The scene graph node for this object.
---@type niNode
tes3book.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3book.sceneReference = nil

--- The object's enchantment capacity.
---@type number
tes3book.enchantCapacity = nil

--- The unique identifier for the object.
---@type string
tes3book.id = nil

--- Loads and displays the text of the book.
---@type string
tes3book.text = nil

--- The raw flags of the object.
---@type number
tes3book.objectFlags = nil

--- The book type, where 0 is book and 1 is scroll.
---@type number
tes3book.type = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3book.stolenList = nil

--- The script that runs on the object.
---@type tes3script
tes3book.script = nil

--- The player-facing name for the object.
---@type string
tes3book.name = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3book.previousInCollection = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3book.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3book.nextInCollection = nil

--- The enchantment used by the object.
---@type tes3enchantment
tes3book.enchantment = nil

--- The path to the object's icon.
---@type string
tes3book.icon = nil


