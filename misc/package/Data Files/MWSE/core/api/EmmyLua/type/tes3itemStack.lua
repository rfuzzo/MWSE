
--- A complex container that holds a relationship between an item, and zero or more associated item datas.
---@class tes3itemStack
tes3itemStack = {}

--- A collection of variables that are associated with the stack's object, or nil if there aren't any.
---@type tes3TArray
tes3itemStack.variables = nil

--- The core game object that the stack represents.
---@type tes3item
tes3itemStack.object = nil

--- The total number of items in the stack.
---@type number
tes3itemStack.count = nil


