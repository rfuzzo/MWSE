# tes3npcInstance

An NPC object that has been cloned. Typically represents an NPC that has been instanced in the world.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3npcInstance/__tostring
    tes3npcInstance/actorFlags
    tes3npcInstance/aiConfig
    tes3npcInstance/attributes
    tes3npcInstance/barterGold
    tes3npcInstance/baseObject
    tes3npcInstance/boundingBox
    tes3npcInstance/class
    tes3npcInstance/cloneCount
    tes3npcInstance/deleted
    tes3npcInstance/disabled
    tes3npcInstance/disposition
    tes3npcInstance/equipment
    tes3npcInstance/faction
    tes3npcInstance/factionIndex
    tes3npcInstance/fatigue
    tes3npcInstance/health
    tes3npcInstance/id
    tes3npcInstance/inventory
    tes3npcInstance/isAttacked
    tes3npcInstance/isEssential
    tes3npcInstance/isInstance
    tes3npcInstance/isRespawn
    tes3npcInstance/level
    tes3npcInstance/magicka
    tes3npcInstance/modified
    tes3npcInstance/name
    tes3npcInstance/nextInCollection
    tes3npcInstance/objectFlags
    tes3npcInstance/objectType
    tes3npcInstance/owningCollection
    tes3npcInstance/previousInCollection
    tes3npcInstance/race
    tes3npcInstance/scale
    tes3npcInstance/sceneNode
    tes3npcInstance/sceneReference
    tes3npcInstance/script
    tes3npcInstance/skills
    tes3npcInstance/sourceMod
    tes3npcInstance/spells
    tes3npcInstance/stolenList
```

#### [__tostring](tes3npcInstance/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [actorFlags](tes3npcInstance/actorFlags.md)

> A number representing the actor flags. Truly a bit field.

#### [aiConfig](tes3npcInstance/aiConfig.md)

> A substructure off of actors that contains information on the current AI configuration.

#### [attributes](tes3npcInstance/attributes.md)

> Quick access to the base NPC's attributes.

#### [barterGold](tes3npcInstance/barterGold.md)

> Quick access to the base NPC's base amount of barter gold.

#### [baseObject](tes3npcInstance/baseObject.md)

> Access to the base NPC object.

#### [boundingBox](tes3npcInstance/boundingBox.md)

> The bounding box for the object.

#### [class](tes3npcInstance/class.md)

> Quick access to the base NPC's class.

#### [cloneCount](tes3npcInstance/cloneCount.md)

> The number of clones that exist of this actor.

#### [deleted](tes3npcInstance/deleted.md)

> The deleted state of the object.

#### [disabled](tes3npcInstance/disabled.md)

> The disabled state of the object.

#### [disposition](tes3npcInstance/disposition.md)

> The actor's base disposition.

#### [equipment](tes3npcInstance/equipment.md)

> The items currently equipped to the actor.

#### [faction](tes3npcInstance/faction.md)

> Quick access to the base NPC's faction.

#### [factionIndex](tes3npcInstance/factionIndex.md)

> No description available.

#### [fatigue](tes3npcInstance/fatigue.md)

> Quick access to the base NPC's fatigue.

#### [health](tes3npcInstance/health.md)

> Quick access to the base NPC's health.

#### [id](tes3npcInstance/id.md)

> The unique identifier for the object.

#### [inventory](tes3npcInstance/inventory.md)

> The items currently carried by the actor.

#### [isAttacked](tes3npcInstance/isAttacked.md)

> If true, the actor's attacked flag is set.

#### [isEssential](tes3npcInstance/isEssential.md)

> If true, the actor's essential flag is set.

#### [isInstance](tes3npcInstance/isInstance.md)

> Always returns true.

#### [isRespawn](tes3npcInstance/isRespawn.md)

> If true, the actor's respawn flag is set.

#### [level](tes3npcInstance/level.md)

> Quick access to the base NPC's level.

#### [magicka](tes3npcInstance/magicka.md)

> Quick access to the base NPC's magicka.

#### [modified](tes3npcInstance/modified.md)

> The modification state of the object since the last save.

#### [name](tes3npcInstance/name.md)

> Quick access to the base NPC's name.

#### [nextInCollection](tes3npcInstance/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3npcInstance/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3npcInstance/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [owningCollection](tes3npcInstance/owningCollection.md)

> The collection responsible for holding this object.

#### [previousInCollection](tes3npcInstance/previousInCollection.md)

> The previous object in parent collection's list.

#### [race](tes3npcInstance/race.md)

> Quick access to the base NPC's race.

#### [scale](tes3npcInstance/scale.md)

> The object's scale.

#### [sceneNode](tes3npcInstance/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3npcInstance/sceneReference.md)

> The scene graph reference node for this object.

#### [script](tes3npcInstance/script.md)

> Quick access to the base NPC's script.

#### [skills](tes3npcInstance/skills.md)

> Quick access to the base NPC's skills.

#### [sourceMod](tes3npcInstance/sourceMod.md)

> The filename of the mod that owns this object.

#### [spells](tes3npcInstance/spells.md)

> Quick access to the base NPC's spell list.

#### [stolenList](tes3npcInstance/stolenList.md)

> A list of actors that the object has been stolen from.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3npcInstance/onInventoryClose
```

#### [onInventoryClose](tes3npcInstance/onInventoryClose.md)

> A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
