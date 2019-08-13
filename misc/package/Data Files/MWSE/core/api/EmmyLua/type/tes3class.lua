
--- A core object representing a character class.
---@class tes3class : tes3baseObject
tes3class = {}

--- The disabled state of the object.
---@type boolean
tes3class.disabled = nil

--- The raw flags of the object.
---@type number
tes3class.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3class.sourceMod = nil

--- If true, the class will barter book items.
---@type boolean
tes3class.bartersBooks = nil

--- If true, the class will barter weapon items.
---@type boolean
tes3class.bartersWeapons = nil

--- If true, the class will barter enchanted items.
---@type boolean
tes3class.bartersEnchantedItems = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3class.objectType = nil

--- If true, the class will barter armor items.
---@type boolean
tes3class.bartersArmor = nil

--- If true, the class will offer spell training services.
---@type boolean
tes3class.offersTraining = nil

--- If true, the class will barter alchemy items.
---@type boolean
tes3class.bartersAlchemy = nil

--- If true, the class will offer spell selling services.
---@type boolean
tes3class.offersSpells = nil

--- The deleted state of the object.
---@type boolean
tes3class.deleted = nil

--- If true, the class will barter misc items.
---@type boolean
tes3class.bartersMiscItems = nil

--- The modification state of the object since the last save.
---@type boolean
tes3class.modified = nil

--- If true, the class will barter repair items.
---@type boolean
tes3class.bartersRepairTools = nil

--- If true, the class will barter apparatus items.
---@type boolean
tes3class.bartersApparatus = nil

--- If true, the class will barter probe items.
---@type boolean
tes3class.bartersProbes = nil

--- Loads from disk and returns the description of the class.
---@type string
tes3class.description = nil

--- The services offered by the class. This is a bit field, and its values should typically be accessed through values such as bartersAlchemy.
---@type number
tes3class.services = nil

--- If true, the class will barter light items.
---@type boolean
tes3class.bartersLights = nil

--- The unique identifier for the object.
---@type string
tes3class.id = nil

--- The specialization for the class. Maps to the tes3.specialization table.
---@type number
tes3class.specialization = nil

--- If true, the class will offer enchanting services.
---@type boolean
tes3class.offersRepairs = nil

--- If true, the class is selectable at character generation.
---@type boolean
tes3class.playable = nil

--- If true, the class will barter ingredient items.
---@type boolean
tes3class.bartersIngredients = nil

--- If true, the class will barter lockpick items.
---@type boolean
tes3class.bartersLockpicks = nil

--- If true, the class will barter clothing items.
---@type boolean
tes3class.bartersClothing = nil

--- If true, the class will offer repair services.
---@type boolean
tes3class.offersEnchanting = nil

--- The player-facing name for the object.
---@type string
tes3class.name = nil

--- If true, the class will offer spellmaking services.
---@type boolean
tes3class.offersSpellmaking = nil


