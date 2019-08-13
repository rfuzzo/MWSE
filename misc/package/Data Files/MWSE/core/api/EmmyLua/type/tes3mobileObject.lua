
--- The base object from which all other mobiles (AI/movement using) structures derive.
---@class tes3mobileObject
tes3mobileObject = {}

--- A vector that shows the size of the bounding box in each direction.
---@type tes3vector3
tes3mobileObject.boundSize = nil

--- A vector that represents the 3D acceleration of the object.
---@type tes3vector3
tes3mobileObject.impulseVelocity = nil

--- The X grid coordinate of the cell the mobile is in.
---@type number
tes3mobileObject.cellX = nil

--- Access to the root mobile object movement flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileObject.movementFlags = nil

--- Access to the root mobile object movement flags from the previous frame, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileObject.prevMovementFlags = nil

--- Access to the reference object for the mobile, if any.
---@type tes3reference
tes3mobileObject.reference = nil

--- Access to the root mobile object flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileObject.flags = nil

--- A vector that represents the 3D position of the object.
---@type tes3vector3
tes3mobileObject.position = nil

--- The height of the mobile above the ground.
---@type number
tes3mobileObject.height = nil

--- The type of mobile object. Maps to values in tes3.objectType.
---@type number
tes3mobileObject.objectType = nil

--- The Y grid coordinate of the cell the mobile is in.
---@type number
tes3mobileObject.cellY = nil

--- A vector that represents the 3D velocity of the object.
---@type tes3vector3
tes3mobileObject.velocity = nil


