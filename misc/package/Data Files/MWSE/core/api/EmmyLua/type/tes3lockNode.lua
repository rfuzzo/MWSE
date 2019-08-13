
--- An attachment-capable structure that maintains lock and trap data.
---@class tes3lockNode
tes3lockNode = {}

--- The locked state.
---@type boolean
tes3lockNode.locked = nil

--- The level of the lock.
---@type number
tes3lockNode.level = nil

--- The key that will open this door.
---@type tes3misc
tes3lockNode.key = nil

--- The trap associated with the object.
---@type tes3spell
tes3lockNode.trap = nil


