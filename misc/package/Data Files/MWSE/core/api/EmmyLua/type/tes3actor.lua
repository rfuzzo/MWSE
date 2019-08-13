
--- An Actor (not to be confused with a Mobile Actor) is an object that can be cloned and that has an inventory. Creatures, NPCs, and containers are all considered actors.
---|
---|It is standard for creatures and NPCs to be composed of an actor and a mobile actor, linked together with a reference.
---@class tes3actor : tes3physicalObject
tes3actor = {}

--- The deleted state of the object.
---@type boolean
tes3actor.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3actor.disabled = nil

--- A number representing the actor flags. Truly a bit field.
---@type number
tes3actor.actorFlags = nil

--- The raw flags of the object.
---@type number
tes3actor.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3actor.sourceMod = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3actor.objectType = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3actor.boundingBox = nil

--- The scene graph node for this object.
---@type niNode
tes3actor.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3actor.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3actor.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3actor.id = nil

--- The number of clones that exist of this actor.
---@type number
tes3actor.cloneCount = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3actor.stolenList = nil

--- The modification state of the object since the last save.
---@type boolean
tes3actor.modified = nil

--- The items currently carried by the actor.
---@type tes3iterator
tes3actor.inventory = nil

--- The object's scale.
---@type number
tes3actor.scale = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3actor.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3actor.nextInCollection = nil

--- The items currently equipped to the actor.
---@type tes3iterator
tes3actor.equipment = nil

--- A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3actor/onInventoryClose.html).
---@type method
---@param reference tes3reference { optional = "after" }
function tes3actor:onInventoryClose(reference) end


