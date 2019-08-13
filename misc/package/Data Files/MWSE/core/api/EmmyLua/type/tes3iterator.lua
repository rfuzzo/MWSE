
--- A collection that can be iterated over Contains items in a simple linked list, and stores its head/tail.
---@class tes3iterator
tes3iterator = {}

--- A reference for the currently iterated node. This is used by the core game engine, but should not be accessed from lua.
---@type tes3iteratorNode
tes3iterator.current = nil

--- The first node in the collection.
---@type tes3iteratorNode
tes3iterator.head = nil

--- The last node in the collection.
---@type tes3iteratorNode
tes3iterator.tail = nil

--- The amount of items in the iterator.
---@type number
tes3iterator.size = nil


