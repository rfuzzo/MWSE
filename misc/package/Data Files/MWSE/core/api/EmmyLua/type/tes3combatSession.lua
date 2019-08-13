
--- A structure that keeps track of combat session data.
---@class tes3combatSession
tes3combatSession = {}

--- Selects the alchemy item with the greatest value, for a given effect ID and loads it into the selectedAlchemy property.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3combatSession/selectAlchemyWithEffect.html).
---@type method
---@return number
function tes3combatSession:selectAlchemyWithEffect() end

---@type tes3equipmentStack
tes3combatSession.selectedWeapon = nil

---@type number
tes3combatSession.distance = nil

---@type number
tes3combatSession.alchemyPriority = nil

---@type tes3spell
tes3combatSession.selectedSpell = nil

---@type tes3mobileActor
tes3combatSession.mobile = nil

---@type number
tes3combatSession.selectedAction = nil

---@type tes3equipmentStack
tes3combatSession.selectedShield = nil

---@type number
tes3combatSession.selectionPriority = nil

---@type tes3alchemy
tes3combatSession.selectedAlchemy = nil


