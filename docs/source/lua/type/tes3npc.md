# tes3npc

An NPC object that has not been cloned. Typically represents the raw information edited in the construction set.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3npc/__tostring
    tes3npc/actorFlags
    tes3npc/aiConfig
    tes3npc/attributes
    tes3npc/autoCalc
    tes3npc/barterGold
    tes3npc/boundingBox
    tes3npc/class
    tes3npc/cloneCount
    tes3npc/deleted
    tes3npc/disabled
    tes3npc/disposition
    tes3npc/equipment
    tes3npc/faction
    tes3npc/factionIndex
    tes3npc/factionRank
    tes3npc/fatigue
    tes3npc/female
    tes3npc/hair
    tes3npc/head
    tes3npc/health
    tes3npc/id
    tes3npc/inventory
    tes3npc/isAttacked
    tes3npc/isEssential
    tes3npc/isInstance
    tes3npc/isRespawn
    tes3npc/level
    tes3npc/magicka
    tes3npc/mesh
    tes3npc/modified
    tes3npc/name
    tes3npc/nextInCollection
    tes3npc/objectFlags
    tes3npc/objectType
    tes3npc/owningCollection
    tes3npc/previousInCollection
    tes3npc/race
    tes3npc/reputation
    tes3npc/scale
    tes3npc/sceneNode
    tes3npc/sceneReference
    tes3npc/script
    tes3npc/skills
    tes3npc/sourceMod
    tes3npc/spells
    tes3npc/stolenList
```

#### [__tostring](tes3npc/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [actorFlags](tes3npc/actorFlags.md)

> A number representing the actor flags. Truly a bit field.

#### [aiConfig](tes3npc/aiConfig.md)

> A substructure off of actors that contains information on the current AI configuration.

#### [attributes](tes3npc/attributes.md)

> A table of eight numbers, representing the base values for the actor's attributes.

#### [autoCalc](tes3npc/autoCalc.md)

> Direct access to the actor autocalc flag.

#### [barterGold](tes3npc/barterGold.md)

> The actor's max health.

#### [boundingBox](tes3npc/boundingBox.md)

> The bounding box for the object.

#### [class](tes3npc/class.md)

> The class that the NPC uses.

#### [cloneCount](tes3npc/cloneCount.md)

> The number of clones that exist of this actor.

#### [deleted](tes3npc/deleted.md)

> The deleted state of the object.

#### [disabled](tes3npc/disabled.md)

> The disabled state of the object.

#### [disposition](tes3npc/disposition.md)

> The actor's base disposition.

#### [equipment](tes3npc/equipment.md)

> The items currently equipped to the actor.

#### [faction](tes3npc/faction.md)

> The class that the NPC is joined to.

#### [factionIndex](tes3npc/factionIndex.md)

> No description available.

#### [factionRank](tes3npc/factionRank.md)

> The NPC's rank in their faction.

#### [fatigue](tes3npc/fatigue.md)

> The actor's max fatigue.

#### [female](tes3npc/female.md)

> Direct access to the actor female flag.

#### [hair](tes3npc/hair.md)

> The hair body part that the NPC will use.

#### [head](tes3npc/head.md)

> The head body part that the NPC will use.

#### [health](tes3npc/health.md)

> The actor's max health.

#### [id](tes3npc/id.md)

> The unique identifier for the object.

#### [inventory](tes3npc/inventory.md)

> The items currently carried by the actor.

#### [isAttacked](tes3npc/isAttacked.md)

> If true, the actor's attacked flag is set.

#### [isEssential](tes3npc/isEssential.md)

> If true, the actor's essential flag is set.

#### [isInstance](tes3npc/isInstance.md)

> Always returns false.

#### [isRespawn](tes3npc/isRespawn.md)

> If true, the actor's respawn flag is set.

#### [level](tes3npc/level.md)

> The actor's level.

#### [magicka](tes3npc/magicka.md)

> The actor's max magicka.

#### [mesh](tes3npc/mesh.md)

> The path to the object's mesh.

#### [modified](tes3npc/modified.md)

> The modification state of the object since the last save.

#### [name](tes3npc/name.md)

> The player-facing name for the object.

#### [nextInCollection](tes3npc/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3npc/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3npc/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [owningCollection](tes3npc/owningCollection.md)

> The collection responsible for holding this object.

#### [previousInCollection](tes3npc/previousInCollection.md)

> The previous object in parent collection's list.

#### [race](tes3npc/race.md)

> The race that the NPC uses.

#### [reputation](tes3npc/reputation.md)

> The actor's base reputation.

#### [scale](tes3npc/scale.md)

> The object's scale.

#### [sceneNode](tes3npc/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3npc/sceneReference.md)

> The scene graph reference node for this object.

#### [script](tes3npc/script.md)

> The script that runs on the object.

#### [skills](tes3npc/skills.md)

> A table of twenty seven numbers, representing the base values for the NPC's skills.

#### [sourceMod](tes3npc/sourceMod.md)

> The filename of the mod that owns this object.

#### [spells](tes3npc/spells.md)

> A list of spells that the actor has access to.

#### [stolenList](tes3npc/stolenList.md)

> A list of actors that the object has been stolen from.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3npc/onInventoryClose
```

#### [onInventoryClose](tes3npc/onInventoryClose.md)

> A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
