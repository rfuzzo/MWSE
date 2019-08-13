
--- A creature object that has not been cloned. Typically represents the raw information edited in the construction set.
---@class tes3creature : tes3actor
tes3creature = {}

--- The items currently carried by the actor.
---@type tes3iterator
tes3creature.inventory = nil

--- The disabled state of the object.
---@type boolean
tes3creature.disabled = nil

--- A number representing the actor flags. Truly a bit field.
---@type number
tes3creature.actorFlags = nil

--- The raw flags of the object.
---@type number
tes3creature.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3creature.sourceMod = nil

--- Access to the creature's usesEquipment flag.
---@type boolean
tes3creature.usesEquipment = nil

--- The base level of the creature.
---@type number
tes3creature.level = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3creature.boundingBox = nil

--- If true, the actor's attacked flag is set.
---@type boolean
tes3creature.isAttacked = nil

--- The amount of soul value that the creature provides.
---@type number
tes3creature.soul = nil

--- If true, the actor's essential flag is set.
---@type boolean
tes3creature.isEssential = nil

--- The player-facing name for the object.
---@type string
tes3creature.name = nil

--- Access to the creature's walks flag.
---@type boolean
tes3creature.walks = nil

--- The deleted state of the object.
---@type boolean
tes3creature.deleted = nil

--- The object's scale.
---@type number
tes3creature.scale = nil

--- The modification state of the object since the last save.
---@type boolean
tes3creature.modified = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3creature.objectType = nil

--- The unique identifier for the object.
---@type string
tes3creature.id = nil

--- Access to the creature's biped flag.
---@type boolean
tes3creature.biped = nil

--- Access to the creature's respawns flag.
---@type boolean
tes3creature.respawns = nil

--- If true, the actor's respawn flag is set.
---@type boolean
tes3creature.isRespawn = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3creature.stolenList = nil

--- The scene graph reference node for this object.
---@type niNode
tes3creature.sceneReference = nil

--- The scene graph node for this object.
---@type niNode
tes3creature.sceneNode = nil

--- The path to the object's mesh.
---@type string
tes3creature.mesh = nil

--- The actor's max health.
---@type number
tes3creature.health = nil

--- A substructure off of actors that contains information on the current AI configuration.
---@type tes3aiConfig
tes3creature.aiConfig = nil

--- The type of the creature, represented by a number for normal, daedra, undead, or humanoid.
---@type number
tes3creature.type = nil

--- The script that runs on the object.
---@type tes3script
tes3creature.script = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3creature.previousInCollection = nil

--- Always returns false.
---@type boolean
tes3creature.isInstance = nil

--- A list of spells that the actor has access to.
---@type tes3spellList
tes3creature.spells = nil

--- The items currently equipped to the actor.
---@type tes3iterator
tes3creature.equipment = nil

--- A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3creature/onInventoryClose.html).
---@type method
---@param reference tes3reference { optional = "after" }
function tes3creature:onInventoryClose(reference) end

--- The actor's max fatigue.
---@type number
tes3creature.fatigue = nil

--- The number of clones that exist of this actor.
---@type number
tes3creature.cloneCount = nil

--- Access to the creature's flies flag.
---@type boolean
tes3creature.flies = nil

--- The actor's max magicka.
---@type number
tes3creature.magicka = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3creature.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3creature.nextInCollection = nil

--- A creature to use instead of this one for sound generation.
---@type tes3creature
tes3creature.soundCreature = nil

--- Access to the creature's swims flag.
---@type boolean
tes3creature.swims = nil


