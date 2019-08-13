
--- A structure that defines information for an effect and its associated variables, typically found on spells, alchemy, and enchantments.
---@class tes3effect
tes3effect = {}

--- The radius of the effect.
---@type number
tes3effect.radius = nil

--- The base tes3magicEffect ID that the effect uses.
---@type number
tes3effect.id = nil

--- How long the effect should last.
---@type number
tes3effect.duration = nil

--- The skill associated with this effect, or -1 if no skill is used.
---@type number
tes3effect.skill = nil

--- The minimum magnitude of the effect.
---@type number
tes3effect.min = nil

--- Fetches the tes3magicEffect for the given id used.
---@type tes3magicEffect
tes3effect.object = nil

--- The maximum magnitude of the effect.
---@type number
tes3effect.max = nil

--- The attribute associated with this effect, or -1 if no attribute is used.
---@type number
tes3effect.attribute = nil

--- Determines if the effect is self, touch, or target ranged.
---@type number
tes3effect.rangeType = nil


