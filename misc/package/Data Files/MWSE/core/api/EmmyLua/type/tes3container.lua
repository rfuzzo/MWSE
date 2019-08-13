
--- A container object that has not been cloned. Typically represents the raw information edited in the construction set.
---@class tes3container : tes3actor
tes3container = {}

--- The items currently carried by the actor.
---@type tes3iterator
tes3container.inventory = nil

--- The disabled state of the object.
---@type boolean
tes3container.disabled = nil

--- A number representing the actor flags. Truly a bit field.
---@type number
tes3container.actorFlags = nil

--- The object's scale.
---@type number
tes3container.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3container.sourceMod = nil

--- Determines if the container's respawn flag is enabled.
---@type boolean
tes3container.respawns = nil

--- The modification state of the object since the last save.
---@type boolean
tes3container.modified = nil

--- The unique identifier for the object.
---@type string
tes3container.id = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3container.objectType = nil

--- The path to the object's mesh.
---@type string
tes3container.mesh = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3container.boundingBox = nil

--- The raw flags of the object.
---@type number
tes3container.objectFlags = nil

--- The scene graph node for this object.
---@type niNode
tes3container.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3container.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3container.previousInCollection = nil

--- The amount of weight, in pounds, that the container can hold.
---@type number
tes3container.capacity = nil

--- The number of clones that exist of this actor.
---@type number
tes3container.cloneCount = nil

--- The deleted state of the object.
---@type boolean
tes3container.deleted = nil

--- Always returns false.
---@type boolean
tes3container.isInstance = nil

--- The items currently equipped to the actor.
---@type tes3iterator
tes3container.equipment = nil

--- A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3container/onInventoryClose.html).
---@type method
---@param reference tes3reference { optional = "after" }
function tes3container:onInventoryClose(reference) end

--- The player-facing name for the object.
---@type string
tes3container.name = nil

--- The script that runs on the object.
---@type tes3script
tes3container.script = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3container.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3container.nextInCollection = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3container.stolenList = nil

--- Determines if the container's organic flag is enabled.
---@type boolean
tes3container.organic = nil


