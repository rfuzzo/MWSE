
--- A substructure of mobile actors that provides information about the current or previous action.
---@class tes3actionData
tes3actionData = {}

--- When attacking, the direction swung with the weapon. This shows if the actor was thrusting, swinging, or chopping.
---@type number
tes3actionData.attackDirection = nil

---@type number
tes3actionData.lastBarterHoursPassed = nil

---@type tes3object
tes3actionData.stolenFrom = nil

--- The currently knocked projectile the associated actor is using.
---@type tes3weapon
tes3actionData.nockedProjectile = nil

--- When attacking, this is the value of the weapon damage that was rolled. This value doesn't take into account the actor's strength, or other additional damage.
---@type number
tes3actionData.physicalDamage = nil

--- The behavior state of the tes3actionData.
---@type number
tes3actionData.aiBehaviorState = nil

---@type number
tes3actionData.currentAnimationGroup = nil

---@type number
tes3actionData.animationAttackState = nil

---@type tes3mobileActor
tes3actionData.target = nil

---@type tes3mobileActor
tes3actionData.hitTarget = nil

--- When attacking, this value represents how much the weapon has been pulled back. The value ranges from [0.0 - 1.0].
---@type number
tes3actionData.attackSwing = nil

--- If moving to a location, this is the position to be walked to.
---@type tes3vector3
tes3actionData.walkDestination = nil


