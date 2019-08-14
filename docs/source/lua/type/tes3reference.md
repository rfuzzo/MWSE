# tes3reference

A reference is a sort of container structure for objects. It holds a base object, as well as various variables associated with that object that make it unique.

For example, many doors may share the same base object. However, each door reference might have a different owner, different lock/trap statuses, etc. that make the object unique.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3reference/__tostring
    tes3reference/activationReference
    tes3reference/attachments
    tes3reference/cell
    tes3reference/context
    tes3reference/data
    tes3reference/deleted
    tes3reference/disabled
    tes3reference/id
    tes3reference/isEmpty
    tes3reference/isRespawn
    tes3reference/light
    tes3reference/lockNode
    tes3reference/mobile
    tes3reference/modified
    tes3reference/nextInCollection
    tes3reference/nextNode
    tes3reference/nodeData
    tes3reference/object
    tes3reference/objectFlags
    tes3reference/objectType
    tes3reference/orientation
    tes3reference/owningCollection
    tes3reference/position
    tes3reference/previousInCollection
    tes3reference/previousNode
    tes3reference/scale
    tes3reference/sceneNode
    tes3reference/sceneReference
    tes3reference/sourceMod
    tes3reference/stackSize
```

#### [__tostring](tes3reference/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [activationReference](tes3reference/activationReference.md)

> The current reference, if any, that this reference will activate.

#### [attachments](tes3reference/attachments.md)

> A table with friendly named access to all supported attachments.

#### [cell](tes3reference/cell.md)

> The cell that the reference is currently in.

#### [context](tes3reference/context.md)

> Access to the script context for this reference and its associated script.

#### [data](tes3reference/data.md)

> A generic lua table that data can be written to, and synced to/from the save. All information stored must be valid for serialization to json. For item references, this is the same table as on the tes3itemData structure.

#### [deleted](tes3reference/deleted.md)

> The deleted state of the object.

#### [disabled](tes3reference/disabled.md)

> The disabled state of the object.

#### [id](tes3reference/id.md)

> The unique identifier for the object.

#### [isEmpty](tes3reference/isEmpty.md)

> Friendly access onto the reference's empty inventory flag.

#### [isRespawn](tes3reference/isRespawn.md)

> If true, the references respawn flag is set.

#### [light](tes3reference/light.md)

> Direct access to the scene graph light, if a dynamic light is set.

#### [lockNode](tes3reference/lockNode.md)

> Quick access to the reference's lock node, if any.

#### [mobile](tes3reference/mobile.md)

> Access to the attached mobile object, if applicable.

#### [modified](tes3reference/modified.md)

> The modification state of the object since the last save.

#### [nextInCollection](tes3reference/nextInCollection.md)

> The next object in parent collection's list.

#### [nextNode](tes3reference/nextNode.md)

> The next reference in the parent reference list.

#### [nodeData](tes3reference/nodeData.md)

> Redundant access to this object, for iterating over a tes3referenceList.

#### [object](tes3reference/object.md)

> The object that the reference is for, such as a weapon, armor, or actor.

#### [objectFlags](tes3reference/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3reference/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [orientation](tes3reference/orientation.md)

> Access to the reference's orientation.

#### [owningCollection](tes3reference/owningCollection.md)

> The collection responsible for holding this object.

#### [position](tes3reference/position.md)

> Access to the reference's position.

#### [previousInCollection](tes3reference/previousInCollection.md)

> The previous object in parent collection's list.

#### [previousNode](tes3reference/previousNode.md)

> The previous reference in the parent reference list.

#### [scale](tes3reference/scale.md)

> The object's scale.

#### [sceneNode](tes3reference/sceneNode.md)

> The scene graph node that the reference uses for rendering.

#### [sceneReference](tes3reference/sceneReference.md)

> The scene graph reference node for this object.

#### [sourceMod](tes3reference/sourceMod.md)

> The filename of the mod that owns this object.

#### [stackSize](tes3reference/stackSize.md)

> Access to the size of a stack, if the reference represents one or more items.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3reference/activate
    tes3reference/clearActionFlag
    tes3reference/clone
    tes3reference/deleteDynamicLightAttachment
    tes3reference/detachDynamicLightFromAffectedNodes
    tes3reference/getAttachedDynamicLight
    tes3reference/getOrCreateAttachedDynamicLight
    tes3reference/setActionFlag
    tes3reference/testActionFlag
    tes3reference/updateEquipment
    tes3reference/updateSceneGraph
```

#### [activate](tes3reference/activate.md)

> Causes this reference to activate another. This will lead them to go through doors, pick up items, etc.

#### [clearActionFlag](tes3reference/clearActionFlag.md)

> Unsets a bit in the reference's action data attachment

#### [clone](tes3reference/clone.md)

> Clones a reference for a base actor into a reference to an instance of that actor. For example, this will force a container to resolve its leveled items and have its own unique inventory.

#### [deleteDynamicLightAttachment](tes3reference/deleteDynamicLightAttachment.md)

> Deletes the dynamic light attachment, if it exists. This will automatically detach the dynamic light from affected nodes.

#### [detachDynamicLightFromAffectedNodes](tes3reference/detachDynamicLightFromAffectedNodes.md)

> Removes the dynamic light from any affected scene graph nodes, but will not delete the associated attachment.

#### [getAttachedDynamicLight](tes3reference/getAttachedDynamicLight.md)

> Fetches the dynamic light attachment.

#### [getOrCreateAttachedDynamicLight](tes3reference/getOrCreateAttachedDynamicLight.md)

> Fetches the dynamic light attachment. If there isn't one, a new one will be created with the given light and value.

#### [setActionFlag](tes3reference/setActionFlag.md)

> Sets a bit in the reference's action data attachment

#### [testActionFlag](tes3reference/testActionFlag.md)

> Returns the flag's value in the reference's action data attachment

#### [updateEquipment](tes3reference/updateEquipment.md)

> Causes the reference, if of an actor, to reevaluate its equipment choices and equip items it should.

#### [updateSceneGraph](tes3reference/updateSceneGraph.md)

> Updates the reference's local rotation matrix, propagates position changes to the scene graph, and sets the reference's modified flag.
