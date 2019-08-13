
--- An exterior or interior game area.
---@class tes3cell : tes3baseObject
tes3cell = {}

--- One of the three reference collections for a cell.
---@type tes3referenceList
tes3cell.actors = nil

--- The cell's X grid coordinate. Only available on exterior cells.
---@type number
tes3cell.gridX = nil

--- The raw flags of the object.
---@type number
tes3cell.objectFlags = nil

--- The filename of the mod that owns this object.
---@type string
tes3cell.sourceMod = nil

--- If true, the player may not rest in the cell.
---@type boolean
tes3cell.restingIsIllegal = nil

--- One of the three reference collections for a cell.
---@type tes3referenceList
tes3cell.statics = nil

--- One of the three reference collections for a cell.
---@type tes3referenceList
tes3cell.activators = nil

--- The type of object. Maps to values in tes3.objectType.
---@type number
tes3cell.objectType = nil

--- If true, the cell is an interior.
---@type boolean
tes3cell.isInterior = nil

--- If true, the cell behaves as an exterior instead of an interior for certain properties. Only available on interior cells.
---@type boolean
tes3cell.behavesAsExterior = nil

--- The modification state of the object since the last save.
---@type boolean
tes3cell.modified = nil

--- The unique identifier for the object.
---@type string
tes3cell.id = nil

--- The region associated with the cell. Only available on exterior cells, or interior cells that behave as exterior cells.
---@type tes3region
tes3cell.region = nil

--- The cell's fog density. Only available on interior cells.
---@type number
tes3cell.fogDensity = nil

--- If true, the cell has water. Only applies to interior cells.
---@type boolean
tes3cell.hasWater = nil

--- The disabled state of the object.
---@type boolean
tes3cell.disabled = nil

--- The deleted state of the object.
---@type boolean
tes3cell.deleted = nil

--- The cell's sun color. Only available on interior cells.
---@type tes3packedColor
tes3cell.sunColor = nil

--- The cell's Y grid coordinate. Only available on exterior cells.
---@type number
tes3cell.gridY = nil

--- The name and id of the cell.
---@type string
tes3cell.name = nil

--- A numeric representation of the packed bit flags for the cell, typically accessed from other properties.
---@type number
tes3cell.cellFlags = nil

--- The cell's ambient color. Only available on interior cells.
---@type tes3packedColor
tes3cell.ambientColor = nil

--- Used in a for loop, iterates over objects in the cell.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3cell/iterateReferences.html).
---@type method
---@param filter number { comment = "The TES3 object type to filter results by.", optional = "after" }
function tes3cell:iterateReferences(filter) end

--- The water level in the cell. Only available on interior cells.
---@type number
tes3cell.waterLevel = nil

--- The cell's fog color. Only available on interior cells.
---@type tes3packedColor
tes3cell.fogColor = nil


