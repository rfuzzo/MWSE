
--- A child for a given dialogue. Whereas a dialogue may be a conversation topic, a tes3dialogueInfo would be an individual response.
---@class tes3dialogueInfo : tes3baseObject
tes3dialogueInfo = {}

--- The deleted state of the object.
---@type boolean
tes3dialogueInfo.deleted = nil

--- The player's rank required rank in the speaker's faction.
---@type number
tes3dialogueInfo.pcRank = nil

--- The disabled state of the object.
---@type boolean
tes3dialogueInfo.disabled = nil

--- The raw flags of the object.
---@type number
tes3dialogueInfo.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3dialogueInfo.sourceMod = nil

--- The speaker's class that the info is filtered for.
---@type tes3class
tes3dialogueInfo.npcClass = nil

--- The speaker's sex that the info is filtered for.
---@type number
tes3dialogueInfo.npcSex = nil

--- The speaker's current cell that the info is filtered for.
---@type tes3cell
tes3dialogueInfo.cell = nil

--- The speaker's faction that the info is filtered for.
---@type tes3faction
tes3dialogueInfo.npcFaction = nil

--- The speaker's actor that the info is filtered for.
---@type tes3actor
tes3dialogueInfo.actor = nil

--- The unique long string ID for the info. This is not kept in memory, and must be loaded from files for each call.
---@type string
tes3dialogueInfo.id = nil

--- String contents for the info. This is not kept in memory, and must be loaded from files for each call.
---@type string
tes3dialogueInfo.text = nil

--- The speaker's faction rank that the info is filtered for.
---@type number
tes3dialogueInfo.npcRank = nil

--- The modification state of the object since the last save.
---@type boolean
tes3dialogueInfo.modified = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3dialogueInfo.objectType = nil

--- The actor that the player first heard the info from.
---@type tes3actor
tes3dialogueInfo.firstHeardFrom = nil

--- The speaker's race that the info is filtered for.
---@type tes3actor
tes3dialogueInfo.npcRace = nil

--- The player's joined faction that the info is filtered for.
---@type number
tes3dialogueInfo.pcFaction = nil

--- The minimum disposition that the info is filtered for.
---@type number
tes3dialogueInfo.disposition = nil

--- The type of the info.
---@type number
tes3dialogueInfo.type = nil


