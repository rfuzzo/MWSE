# tes3actor

An Actor (not to be confused with a Mobile Actor) is an object that can be cloned and that has an inventory. Creatures, NPCs, and containers are all considered actors.

It is standard for creatures and NPCs to be composed of an actor and a mobile actor, linked together with a reference.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3actor/__tostring
    tes3actor/actorFlags
    tes3actor/boundingBox
    tes3actor/cloneCount
    tes3actor/deleted
    tes3actor/disabled
    tes3actor/equipment
    tes3actor/id
    tes3actor/inventory
    tes3actor/modified
    tes3actor/nextInCollection
    tes3actor/objectFlags
    tes3actor/objectType
    tes3actor/owningCollection
    tes3actor/previousInCollection
    tes3actor/scale
    tes3actor/sceneNode
    tes3actor/sceneReference
    tes3actor/sourceMod
    tes3actor/stolenList
```

#### [__tostring](tes3actor/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [actorFlags](tes3actor/actorFlags.md)

> A number representing the actor flags. Truly a bit field.

#### [boundingBox](tes3actor/boundingBox.md)

> The bounding box for the object.

#### [cloneCount](tes3actor/cloneCount.md)

> The number of clones that exist of this actor.

#### [deleted](tes3actor/deleted.md)

> The deleted state of the object.

#### [disabled](tes3actor/disabled.md)

> The disabled state of the object.

#### [equipment](tes3actor/equipment.md)

> The items currently equipped to the actor.

#### [id](tes3actor/id.md)

> The unique identifier for the object.

#### [inventory](tes3actor/inventory.md)

> The items currently carried by the actor.

#### [modified](tes3actor/modified.md)

> The modification state of the object since the last save.

#### [nextInCollection](tes3actor/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3actor/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3actor/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [owningCollection](tes3actor/owningCollection.md)

> The collection responsible for holding this object.

#### [previousInCollection](tes3actor/previousInCollection.md)

> The previous object in parent collection's list.

#### [scale](tes3actor/scale.md)

> The object's scale.

#### [sceneNode](tes3actor/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3actor/sceneReference.md)

> The scene graph reference node for this object.

#### [sourceMod](tes3actor/sourceMod.md)

> The filename of the mod that owns this object.

#### [stolenList](tes3actor/stolenList.md)

> A list of actors that the object has been stolen from.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3actor/onInventoryClose
```

#### [onInventoryClose](tes3actor/onInventoryClose.md)

> A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
