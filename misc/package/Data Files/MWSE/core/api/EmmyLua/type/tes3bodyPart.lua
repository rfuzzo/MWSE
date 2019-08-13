
--- A body part game object.
---@class tes3bodyPart : tes3physicalObject
tes3bodyPart = {}

--- The deleted state of the object.
---@type boolean
tes3bodyPart.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3bodyPart.disabled = nil

--- The object's scale.
---@type number
tes3bodyPart.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3bodyPart.sourceMod = nil

--- The name of the race associated with this body part.
---@type string
tes3bodyPart.raceName = nil

--- A flag that marks this body part as used for vampires.
---@type boolean
tes3bodyPart.vampiric = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3bodyPart.objectType = nil

---@type number
tes3bodyPart.partType = nil

--- A flag that marks this body part as selectable during character generation.
---@type boolean
tes3bodyPart.playable = nil

--- A flag that marks this body part as used for female actors.
---@type boolean
tes3bodyPart.female = nil

--- The NiNode-derived object for the object's loaded mesh.
---@type niNode
tes3bodyPart.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3bodyPart.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3bodyPart.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3bodyPart.id = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3bodyPart.stolenList = nil

--- The modification state of the object since the last save.
---@type boolean
tes3bodyPart.modified = nil

--- The raw flags of the object.
---@type number
tes3bodyPart.objectFlags = nil

---@type number
tes3bodyPart.part = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3bodyPart.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3bodyPart.nextInCollection = nil

--- The path to the object's mesh.
---@type string
tes3bodyPart.mesh = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3bodyPart.boundingBox = nil


