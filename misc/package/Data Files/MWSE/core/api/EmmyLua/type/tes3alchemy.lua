
--- An alchemy game object.
---@class tes3alchemy : tes3physicalObject
tes3alchemy = {}

--- The deleted state of the object.
---@type boolean
tes3alchemy.deleted = nil

--- The disabled state of the object.
---@type boolean
tes3alchemy.disabled = nil

--- The object's scale.
---@type number
tes3alchemy.scale = nil

--- The filename of the mod that owns this object.
---@type string
tes3alchemy.sourceMod = nil

--- The weight, in pounds, of the object.
---@type number
tes3alchemy.weight = nil

--- The value of the object.
---@type number
tes3alchemy.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3alchemy.objectType = nil

--- The path to the object's icon.
---@type string
tes3alchemy.icon = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3alchemy.boundingBox = nil

--- The scene graph node for this object.
---@type niNode
tes3alchemy.sceneNode = nil

--- The scene graph reference node for this object.
---@type niNode
tes3alchemy.sceneReference = nil

--- The previous object in parent collection's list.
---@type tes3object
tes3alchemy.previousInCollection = nil

--- The unique identifier for the object.
---@type string
tes3alchemy.id = nil

--- The modification state of the object since the last save.
---@type boolean
tes3alchemy.modified = nil

--- Creates a new alchemy item, which will be stored as part of the current saved game.
---|
---|**Accepts table parameters:**
---|* `id` (*string*): The new object's ID. Must be unique.
---|* `name` (*string*): The new item's name. Default: "Potion".
---|* `script` (*tes3script*): A script to attach to the object. Optional.
---|* `mesh` (*string*): The mesh to use for the object. Default: "m\Misc_Potion_Bargain_01.nif".
---|* `icon` (*string*): The icon to use for the object. Default: "m\Tx_potion_bargain_01.nif".
---|* `objectFlags` (*number*): The object flags initially set. Force set as modified. Default: 0.
---|* `weight` (*number*): The new item's weight. Default: 0.
---|* `value` (*number*): The new item's value. Default: 0.
---|* `flags` (*number*): The new alchemy item's flags. Default: 0.
---|* `effects` (*table*): A table of effects described, providing values for id, skill, attribute, range, radius, duration, min, and/or max.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3alchemy/create.html).
---@type function
---@param params table
function tes3alchemy.create(params) end

--- If set, the value of the object is automatically calculated.
---@type boolean
tes3alchemy.autoCalc = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3alchemy.stolenList = nil

--- The raw flags of the object.
---@type number
tes3alchemy.objectFlags = nil

--- The player-facing name for the object.
---@type string
tes3alchemy.name = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3alchemy.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3alchemy.nextInCollection = nil

--- The script that runs on the object.
---@type tes3script
tes3alchemy.script = nil

--- The path to the object's mesh.
---@type string
tes3alchemy.mesh = nil


