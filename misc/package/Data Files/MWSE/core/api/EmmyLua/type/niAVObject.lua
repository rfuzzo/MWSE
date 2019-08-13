
--- The typical base type for most NetImmerse scene graph objects.
---@class niAVObject : niObjectNET
niAVObject = {}

--- The number of references that exist for the given object. When this value hits zero, the object's memory is freed.
---@type string
niAVObject.references = nil

--- Removes a controller from the object.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niAVObject/removeController.html).
---@type method
---@param type niTimeController
function niAVObject:removeController(type) end

--- Removes all controllers.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niAVObject/removeAllControllers.html).
---@type method
function niAVObject:removeAllControllers() end

--- The object's local rotation matrix.
---@type tes3matrix33
niAVObject.rotation = nil

--- Flags, dependent on the specific object type.
---@type number
niAVObject.flags = nil

--- The human-facing name of the given object.
---@type string
niAVObject.name = nil

--- Add a controller to the object as the first controller.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niAVObject/prependController.html).
---@type method
---@param type niTimeController
function niAVObject:prependController(type) end

--- Determines if the object is of a given type, or of a type derived from the given type. Types can be found in the tes3.niType table.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niAVObject/isInstanceOfType.html).
---@type method
---@param type number
---@return boolean
function niAVObject:isInstanceOfType(type) end

--- The runtime type information for this object.
---@type niRTTI
niAVObject.runTimeTypeInformation = nil

--- Determines if the object is of a given type. Types can be found in the tes3.niType table.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niAVObject/isOfType.html).
---@type method
---@param type number
---@return boolean
function niAVObject:isOfType(type) end

--- Creates a copy of this object.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/niAVObject/clone.html).
---@type method
---@return niObject
function niAVObject:clone() end


