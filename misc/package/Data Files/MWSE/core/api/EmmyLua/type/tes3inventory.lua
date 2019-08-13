
--- An inventory composes of an iterator, and flags caching the state of the inventory.
---@class tes3inventory
tes3inventory = {}

--- Calculates the weight of all items in the container.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3inventory/calculateWeight.html).
---@type method
---@return number
function tes3inventory:calculateWeight() end

--- Direct acces to the container that holds the inventory's items.
---@type tes3iterator
tes3inventory.iterator = nil

--- Adds an item into the inventory directly. This should not be used, in favor of the tes3 API function.
---|
---|**Accepts table parameters:**
---|* `mobile` (*tes3mobileActor|tes3reference|string*): The mobile actor whose stats will be updated. Optional.
---|* `item` (*tes3item*): The item to add.
---|* `itemData` (*tes3itemData*): Any associated item data to add. Optional.
---|* `count` (*number*): The number of items to add. Default: 1.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3inventory/addItem.html).
---@type method
---@param params table
function tes3inventory:addItem(params) end

--- Checks to see if the inventory contains an item. This should not be used, in favor of tes3 APIs.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3inventory/dropItem.html).
---@type method
---@param mobile tes3mobileActor|tes3reference|string { comment = "The mobile actor whose stats will be updated." }
---@param item tes3item|string { comment = "The item to drop." }
---@param itemData tes3itemData { comment = "If provided, it will check for the specific data to drop it." }
---@param count number { comment = "The number of items to drop." }
---@param position tes3vector3 { comment = "A vector determining placement location." }
---@param orientation tes3vector3 { comment = "A vector determining placement rotation." }
---@param unknown boolean
function tes3inventory:dropItem(mobile, item, itemData, count, position, orientation, unknown) end

--- Removes an item from the inventory directly. This should not be used, in favor of the tes3 API function.
---|
---|**Accepts table parameters:**
---|* `mobile` (*tes3mobileActor|tes3reference|string*): The mobile actor whose stats will be updated. Optional.
---|* `item` (*tes3item*): The item to add.
---|* `itemData` (*tes3itemData*): Any associated item data to add. Optional.
---|* `count` (*number*): The number of items to add. Default: 1.
---|* `deleteItemData` (*boolean*): If set, the itemData will be deleted after being removed.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3inventory/removeItem.html).
---@type method
---@param params table
function tes3inventory:removeItem(params) end

--- Resolves all contained leveled lists and adds the randomized items to the inventory. This should generally not be called directly.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3inventory/resolveLeveledItems.html).
---@type method
---@param mobile tes3mobileActor { comment = "The mobile actor whose stats will be updated.", optional = "after" }
function tes3inventory:resolveLeveledItems(mobile) end

--- Raw bit-based flags.
---@type number
tes3inventory.flags = nil

--- Checks to see if the inventory contains an item.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3inventory/contains.html).
---@type method
---@param item tes3item|string { comment = "The item to check for." }
---@param itemData tes3itemData { comment = "If provided, it will check for the specific data as well.", optional = "after" }
---@return boolean
function tes3inventory:contains(item, itemData) end


