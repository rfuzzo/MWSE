
--- An NPC object that has not been cloned. Typically represents the raw information edited in the construction set.
---@class tes3npc : tes3actor
tes3npc = {}

--- The items currently carried by the actor.
---@type tes3iterator
tes3npc.inventory = nil

--- The disabled state of the object.
---@type boolean
tes3npc.disabled = nil

--- A number representing the actor flags. Truly a bit field.
---@type number
tes3npc.actorFlags = nil

--- The raw flags of the object.
---@type number
tes3npc.objectFlags = nil

--- The class that the NPC uses.
---@type tes3class
tes3npc.class = nil

--- The actor's level.
---@type number
tes3npc.level = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3npc.boundingBox = nil

--- Direct access to the actor female flag.
---@type boolean
tes3npc.female = nil

--- If true, the actor's attacked flag is set.
---@type boolean
tes3npc.isAttacked = nil

--- If true, the actor's essential flag is set.
---@type boolean
tes3npc.isEssential = nil

--- A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3npc/onInventoryClose.html).
---@type method
---@param reference tes3reference { optional = "after" }
function tes3npc:onInventoryClose(reference) end

--- The player-facing name for the object.
---@type string
tes3npc.name = nil

--- If true, the actor's respawn flag is set.
---@type boolean
tes3npc.isRespawn = nil

--- The hair body part that the NPC will use.
---@type tes3bodyPart
tes3npc.hair = nil

--- The deleted state of the object.
---@type boolean
tes3npc.deleted = nil

--- The modification state of the object since the last save.
---@type boolean
tes3npc.modified = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3npc.objectType = nil

--- The actor's max health.
---@type number
tes3npc.barterGold = nil

--- The unique identifier for the object.
---@type string
tes3npc.id = nil

--- The filename of the mod that owns this object.
---@type string
tes3npc.sourceMod = nil

--- The actor's base reputation.
---@type number
tes3npc.reputation = nil

--- A substructure off of actors that contains information on the current AI configuration.
---@type tes3aiConfig
tes3npc.aiConfig = nil

--- The race that the NPC uses.
---@type tes3race
tes3npc.race = nil

--- The object's scale.
---@type number
tes3npc.scale = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3npc.previousInCollection = nil

--- The scene graph reference node for this object.
---@type niNode
tes3npc.sceneReference = nil

--- The scene graph node for this object.
---@type niNode
tes3npc.sceneNode = nil

--- The path to the object's mesh.
---@type string
tes3npc.mesh = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3npc.stolenList = nil

---@type number
tes3npc.factionIndex = nil

--- The items currently equipped to the actor.
---@type tes3iterator
tes3npc.equipment = nil

--- The script that runs on the object.
---@type tes3script
tes3npc.script = nil

--- The head body part that the NPC will use.
---@type tes3bodyPart
tes3npc.head = nil

--- Always returns false.
---@type boolean
tes3npc.isInstance = nil

--- A list of spells that the actor has access to.
---@type tes3spellList
tes3npc.spells = nil

--- The NPC's rank in their faction.
---@type number
tes3npc.factionRank = nil

--- Direct access to the actor autocalc flag.
---@type boolean
tes3npc.autoCalc = nil

--- The actor's max fatigue.
---@type number
tes3npc.fatigue = nil

--- The number of clones that exist of this actor.
---@type number
tes3npc.cloneCount = nil

--- The actor's max health.
---@type number
tes3npc.health = nil

--- The class that the NPC is joined to.
---@type tes3faction
tes3npc.faction = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3npc.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3npc.nextInCollection = nil

--- The actor's base disposition.
---@type number
tes3npc.disposition = nil

--- The actor's max magicka.
---@type number
tes3npc.magicka = nil


