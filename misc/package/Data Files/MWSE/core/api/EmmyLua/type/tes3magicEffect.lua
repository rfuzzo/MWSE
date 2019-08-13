
--- A core magic effect definition.
---@class tes3magicEffect
tes3magicEffect = {}

--- Access to the base flag.
---@type boolean
tes3magicEffect.casterLinked = nil

--- Access to the base flag that determines if this effect can be used in enchanting.
---@type boolean
tes3magicEffect.appliesOnce = nil

--- Access to the base flag that determines if this effect doesn't make use of its magnitude.
---@type boolean
tes3magicEffect.hasNoMagnitude = nil

--- Access to the base flag that determines if this effect doesn't use a duration.
---@type boolean
tes3magicEffect.hasNoDuration = nil

--- Access to the base flag that determines if this effect summons an illegal daedra. This flag isn't used.
---@type boolean
tes3magicEffect.illegalDaedra = nil

---@type number
tes3magicEffect.speed = nil

--- The sound path to the sound effect to use when the effect hits a target.
---@type string
tes3magicEffect.hitSoundEffect = nil

--- The sound path to the icon to use for the effect.
---@type string
tes3magicEffect.icon = nil

---@type number
tes3magicEffect.size = nil

--- The base magicka cost to use in calculations.
---@type number
tes3magicEffect.baseMagickaCost = nil

--- The amount of green lighting to use when lighting projectiles.
---@type number
tes3magicEffect.lightingGreen = nil

--- The amount of blue lighting to use when lighting projectiles.
---@type number
tes3magicEffect.lightingBlue = nil

--- Raw access to the numerical representation of flags. Typically shouldn't be used.
---@type number
tes3magicEffect.flags = nil

--- Access to the base flag that determines if this effect makes use of attributes.
---@type boolean
tes3magicEffect.targetsAttributes = nil

--- Access to the base flag that determines if this effect can be refreshed by recasting.
---@type boolean
tes3magicEffect.nonRecastable = nil

--- Access to the base flag that determines if this effect can be used with a range of touch.
---@type boolean
tes3magicEffect.canCastTouch = nil

--- The sound path to the sound effect to use when casting.
---@type string
tes3magicEffect.castSoundEffect = nil

--- Access to the base flag that determines if this effect can't be reflected.
---@type boolean
tes3magicEffect.unreflectable = nil

--- Access to the base flag that determines if this effect is counted as a hostile action.
---@type boolean
tes3magicEffect.isHarmful = nil

--- Access to the flag that determines if this effect can be used with spellmaking.
---@type boolean
tes3magicEffect.allowSpellmaking = nil

--- Access to the flag that determines if this effect can be used in enchanting.
---@type boolean
tes3magicEffect.allowEnchanting = nil

--- Access to the base flag that determines if this effect can be used with a range of target.
---@type boolean
tes3magicEffect.canCastTarget = nil

--- The numerical id for the effect.
---@type number
tes3magicEffect.id = nil

--- Access to the base flag that determines if this effect provides negative lighting.
---@type boolean
tes3magicEffect.usesNegativeLighting = nil

--- Access to the base flag that determines if this effect can be used with a range of self.
---@type boolean
tes3magicEffect.canCastSelf = nil

--- The sound path to the sound effect to use for target projectiles.
---@type string
tes3magicEffect.boltSoundEffects = nil

--- Access to the base flag that determines if this effect's VFX continuously plays.
---@type boolean
tes3magicEffect.hasContinuousVFX = nil

--- The school that the effect is associated with.
---@type number
tes3magicEffect.school = nil

---@type number
tes3magicEffect.baseFlags = nil

--- The path to use for the particle effect texture.
---@type boolean
tes3magicEffect.particleTexture = nil

--- Access to the base flag that determines if this effect makes use of skills.
---@type boolean
tes3magicEffect.targetsSkills = nil

--- The amount of red lighting to use when lighting projectiles.
---@type number
tes3magicEffect.lightingRed = nil

--- The sound path to the sound effect to use for area of effect impacts.
---@type string
tes3magicEffect.areaSoundEffect = nil

---@type number
tes3magicEffect.sizeCap = nil


