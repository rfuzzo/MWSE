# tes3leveledCreature

A leveled creature game object.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3leveledCreature/__tostring
    tes3leveledCreature/boundingBox
    tes3leveledCreature/chanceForNothing
    tes3leveledCreature/count
    tes3leveledCreature/deleted
    tes3leveledCreature/disabled
    tes3leveledCreature/flags
    tes3leveledCreature/id
    tes3leveledCreature/list
    tes3leveledCreature/modified
    tes3leveledCreature/nextInCollection
    tes3leveledCreature/objectFlags
    tes3leveledCreature/objectType
    tes3leveledCreature/owningCollection
    tes3leveledCreature/previousInCollection
    tes3leveledCreature/scale
    tes3leveledCreature/sceneNode
    tes3leveledCreature/sceneReference
    tes3leveledCreature/sourceMod
    tes3leveledCreature/stolenList
```

#### [__tostring](tes3leveledCreature/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [boundingBox](tes3leveledCreature/boundingBox.md)

> The bounding box for the object.

#### [chanceForNothing](tes3leveledCreature/chanceForNothing.md)

> The percent chance, from 0 to 100, for no object to be chosen.

#### [count](tes3leveledCreature/count.md)

> The number of possible options in the leveled object container.

#### [deleted](tes3leveledCreature/deleted.md)

> The deleted state of the object.

#### [disabled](tes3leveledCreature/disabled.md)

> The disabled state of the object.

#### [flags](tes3leveledCreature/flags.md)

> A numerical representation of bit flags for the object.

#### [id](tes3leveledCreature/id.md)

> The unique identifier for the object.

#### [list](tes3leveledCreature/list.md)

> The collection that itself, containing tes3leveledListNodes.

#### [modified](tes3leveledCreature/modified.md)

> The modification state of the object since the last save.

#### [nextInCollection](tes3leveledCreature/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3leveledCreature/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3leveledCreature/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [owningCollection](tes3leveledCreature/owningCollection.md)

> The collection responsible for holding this object.

#### [previousInCollection](tes3leveledCreature/previousInCollection.md)

> The previous object in parent collection's list.

#### [scale](tes3leveledCreature/scale.md)

> The object's scale.

#### [sceneNode](tes3leveledCreature/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3leveledCreature/sceneReference.md)

> The scene graph reference node for this object.

#### [sourceMod](tes3leveledCreature/sourceMod.md)

> The filename of the mod that owns this object.

#### [stolenList](tes3leveledCreature/stolenList.md)

> A list of actors that the object has been stolen from.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3leveledCreature/pickFrom
```

#### [pickFrom](tes3leveledCreature/pickFrom.md)

> Chooses a random item from the list, based on the player's level.
