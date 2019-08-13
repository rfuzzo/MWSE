
--- A representation of a quest, with associated dialogue and info.
---@class tes3quest : tes3baseObject
tes3quest = {}

--- The deleted state of the object.
---@type boolean
tes3quest.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3quest.disabled = nil

--- A collection of dialogues associated with the quest.
---@type tes3iterator
tes3quest.dialogue = nil

--- The filename of the mod that owns this object.
---@type string
tes3quest.sourceMod = nil

--- A collection of dialogue info associated with the quest.
---@type tes3iterator
tes3quest.info = nil

--- The modification state of the object since the last save.
---@type boolean
tes3quest.modified = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3quest.objectType = nil

--- The unique identifier for the object.
---@type string
tes3quest.id = nil

--- The raw flags of the object.
---@type number
tes3quest.objectFlags = nil


