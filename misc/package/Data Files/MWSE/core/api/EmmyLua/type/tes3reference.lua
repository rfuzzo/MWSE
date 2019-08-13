
--- A reference is a sort of container structure for objects. It holds a base object, as well as various variables associated with that object that make it unique.
---|
---|For example, many doors may share the same base object. However, each door reference might have a different owner, different lock/trap statuses, etc. that make the object unique.
---@class tes3reference : tes3object
tes3reference = {}

--- The disabled state of the object.
---@type boolean
tes3reference.disabled = nil

--- The previous reference in the parent reference list.
---@type tes3reference
tes3reference.previousNode = nil

--- The filename of the mod that owns this object.
---@type string
tes3reference.sourceMod = nil

--- The cell that the reference is currently in.
---@type tes3cell
tes3reference.cell = nil

--- Access to the size of a stack, if the reference represents one or more items.
---@type number
tes3reference.stackSize = nil

--- The scene graph node that the reference uses for rendering.
---@type niNode
tes3reference.sceneNode = nil

--- Causes the reference, if of an actor, to reevaluate its equipment choices and equip items it should.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/updateEquipment.html).
---@type method
function tes3reference:updateEquipment() end

--- Friendly access onto the reference's empty inventory flag.
---@type boolean
tes3reference.isEmpty = nil

--- Clones a reference for a base actor into a reference to an instance of that actor. For example, this will force a container to resolve its leveled items and have its own unique inventory.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/clone.html).
---@type method
---@return boolean
function tes3reference:clone() end

--- Access to the reference's position.
---@type tes3vector3
tes3reference.position = nil

--- Fetches the dynamic light attachment.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/getAttachedDynamicLight.html).
---@type method
---@return tes3lightNode
function tes3reference:getAttachedDynamicLight() end

--- The deleted state of the object.
---@type boolean
tes3reference.deleted = nil

--- Causes this reference to activate another. This will lead them to go through doors, pick up items, etc.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/activate.html).
---@type method
---@param reference tes3reference { comment = "The other reference to activate." }
function tes3reference:activate(reference) end

--- Returns the flag's value in the reference's action data attachment
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/testActionFlag.html).
---@type method
---@param flagIndex number { comment = "The action flag to clear." }
---@return boolean
function tes3reference:testActionFlag(flagIndex) end

--- Unsets a bit in the reference's action data attachment
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/clearActionFlag.html).
---@type method
---@param flagIndex number { comment = "The action flag to clear." }
function tes3reference:clearActionFlag(flagIndex) end

--- The modification state of the object since the last save.
---@type boolean
tes3reference.modified = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3reference.objectType = nil

--- Removes the dynamic light from any affected scene graph nodes, but will not delete the associated attachment.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/detachDynamicLightFromAffectedNodes.html).
---@type method
function tes3reference:detachDynamicLightFromAffectedNodes() end

--- The unique identifier for the object.
---@type string
tes3reference.id = nil

--- Quick access to the reference's lock node, if any.
---@type tes3lockNode
tes3reference.lockNode = nil

--- The next reference in the parent reference list.
---@type tes3reference
tes3reference.nextNode = nil

--- Access to the script context for this reference and its associated script.
---@type tes3scriptContext
tes3reference.context = nil

--- Direct access to the scene graph light, if a dynamic light is set.
---@type niPointLight
tes3reference.light = nil

--- The raw flags of the object.
---@type number
tes3reference.objectFlags = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3reference.owningCollection = nil

--- Sets a bit in the reference's action data attachment
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/setActionFlag.html).
---@type method
---@param flagIndex number { comment = "The action flag to clear." }
function tes3reference:setActionFlag(flagIndex) end

--- The previous object in parent collection's list.
---@type tes3object
tes3reference.previousInCollection = nil

--- Redundant access to this object, for iterating over a tes3referenceList.
---@type tes3reference
tes3reference.nodeData = nil

--- Updates the reference's local rotation matrix, propagates position changes to the scene graph, and sets the reference's modified flag.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/updateSceneGraph.html).
---@type method
function tes3reference:updateSceneGraph() end

--- The object's scale.
---@type number
tes3reference.scale = nil

--- Deletes the dynamic light attachment, if it exists. This will automatically detach the dynamic light from affected nodes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/deleteDynamicLightAttachment.html).
---@type method
function tes3reference:deleteDynamicLightAttachment() end

--- The current reference, if any, that this reference will activate.
---@type tes3reference
tes3reference.activationReference = nil

--- Access to the attached mobile object, if applicable.
---@type tes3mobileObject
tes3reference.mobile = nil

--- The object that the reference is for, such as a weapon, armor, or actor.
---@type tes3physicalObject
tes3reference.object = nil

--- The scene graph reference node for this object.
---@type niNode
tes3reference.sceneReference = nil

--- Access to the reference's orientation.
---@type tes3vector3
tes3reference.orientation = nil

--- The next object in parent collection's list.
---@type tes3object
tes3reference.nextInCollection = nil

--- If true, the references respawn flag is set.
---@type boolean
tes3reference.isRespawn = nil

--- Fetches the dynamic light attachment. If there isn't one, a new one will be created with the given light and value.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3reference/getOrCreateAttachedDynamicLight.html).
---@type method
---@param light niPointLight
---@param value number
---@return tes3lightNode
function tes3reference:getOrCreateAttachedDynamicLight(light, value) end


