
--- A node from a collection, which has a link to the previous and next node, as well as its contained data.
---@class tes3iteratorNode
tes3iteratorNode = {}

--- The next node in the collection.
---@type tes3iteratorNode
tes3iteratorNode.tail = nil

--- The data stored in the node. Its type depends on the specific collection.
---@type number
tes3iteratorNode.data = nil

--- The previous node in the collection.
---@type tes3iteratorNode
tes3iteratorNode.head = nil


