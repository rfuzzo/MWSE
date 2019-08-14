# tes3faction

A faction game object.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3faction/__tostring
    tes3faction/actorFlags
    tes3faction/attributes
    tes3faction/boundingBox
    tes3faction/cloneCount
    tes3faction/deleted
    tes3faction/disabled
    tes3faction/equipment
    tes3faction/id
    tes3faction/inventory
    tes3faction/modified
    tes3faction/name
    tes3faction/nextInCollection
    tes3faction/objectFlags
    tes3faction/objectType
    tes3faction/owningCollection
    tes3faction/playerExpelled
    tes3faction/playerJoined
    tes3faction/playerRank
    tes3faction/playerReputation
    tes3faction/previousInCollection
    tes3faction/ranks
    tes3faction/reactions
    tes3faction/scale
    tes3faction/sceneNode
    tes3faction/sceneReference
    tes3faction/skills
    tes3faction/sourceMod
    tes3faction/stolenList
```

#### [__tostring](tes3faction/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [actorFlags](tes3faction/actorFlags.md)

> A number representing the actor flags. Truly a bit field.

#### [attributes](tes3faction/attributes.md)

> An array-style table holding the two attributes that govern advancement.

#### [boundingBox](tes3faction/boundingBox.md)

> The bounding box for the object.

#### [cloneCount](tes3faction/cloneCount.md)

> The number of clones that exist of this actor.

#### [deleted](tes3faction/deleted.md)

> The deleted state of the object.

#### [disabled](tes3faction/disabled.md)

> The disabled state of the object.

#### [equipment](tes3faction/equipment.md)

> The items currently equipped to the actor.

#### [id](tes3faction/id.md)

> The unique identifier for the object.

#### [inventory](tes3faction/inventory.md)

> The items currently carried by the actor.

#### [modified](tes3faction/modified.md)

> The modification state of the object since the last save.

#### [name](tes3faction/name.md)

> The faction's player-facing name.

#### [nextInCollection](tes3faction/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3faction/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3faction/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [owningCollection](tes3faction/owningCollection.md)

> The collection responsible for holding this object.

#### [playerExpelled](tes3faction/playerExpelled.md)

> The player's expelled state in the faction.

#### [playerJoined](tes3faction/playerJoined.md)

> The player's join state for the faction.

#### [playerRank](tes3faction/playerRank.md)

> The player's current rank in the faction.

#### [playerReputation](tes3faction/playerReputation.md)

> The player's current reputation in the faction.

#### [previousInCollection](tes3faction/previousInCollection.md)

> The previous object in parent collection's list.

#### [ranks](tes3faction/ranks.md)

> An array-style table holding the ten related tes3factionRanks.

#### [reactions](tes3faction/reactions.md)

> A collection of tes3factionReactions.

#### [scale](tes3faction/scale.md)

> The object's scale.

#### [sceneNode](tes3faction/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3faction/sceneReference.md)

> The scene graph reference node for this object.

#### [skills](tes3faction/skills.md)

> An array-style table holding the seven skills that govern advancement.

#### [sourceMod](tes3faction/sourceMod.md)

> The filename of the mod that owns this object.

#### [stolenList](tes3faction/stolenList.md)

> A list of actors that the object has been stolen from.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3faction/onInventoryClose
```

#### [onInventoryClose](tes3faction/onInventoryClose.md)

> A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
