
--- A simple collection that maps an object in a leveled list to a level required for that object to spawn.
---@class tes3leveledListNode
tes3leveledListNode = {}

--- The item or creature that can be resolved.
---@type tes3physicalObject
tes3leveledListNode.object = nil

--- The minimum level the player must meet before the node can be used.
---@type number
tes3leveledListNode.levelRequired = nil


