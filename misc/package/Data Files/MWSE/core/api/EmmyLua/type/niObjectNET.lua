
--- An object that has a name, extra data, and controllers.
---@class niObjectNET : niObject
niObjectNET = {}

--- The number of references that exist for the given object. When this value hits zero, the object's memory is freed.
---@type string
niObjectNET.references = nil

--- Removes a controller from the object.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niObjectNET/removeController.html).
---@type method
---@param type niTimeController
function niObjectNET:removeController(type) end

--- Creates a copy of this object.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niObjectNET/clone.html).
---@type method
---@return niObject
function niObjectNET:clone() end

--- The human-facing name of the given object.
---@type string
niObjectNET.name = nil

--- Add a controller to the object as the first controller.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niObjectNET/prependController.html).
---@type method
---@param type niTimeController
function niObjectNET:prependController(type) end

--- Determines if the object is of a given type, or of a type derived from the given type. Types can be found in the tes3.niType table.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niObjectNET/isInstanceOfType.html).
---@type method
---@param type number
---@return boolean
function niObjectNET:isInstanceOfType(type) end

--- The runtime type information for this object.
---@type niRTTI
niObjectNET.runTimeTypeInformation = nil

--- Determines if the object is of a given type. Types can be found in the tes3.niType table.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niObjectNET/isOfType.html).
---@type method
---@param type number
---@return boolean
function niObjectNET:isOfType(type) end

--- Removes all controllers.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niObjectNET/removeAllControllers.html).
---@type method
function niObjectNET:removeAllControllers() end


