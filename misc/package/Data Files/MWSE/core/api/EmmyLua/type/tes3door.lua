
--- An door game object.
---@class tes3door : tes3physicalObject
tes3door = {}

--- The deleted state of the object.
---@type boolean
tes3door.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3door.disabled = nil

--- The raw flags of the object.
---@type number
tes3door.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3door.sourceMod = nil

--- The sound to be played when the door opens.
---@type tes3sound
tes3door.openSound = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3door.objectType = nil

--- The path to the object's mesh.
---@type string
tes3door.mesh = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3door.boundingBox = nil

--- The scene graph node for this object.
---@type niNode
tes3door.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3door.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3door.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3door.id = nil

--- The sound to be played when the door closes.
---@type tes3sound
tes3door.closeSound = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3door.stolenList = nil

--- The player-facing name for the object.
---@type string
tes3door.name = nil

--- The modification state of the object since the last save.
---@type boolean
tes3door.modified = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3door.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3door.nextInCollection = nil

--- The script that runs on the object.
---@type tes3script
tes3door.script = nil

--- The object's scale.
---@type number
tes3door.scale = nil


