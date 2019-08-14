# tes3containerInstance

A container object that has been cloned. Typically represents a container that has been instanced by being opened by the player.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3containerInstance/__tostring
    tes3containerInstance/actorFlags
    tes3containerInstance/baseObject
    tes3containerInstance/boundingBox
    tes3containerInstance/cloneCount
    tes3containerInstance/deleted
    tes3containerInstance/disabled
    tes3containerInstance/equipment
    tes3containerInstance/id
    tes3containerInstance/inventory
    tes3containerInstance/isInstance
    tes3containerInstance/mesh
    tes3containerInstance/modified
    tes3containerInstance/name
    tes3containerInstance/nextInCollection
    tes3containerInstance/objectFlags
    tes3containerInstance/objectType
    tes3containerInstance/organic
    tes3containerInstance/owningCollection
    tes3containerInstance/previousInCollection
    tes3containerInstance/respawns
    tes3containerInstance/scale
    tes3containerInstance/sceneNode
    tes3containerInstance/sceneReference
    tes3containerInstance/script
    tes3containerInstance/sourceMod
    tes3containerInstance/stolenList
```

#### [__tostring](tes3containerInstance/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [actorFlags](tes3containerInstance/actorFlags.md)

> A number representing the actor flags. Truly a bit field.

#### [baseObject](tes3containerInstance/baseObject.md)

> The base container object that the instance inherits from.

#### [boundingBox](tes3containerInstance/boundingBox.md)

> The bounding box for the object.

#### [cloneCount](tes3containerInstance/cloneCount.md)

> The number of clones that exist of this actor.

#### [deleted](tes3containerInstance/deleted.md)

> The deleted state of the object.

#### [disabled](tes3containerInstance/disabled.md)

> The disabled state of the object.

#### [equipment](tes3containerInstance/equipment.md)

> The items currently equipped to the actor.

#### [id](tes3containerInstance/id.md)

> The unique identifier for the object.

#### [inventory](tes3containerInstance/inventory.md)

> The items currently carried by the actor.

#### [isInstance](tes3containerInstance/isInstance.md)

> Always returns true.

#### [mesh](tes3containerInstance/mesh.md)

> The path to the object's mesh.

#### [modified](tes3containerInstance/modified.md)

> The modification state of the object since the last save.

#### [name](tes3containerInstance/name.md)

> The player-facing name for the object.

#### [nextInCollection](tes3containerInstance/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3containerInstance/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3containerInstance/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [organic](tes3containerInstance/organic.md)

> Determines if the container's organic flag is enabled.

#### [owningCollection](tes3containerInstance/owningCollection.md)

> The collection responsible for holding this object.

#### [previousInCollection](tes3containerInstance/previousInCollection.md)

> The previous object in parent collection's list.

#### [respawns](tes3containerInstance/respawns.md)

> Determines if the container's respawn flag is enabled.

#### [scale](tes3containerInstance/scale.md)

> The object's scale.

#### [sceneNode](tes3containerInstance/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3containerInstance/sceneReference.md)

> The scene graph reference node for this object.

#### [script](tes3containerInstance/script.md)

> The script that runs on the object.

#### [sourceMod](tes3containerInstance/sourceMod.md)

> The filename of the mod that owns this object.

#### [stolenList](tes3containerInstance/stolenList.md)

> A list of actors that the object has been stolen from.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3containerInstance/onInventoryClose
```

#### [onInventoryClose](tes3containerInstance/onInventoryClose.md)

> A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
