
--- A game structure that keeps track of a magic source on an object.
---@class tes3magicSourceInstance : tes3baseObject
tes3magicSourceInstance = {}

--- The deleted state of the object.
---@type boolean
tes3magicSourceInstance.deleted = nil

--- Shows if the source is a spell, enchantment, or alchemy.
---@type number
tes3magicSourceInstance.sourceType = nil

--- The disabled state of the object.
---@type boolean
tes3magicSourceInstance.disabled = nil

--- The raw flags of the object.
---@type number
tes3magicSourceInstance.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3magicSourceInstance.sourceMod = nil

---@type tes3item
tes3magicSourceInstance.item = nil

---@type tes3reference
tes3magicSourceInstance.target = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3magicSourceInstance.objectType = nil

---@type number
tes3magicSourceInstance.timestampCastBegin = nil

---@type tes3itemData
tes3magicSourceInstance.itemData = nil

--- The unique identifier for the object.
---@type string
tes3magicSourceInstance.id = nil

--- Gets the magnitude from the casting source for a given effect index.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3magicSourceInstance/getMagnitudeForIndex.html).
---@type method
---@param index number { comment = "The index in the effect list to fetch, between 0 and 7." }
---@return number
function tes3magicSourceInstance:getMagnitudeForIndex(index) end

--- Shows if the state is pre-cast, cast, beginning, working, ending, retired, etc.
---@type number
tes3magicSourceInstance.state = nil

--- The modification state of the object since the last save.
---@type boolean
tes3magicSourceInstance.modified = nil

---@type string
tes3magicSourceInstance.itemID = nil

---@type tes3alchemy|tes3enchantment|tes3spell
tes3magicSourceInstance.source = nil

---@type tes3mobileProjectile
tes3magicSourceInstance.projectile = nil

---@type number
tes3magicSourceInstance.castChanceOverride = nil

---@type tes3reference
tes3magicSourceInstance.caster = nil

---@type string
tes3magicSourceInstance.magicID = nil


