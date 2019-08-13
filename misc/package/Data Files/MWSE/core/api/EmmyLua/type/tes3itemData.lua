
--- A set of variables that differentiates one item from another.
---@class tes3itemData
tes3itemData = {}

--- Access to the structure where individual mwscript data is stored.
---@type tes3scriptVariables
tes3itemData.scriptVariables = nil

--- The charge of the item. Provides incorrect values on misc items, which instead have a soul actor.
---@type number
tes3itemData.charge = nil

--- The script associated with the scriptVariables.
---@type tes3script
tes3itemData.script = nil

--- Only available on misc items. The actor that is stored inside the soul gem.
---@type tes3actor
tes3itemData.soul = nil

--- The script associated with the scriptVariables.
---@type tes3npc|tes3faction|nil
tes3itemData.owner = nil

--- The condition/health of the item. Provides incorrect values on light items, which instead have a timeLeft property.
---@type number
tes3itemData.condition = nil

--- A requirement, typically associated with ownership and when the player may freely interact with an object. The type depends on the owner. Faction owners provide a required rank as a number, while NPCs provide a global variable to check.
---@type tes3globalVariable|number|nil
tes3itemData.requirement = nil

--- The time remaining on a light. Provides incorrect values on non-light items, which instead have a condition property.
---@type number
tes3itemData.timeLeft = nil

--- Returns an ease of use script context for variable access.
---@type tes3scriptContext
tes3itemData.context = nil


