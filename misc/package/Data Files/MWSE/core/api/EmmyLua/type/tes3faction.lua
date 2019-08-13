
--- A faction game object.
---@class tes3faction : tes3actor
tes3faction = {}

--- The items currently carried by the actor.
---@type tes3iterator
tes3faction.inventory = nil

--- The disabled state of the object.
---@type boolean
tes3faction.disabled = nil

--- A number representing the actor flags. Truly a bit field.
---@type number
tes3faction.actorFlags = nil

--- The object's scale.
---@type number
tes3faction.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3faction.sourceMod = nil

--- The player's expelled state in the faction.
---@type boolean
tes3faction.playerExpelled = nil

--- The modification state of the object since the last save.
---@type boolean
tes3faction.modified = nil

--- The raw flags of the object.
---@type number
tes3faction.objectFlags = nil

--- The next object in parent collection's list.
---@type tes3object
tes3faction.nextInCollection = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3faction.objectType = nil

--- The deleted state of the object.
---@type boolean
tes3faction.deleted = nil

--- The player's current rank in the faction.
---@type number
tes3faction.playerRank = nil

--- The items currently equipped to the actor.
---@type tes3iterator
tes3faction.equipment = nil

--- The scene graph node for this object.
---@type niNode
tes3faction.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3faction.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3faction.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3faction.id = nil

--- The number of clones that exist of this actor.
---@type number
tes3faction.cloneCount = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3faction.boundingBox = nil

--- A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3faction/onInventoryClose.html).
---@type method
---@param reference tes3reference { optional = "after" }
function tes3faction:onInventoryClose(reference) end

--- The player's join state for the faction.
---@type boolean
tes3faction.playerJoined = nil

--- The faction's player-facing name.
---@type string
tes3faction.name = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3faction.stolenList = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3faction.owningCollection = nil

--- A collection of tes3factionReactions.
---@type tes3iterator
tes3faction.reactions = nil

--- The player's current reputation in the faction.
---@type number
tes3faction.playerReputation = nil


