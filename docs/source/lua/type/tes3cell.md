# tes3cell

An exterior or interior game area.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3cell/__tostring
    tes3cell/activators
    tes3cell/actors
    tes3cell/ambientColor
    tes3cell/behavesAsExterior
    tes3cell/cellFlags
    tes3cell/deleted
    tes3cell/disabled
    tes3cell/fogColor
    tes3cell/fogDensity
    tes3cell/gridX
    tes3cell/gridY
    tes3cell/hasWater
    tes3cell/id
    tes3cell/isInterior
    tes3cell/modified
    tes3cell/name
    tes3cell/objectFlags
    tes3cell/objectType
    tes3cell/region
    tes3cell/restingIsIllegal
    tes3cell/sourceMod
    tes3cell/statics
    tes3cell/sunColor
    tes3cell/waterLevel
```

#### [__tostring](tes3cell/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [activators](tes3cell/activators.md)

> One of the three reference collections for a cell.

#### [actors](tes3cell/actors.md)

> One of the three reference collections for a cell.

#### [ambientColor](tes3cell/ambientColor.md)

> The cell's ambient color. Only available on interior cells.

#### [behavesAsExterior](tes3cell/behavesAsExterior.md)

> If true, the cell behaves as an exterior instead of an interior for certain properties. Only available on interior cells.

#### [cellFlags](tes3cell/cellFlags.md)

> A numeric representation of the packed bit flags for the cell, typically accessed from other properties.

#### [deleted](tes3cell/deleted.md)

> The deleted state of the object.

#### [disabled](tes3cell/disabled.md)

> The disabled state of the object.

#### [fogColor](tes3cell/fogColor.md)

> The cell's fog color. Only available on interior cells.

#### [fogDensity](tes3cell/fogDensity.md)

> The cell's fog density. Only available on interior cells.

#### [gridX](tes3cell/gridX.md)

> The cell's X grid coordinate. Only available on exterior cells.

#### [gridY](tes3cell/gridY.md)

> The cell's Y grid coordinate. Only available on exterior cells.

#### [hasWater](tes3cell/hasWater.md)

> If true, the cell has water. Only applies to interior cells.

#### [id](tes3cell/id.md)

> The unique identifier for the object.

#### [isInterior](tes3cell/isInterior.md)

> If true, the cell is an interior.

#### [modified](tes3cell/modified.md)

> The modification state of the object since the last save.

#### [name](tes3cell/name.md)

> The name and id of the cell.

#### [objectFlags](tes3cell/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3cell/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [region](tes3cell/region.md)

> The region associated with the cell. Only available on exterior cells, or interior cells that behave as exterior cells.

#### [restingIsIllegal](tes3cell/restingIsIllegal.md)

> If true, the player may not rest in the cell.

#### [sourceMod](tes3cell/sourceMod.md)

> The filename of the mod that owns this object.

#### [statics](tes3cell/statics.md)

> One of the three reference collections for a cell.

#### [sunColor](tes3cell/sunColor.md)

> The cell's sun color. Only available on interior cells.

#### [waterLevel](tes3cell/waterLevel.md)

> The water level in the cell. Only available on interior cells.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3cell/iterateReferences
```

#### [iterateReferences](tes3cell/iterateReferences.md)

> Used in a for loop, iterates over objects in the cell.
