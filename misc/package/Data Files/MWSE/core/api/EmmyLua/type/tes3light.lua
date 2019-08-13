
--- A core light object. This isn't actually a light in the rendering engine, but something like a lamp or torch.
---@class tes3light : tes3physicalObject
tes3light = {}

--- The disabled state of the object.
---@type boolean
tes3light.disabled = nil

--- The filename of the mod that owns this object.
---@type string
tes3light.sourceMod = nil

--- Access to the light's flags, determining if the light affects dynamically moving objects.
---@type boolean
tes3light.isDynamic = nil

--- The weight, in pounds, of the object.
---@type number
tes3light.weight = nil

--- The value of the object.
---@type number
tes3light.value = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3light.objectType = nil

--- The sound that runs on the object.
---@type tes3sound
tes3light.sound = nil

--- The bounding box for the object.
---@type tes3boundingBox
tes3light.boundingBox = nil

--- The base radius of the light.
---@type number
tes3light.radius = nil

--- A list of actors that the object has been stolen from.
---@type tes3iterator
tes3light.stolenList = nil

--- The player-facing name for the object.
---@type string
tes3light.name = nil

--- Access to the light's flags, determining if the light won't be active initially.
---@type boolean
tes3light.isOffByDefault = nil

--- Access to the light's flags, determining if the light attenuation pulses.
---@type boolean
tes3light.pulses = nil

--- The deleted state of the object.
---@type boolean
tes3light.deleted = nil

--- The object's scale.
---@type number
tes3light.scale = nil

--- Access to the light's flags, determining if the object creates darkness.
---@type boolean
tes3light.isNegative = nil

--- The path to the object's mesh.
---@type string
tes3light.mesh = nil

--- The modification state of the object since the last save.
---@type boolean
tes3light.modified = nil

--- The raw flags of the object.
---@type number
tes3light.objectFlags = nil

--- Access to the light's flags, determining if the light attenuation pulses slowly.
---@type boolean
tes3light.pulsesSlowly = nil

--- Access to the light's flags, determining if the light can be carried.
---@type boolean
tes3light.canCarry = nil

--- Access to the light's flags, determining if the light attenuation flickers slowly.
---@type boolean
tes3light.flickersSlowly = nil

--- The unique identifier for the object.
---@type string
tes3light.id = nil

--- Access to the light's flags, determining if the light attenuation flickers.
---@type boolean
tes3light.flickers = nil

--- Gets the time remaining for a light, given a tes3itemData, tes3reference, or tes3equipmentStack.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3light/getTimeLeft.html).
---@type method
---@param data tes3reference|tes3itemData|tes3equipmentStack
---@return number
function tes3light:getTimeLeft(data) end

--- The previous object in parent collection's list.
---@type tes3object
tes3light.previousInCollection = nil

--- The amount of time that the light will last.
---@type number
tes3light.time = nil

--- The scene graph reference node for this object.
---@type niNode
tes3light.sceneReference = nil

--- The path to the object's icon.
---@type string
tes3light.icon = nil

--- The scene graph node for this object.
---@type niNode
tes3light.sceneNode = nil

--- The collection responsible for holding this object.
---@type tes3referenceList
tes3light.owningCollection = nil

--- The next object in parent collection's list.
---@type tes3object
tes3light.nextInCollection = nil

--- The script that runs on the object.
---@type tes3script
tes3light.script = nil

--- Access to the light's flags, determining if the light represents flame.
---@type boolean
tes3light.isFire = nil


