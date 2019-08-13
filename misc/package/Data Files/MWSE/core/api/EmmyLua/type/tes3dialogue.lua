
--- A parent-level dialogue, such as a topic, voice, greeting, persuasion response, or journal.
---@class tes3dialogue : tes3baseObject
tes3dialogue = {}

--- The deleted state of the object.
---@type boolean
tes3dialogue.deleted = nil

--- The type of the dialogue.
---@type number
tes3dialogue.type = nil

--- The disabled state of the object.
---@type boolean
tes3dialogue.disabled = nil

--- The raw flags of the object.
---@type number
tes3dialogue.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3dialogue.sourceMod = nil

--- Adds the dialogue to the player's journal, if applicable, at a given index.
---|
---|**Accepts table parameters:**
---|* `index` (*number*): Default: 0.
---|* `actor` (*tes3mobileActor|tes3reference|string*): Default: tes3.player.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue/addToJournal.html).
---@type method
---@param params table
---@return boolean
function tes3dialogue:addToJournal(params) end

--- A collection of individual entries in the dialogue.
---@type tes3iterator
tes3dialogue.info = nil

--- The modification state of the object since the last save.
---@type boolean
tes3dialogue.modified = nil

--- Fetches the info that a given actor would produce for the dialogue.
---|
---|**Accepts table parameters:**
---|* `actor` (*tes3mobileActor|tes3reference|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue/getInfo.html).
---@type method
---@param params table
---@return tes3dialogueInfo
function tes3dialogue:getInfo(params) end

--- For journal dialogues, the currently active journal index.
---@type number
tes3dialogue.journalIndex = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3dialogue.objectType = nil

--- The unique identifier for the object.
---@type string
tes3dialogue.id = nil


