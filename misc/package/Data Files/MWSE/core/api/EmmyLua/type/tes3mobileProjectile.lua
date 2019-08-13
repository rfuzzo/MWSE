
--- A mobile object for a spell or ammo projectile.
---@class tes3mobileProjectile : tes3mobileObject
tes3mobileProjectile = {}

--- A vector that shows the size of the bounding box in each direction.
---@type tes3vector3
tes3mobileProjectile.boundSize = nil

--- A vector that represents the 3D acceleration of the object.
---@type tes3vector3
tes3mobileProjectile.impulseVelocity = nil

--- The X grid coordinate of the cell the mobile is in.
---@type number
tes3mobileProjectile.cellX = nil

--- The Y grid coordinate of the cell the mobile is in.
---@type number
tes3mobileProjectile.cellY = nil

--- The weapon that fired this projectile.
---@type tes3weapon
tes3mobileProjectile.firingWeapon = nil

---@type number
tes3mobileProjectile.expire = nil

--- Access to the reference object for the mobile, if any.
---@type tes3reference
tes3mobileProjectile.reference = nil

--- A vector that represents the 3D velocity of the object.
---@type tes3vector3
tes3mobileProjectile.velocity = nil

--- Access to the root mobile object flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileProjectile.flags = nil

--- Access to the root mobile object movement flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileProjectile.movementFlags = nil

--- Access to the root mobile object movement flags from the previous frame, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileProjectile.prevMovementFlags = nil

--- A vector that represents the 3D position of the object.
---@type tes3vector3
tes3mobileProjectile.position = nil

--- The height of the mobile above the ground.
---@type number
tes3mobileProjectile.height = nil

--- The type of mobile object. Maps to values in tes3.objectType.
---@type number
tes3mobileProjectile.objectType = nil

---@type number
tes3mobileProjectile.disposition = nil

--- The mobile that fired this projectile.
---@type tes3mobileActor
tes3mobileProjectile.firingMobile = nil


