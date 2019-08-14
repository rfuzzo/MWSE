# tes3container

A container object that has not been cloned. Typically represents the raw information edited in the construction set.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3container/__tostring
    tes3container/actorFlags
    tes3container/boundingBox
    tes3container/capacity
    tes3container/cloneCount
    tes3container/deleted
    tes3container/disabled
    tes3container/equipment
    tes3container/id
    tes3container/inventory
    tes3container/isInstance
    tes3container/mesh
    tes3container/modified
    tes3container/name
    tes3container/nextInCollection
    tes3container/objectFlags
    tes3container/objectType
    tes3container/organic
    tes3container/owningCollection
    tes3container/previousInCollection
    tes3container/respawns
    tes3container/scale
    tes3container/sceneNode
    tes3container/sceneReference
    tes3container/script
    tes3container/sourceMod
    tes3container/stolenList
```

#### [__tostring](tes3container/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [actorFlags](tes3container/actorFlags.md)

> A number representing the actor flags. Truly a bit field.

#### [boundingBox](tes3container/boundingBox.md)

> The bounding box for the object.

#### [capacity](tes3container/capacity.md)

> The amount of weight, in pounds, that the container can hold.

#### [cloneCount](tes3container/cloneCount.md)

> The number of clones that exist of this actor.

#### [deleted](tes3container/deleted.md)

> The deleted state of the object.

#### [disabled](tes3container/disabled.md)

> The disabled state of the object.

#### [equipment](tes3container/equipment.md)

> The items currently equipped to the actor.

#### [id](tes3container/id.md)

> The unique identifier for the object.

#### [inventory](tes3container/inventory.md)

> The items currently carried by the actor.

#### [isInstance](tes3container/isInstance.md)

> Always returns false.

#### [mesh](tes3container/mesh.md)

> The path to the object's mesh.

#### [modified](tes3container/modified.md)

> The modification state of the object since the last save.

#### [name](tes3container/name.md)

> The player-facing name for the object.

#### [nextInCollection](tes3container/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3container/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3container/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [organic](tes3container/organic.md)

> Determines if the container's organic flag is enabled.

#### [owningCollection](tes3container/owningCollection.md)

> The collection responsible for holding this object.

#### [previousInCollection](tes3container/previousInCollection.md)

> The previous object in parent collection's list.

#### [respawns](tes3container/respawns.md)

> Determines if the container's respawn flag is enabled.

#### [scale](tes3container/scale.md)

> The object's scale.

#### [sceneNode](tes3container/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3container/sceneReference.md)

> The scene graph reference node for this object.

#### [script](tes3container/script.md)

> The script that runs on the object.

#### [sourceMod](tes3container/sourceMod.md)

> The filename of the mod that owns this object.

#### [stolenList](tes3container/stolenList.md)

> A list of actors that the object has been stolen from.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3container/onInventoryClose
```

#### [onInventoryClose](tes3container/onInventoryClose.md)

> A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
