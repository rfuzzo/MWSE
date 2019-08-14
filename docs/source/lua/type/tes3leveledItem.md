# tes3leveledItem

A leveled creature game object.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3leveledItem/__tostring
    tes3leveledItem/boundingBox
    tes3leveledItem/chanceForNothing
    tes3leveledItem/count
    tes3leveledItem/deleted
    tes3leveledItem/disabled
    tes3leveledItem/flags
    tes3leveledItem/id
    tes3leveledItem/list
    tes3leveledItem/modified
    tes3leveledItem/nextInCollection
    tes3leveledItem/objectFlags
    tes3leveledItem/objectType
    tes3leveledItem/owningCollection
    tes3leveledItem/previousInCollection
    tes3leveledItem/scale
    tes3leveledItem/sceneNode
    tes3leveledItem/sceneReference
    tes3leveledItem/sourceMod
    tes3leveledItem/stolenList
```

#### [__tostring](tes3leveledItem/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [boundingBox](tes3leveledItem/boundingBox.md)

> The bounding box for the object.

#### [chanceForNothing](tes3leveledItem/chanceForNothing.md)

> The percent chance, from 0 to 100, for no object to be chosen.

#### [count](tes3leveledItem/count.md)

> The number of possible options in the leveled object container.

#### [deleted](tes3leveledItem/deleted.md)

> The deleted state of the object.

#### [disabled](tes3leveledItem/disabled.md)

> The disabled state of the object.

#### [flags](tes3leveledItem/flags.md)

> A numerical representation of bit flags for the object.

#### [id](tes3leveledItem/id.md)

> The unique identifier for the object.

#### [list](tes3leveledItem/list.md)

> The collection that itself, containing tes3leveledListNodes.

#### [modified](tes3leveledItem/modified.md)

> The modification state of the object since the last save.

#### [nextInCollection](tes3leveledItem/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3leveledItem/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3leveledItem/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [owningCollection](tes3leveledItem/owningCollection.md)

> The collection responsible for holding this object.

#### [previousInCollection](tes3leveledItem/previousInCollection.md)

> The previous object in parent collection's list.

#### [scale](tes3leveledItem/scale.md)

> The object's scale.

#### [sceneNode](tes3leveledItem/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3leveledItem/sceneReference.md)

> The scene graph reference node for this object.

#### [sourceMod](tes3leveledItem/sourceMod.md)

> The filename of the mod that owns this object.

#### [stolenList](tes3leveledItem/stolenList.md)

> A list of actors that the object has been stolen from.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3leveledItem/pickFrom
```

#### [pickFrom](tes3leveledItem/pickFrom.md)

> Chooses a random item from the list, based on the player's level.
