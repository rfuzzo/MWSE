
--- A container object that has been cloned. Typically represents a container that has been instanced by being opened by the player.
---@class tes3containerInstance : tes3actor
tes3containerInstance = {}

--- The items currently carried by the actor.
---@type tes3iterator
tes3containerInstance.inventory = nil

--- The disabled state of the object.
---@type boolean
tes3containerInstance.disabled = nil

--- A number representing the actor flags. Truly a bit field.
---@type number
tes3containerInstance.actorFlags = nil

--- The object's scale.
---@type number
tes3containerInstance.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3containerInstance.sourceMod = nil

--- Determines if the container's respawn flag is enabled.
---@type boolean
tes3containerInstance.respawns = nil

--- The base container object that the instance inherits from.
---@type tes3object
tes3containerInstance.baseObject = nil

--- The modification state of the object since the last save.
---@type boolean
tes3containerInstance.modified = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3containerInstance.objectType = nil

--- The path to the object's mesh.
---@type string
tes3containerInstance.mesh = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3containerInstance.boundingBox = nil

--- The unique identifier for the object.
---@type string
tes3containerInstance.id = nil

--- The scene graph node for this object.
---@type niNode
tes3containerInstance.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3containerInstance.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3containerInstance.previousInCollection = nil

--- Always returns true.
---@type boolean
tes3containerInstance.isInstance = nil

--- The number of clones that exist of this actor.
---@type number
tes3containerInstance.cloneCount = nil

--- The raw flags of the object.
---@type number
tes3containerInstance.objectFlags = nil

--- The deleted state of the object.
---@type boolean
tes3containerInstance.deleted = nil

--- The items currently equipped to the actor.
---@type tes3iterator
tes3containerInstance.equipment = nil

--- The script that runs on the object.
---@type tes3script
tes3containerInstance.script = nil

--- The player-facing name for the object.
---@type string
tes3containerInstance.name = nil

--- A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3containerInstance/onInventoryClose.html).
---@type method
---@param reference tes3reference { optional = "after" }
function tes3containerInstance:onInventoryClose(reference) end

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3containerInstance.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3containerInstance.nextInCollection = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3containerInstance.stolenList = nil

--- Determines if the container's organic flag is enabled.
---@type boolean
tes3containerInstance.organic = nil


