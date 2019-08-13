
--- An NPC object that has been cloned. Typically represents an NPC that has been instanced in the world.
---@class tes3npcInstance : tes3actor
tes3npcInstance = {}

--- The items currently carried by the actor.
---@type tes3iterator
tes3npcInstance.inventory = nil

--- The disabled state of the object.
---@type boolean
tes3npcInstance.disabled = nil

--- A number representing the actor flags. Truly a bit field.
---@type number
tes3npcInstance.actorFlags = nil

--- The raw flags of the object.
---@type number
tes3npcInstance.objectFlags = nil

--- Quick access to the base NPC's class.
---@type tes3class
tes3npcInstance.class = nil

--- Quick access to the base NPC's level.
---@type number
tes3npcInstance.level = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3npcInstance.boundingBox = nil

--- If true, the actor's attacked flag is set.
---@type boolean
tes3npcInstance.isAttacked = nil

--- If true, the actor's essential flag is set.
---@type boolean
tes3npcInstance.isEssential = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3npcInstance.stolenList = nil

--- Quick access to the base NPC's name.
---@type number
tes3npcInstance.name = nil

--- Quick access to the base NPC's magicka.
---@type number
tes3npcInstance.magicka = nil

--- The deleted state of the object.
---@type boolean
tes3npcInstance.deleted = nil

--- Quick access to the base NPC's base amount of barter gold.
---@type number
tes3npcInstance.barterGold = nil

--- The modification state of the object since the last save.
---@type boolean
tes3npcInstance.modified = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3npcInstance.objectType = nil

--- Quick access to the base NPC's race.
---@type tes3race
tes3npcInstance.race = nil

--- The unique identifier for the object.
---@type string
tes3npcInstance.id = nil

--- Access to the base NPC object.
---@type tes3npc
tes3npcInstance.baseObject = nil

--- The filename of the mod that owns this object.
---@type string
tes3npcInstance.sourceMod = nil

--- The items currently equipped to the actor.
---@type tes3iterator
tes3npcInstance.equipment = nil

--- A substructure off of actors that contains information on the current AI configuration.
---@type tes3aiConfig
tes3npcInstance.aiConfig = nil

--- The object's scale.
---@type number
tes3npcInstance.scale = nil

---@type number
tes3npcInstance.factionIndex = nil

--- The number of clones that exist of this actor.
---@type number
tes3npcInstance.cloneCount = nil

--- Quick access to the base NPC's script.
---@type tes3script
tes3npcInstance.script = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3npcInstance.previousInCollection = nil

--- Always returns true.
---@type boolean
tes3npcInstance.isInstance = nil

--- Quick access to the base NPC's spell list.
---@type tes3spellList
tes3npcInstance.spells = nil

--- The scene graph reference node for this object.
---@type niNode
tes3npcInstance.sceneReference = nil

--- The scene graph node for this object.
---@type niNode
tes3npcInstance.sceneNode = nil

--- Quick access to the base NPC's fatigue.
---@type number
tes3npcInstance.fatigue = nil

--- A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3npcInstance/onInventoryClose.html).
---@type method
---@param reference tes3reference { optional = "after" }
function tes3npcInstance:onInventoryClose(reference) end

--- Quick access to the base NPC's health.
---@type number
tes3npcInstance.health = nil

--- Quick access to the base NPC's faction.
---@type tes3faction
tes3npcInstance.faction = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3npcInstance.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3npcInstance.nextInCollection = nil

--- The actor's base disposition.
---@type number
tes3npcInstance.disposition = nil

--- If true, the actor's respawn flag is set.
---@type boolean
tes3npcInstance.isRespawn = nil


