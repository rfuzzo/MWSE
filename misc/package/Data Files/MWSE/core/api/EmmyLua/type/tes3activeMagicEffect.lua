
--- An active magic effect.
---@class tes3activeMagicEffect
tes3activeMagicEffect = {}

---@type boolean
tes3activeMagicEffect.harmful = nil

---@type number
tes3activeMagicEffect.effectId = nil

---@type tes3magicSourceInstance
tes3activeMagicEffect.instance = nil

---@type number
tes3activeMagicEffect.duration = nil

---@type number
tes3activeMagicEffect.effectIndex = nil

---@type number
tes3activeMagicEffect.magnitudeMin = nil

---@type number
tes3activeMagicEffect.magnitude = nil

--- The attribute ID (note that this may be the skill ID if the effect affects skills).
---@type number
tes3activeMagicEffect.attributeId = nil

---@type tes3activeMagicEffect
tes3activeMagicEffect.next = nil

---@type tes3activeMagicEffect
tes3activeMagicEffect.previous = nil

---@type number
tes3activeMagicEffect.serial = nil

--- The skill ID (note that this may be the attribute ID if the effect affects attributes).
---@type number
tes3activeMagicEffect.skillId = nil


