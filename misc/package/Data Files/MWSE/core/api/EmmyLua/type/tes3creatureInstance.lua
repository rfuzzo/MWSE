
--- A creature object that has been cloned. Typically represents a creature that has been instanced in the world.
---@class tes3creatureInstance : tes3actor
tes3creatureInstance = {}

--- A collection that contains the items in the actor's inventory.
---@type tes3iterator
tes3creatureInstance.inventory = nil

--- The disabled state of the object.
---@type boolean
tes3creatureInstance.disabled = nil

--- A number representing the actor flags. Truly a bit field.
---@type number
tes3creatureInstance.actorFlags = nil

--- The raw flags of the object.
---@type number
tes3creatureInstance.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3creatureInstance.sourceMod = nil

--- Access to the creature's usesEquipment flag.
---@type boolean
tes3creatureInstance.usesEquipment = nil

--- The base level of the creature.
---@type number
tes3creatureInstance.level = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3creatureInstance.boundingBox = nil

--- If true, the creature attacked flag is set.
---@type boolean
tes3creatureInstance.isAttacked = nil

--- Simplified access to the base creature's soul. The amount of soul value that the creature provides.
---@type number
tes3creatureInstance.soul = nil

--- If true, the creature essential flag is set.
---@type boolean
tes3creatureInstance.isEssential = nil

--- The player-facing name for the object.
---@type string
tes3creatureInstance.name = nil

--- Access to the creature's walks flag.
---@type boolean
tes3creatureInstance.walks = nil

--- The deleted state of the object.
---@type boolean
tes3creatureInstance.deleted = nil

--- The modification state of the object since the last save.
---@type boolean
tes3creatureInstance.modified = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3creatureInstance.objectType = nil

--- The unique identifier for the object.
---@type string
tes3creatureInstance.id = nil

--- The amount of gold that the creature has to barter with.
---@type number
tes3creatureInstance.barterGold = nil

--- A collection that contains the currently equipped items.
---@type tes3iterator
tes3creatureInstance.equipment = nil

--- Simplified access to the base creature's sound generator. A creature to use instead of this one for sound generation.
---@type tes3creature
tes3creatureInstance.soundCreature = nil

--- The object's scale.
---@type number
tes3creatureInstance.scale = nil

--- The number of clones that exist of this actor.
---@type number
tes3creatureInstance.cloneCount = nil

--- Access to the creature's respawns flag.
---@type boolean
tes3creatureInstance.respawns = nil

--- The scene graph reference node for this object.
---@type niNode
tes3creatureInstance.sceneReference = nil

--- Access to creature that this one is instanced from.
---@type tes3creature
tes3creatureInstance.baseObject = nil

--- The scene graph node for this object.
---@type niNode
tes3creatureInstance.sceneNode = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3creatureInstance.stolenList = nil

--- The path to the object's mesh.
---@type string
tes3creatureInstance.mesh = nil

--- A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3creatureInstance/onInventoryClose.html).
---@type method
---@param reference tes3reference { optional = "after" }
function tes3creatureInstance:onInventoryClose(reference) end

--- Simplified access to the base creature's AI configuration.
---@type tes3aiConfig
tes3creatureInstance.aiConfig = nil

--- Simplified access to the base creature's type. The type of the creature, represented by a number for normal, daedra, undead, or humanoid.
---@type number
tes3creatureInstance.type = nil

--- The script that runs on the object.
---@type tes3script
tes3creatureInstance.script = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3creatureInstance.previousInCollection = nil

--- Always returns true.
---@type boolean
tes3creatureInstance.isInstance = nil

--- Simplified access to the base creature's spell list. A list of spells that the creature has access to.
---@type tes3spellList
tes3creatureInstance.spells = nil

--- The creature's current health.
---@type number
tes3creatureInstance.health = nil

--- Access to the creature's biped flag.
---@type boolean
tes3creatureInstance.biped = nil

--- The creature's current fatigue.
---@type number
tes3creatureInstance.fatigue = nil

--- If true, the creature respawn flag is set.
---@type boolean
tes3creatureInstance.isRespawn = nil

--- Access to the creature's flies flag.
---@type boolean
tes3creatureInstance.flies = nil

--- The creature's current magicka.
---@type number
tes3creatureInstance.magicka = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3creatureInstance.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3creatureInstance.nextInCollection = nil

--- Access to the creature's swims flag.
---@type boolean
tes3creatureInstance.swims = nil

--- The creature's currently equipped weapon.
---@type tes3weapon
tes3creatureInstance.weapon = nil


