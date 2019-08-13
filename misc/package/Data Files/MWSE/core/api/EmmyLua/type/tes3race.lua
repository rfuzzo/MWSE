
--- A core object representing a character race.
---@class tes3race : tes3baseObject
tes3race = {}

--- Access to all the body parts that will be used for female actors of this race.
---@type tes3raceBodyParts
tes3race.femaleBody = nil

--- The modification state of the object since the last save.
---@type boolean
tes3race.modified = nil

--- The disabled state of the object.
---@type boolean
tes3race.disabled = nil

--- The deleted state of the object.
---@type boolean
tes3race.deleted = nil

--- The raw flags of the object.
---@type number
tes3race.objectFlags = nil

--- The unique identifier for the object.
---@type string
tes3race.id = nil

--- Access to all the body parts that will be used for male actors of this race.
---@type tes3raceBodyParts
tes3race.maleBody = nil

--- The filename of the mod that owns this object.
---@type string
tes3race.sourceMod = nil

--- The player-facing name for the object.
---@type string
tes3race.name = nil

--- Access to the the height pair for males/females of the race.
---@type tes3raceHeightWeight
tes3race.weight = nil

--- Access to the the height pair for males/females of the race.
---@type tes3raceHeightWeight
tes3race.height = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3race.objectType = nil

--- Raw bit-based flags.
---@type number
tes3race.flags = nil


