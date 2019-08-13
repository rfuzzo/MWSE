
--- The base-most object from which almost all NetImmerse structures are derived from.
---@class niObject
niObject = {}

--- Creates a copy of this object.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niObject/clone.html).
---@type method
---@return niObject
function niObject:clone() end

--- The number of references that exist for the given object. When this value hits zero, the object's memory is freed.
---@type string
niObject.references = nil

--- Determines if the object is of a given type, or of a type derived from the given type. Types can be found in the tes3.niType table.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niObject/isInstanceOfType.html).
---@type method
---@param type number
---@return boolean
function niObject:isInstanceOfType(type) end

--- The runtime type information for this object.
---@type niRTTI
niObject.runTimeTypeInformation = nil

--- Determines if the object is of a given type. Types can be found in the tes3.niType table.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niObject/isOfType.html).
---@type method
---@param type number
---@return boolean
function niObject:isOfType(type) end


