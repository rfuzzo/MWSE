# tes3creature

A creature object that has not been cloned. Typically represents the raw information edited in the construction set.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3creature/__tostring
    tes3creature/actorFlags
    tes3creature/aiConfig
    tes3creature/attacks
    tes3creature/attributes
    tes3creature/biped
    tes3creature/boundingBox
    tes3creature/cloneCount
    tes3creature/deleted
    tes3creature/disabled
    tes3creature/equipment
    tes3creature/fatigue
    tes3creature/flies
    tes3creature/health
    tes3creature/id
    tes3creature/inventory
    tes3creature/isAttacked
    tes3creature/isEssential
    tes3creature/isInstance
    tes3creature/isRespawn
    tes3creature/level
    tes3creature/magicka
    tes3creature/mesh
    tes3creature/modified
    tes3creature/name
    tes3creature/nextInCollection
    tes3creature/objectFlags
    tes3creature/objectType
    tes3creature/owningCollection
    tes3creature/previousInCollection
    tes3creature/respawns
    tes3creature/scale
    tes3creature/sceneNode
    tes3creature/sceneReference
    tes3creature/script
    tes3creature/skills
    tes3creature/soul
    tes3creature/soundCreature
    tes3creature/sourceMod
    tes3creature/spells
    tes3creature/stolenList
    tes3creature/swims
    tes3creature/type
    tes3creature/usesEquipment
    tes3creature/walks
```

#### [__tostring](tes3creature/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [actorFlags](tes3creature/actorFlags.md)

> A number representing the actor flags. Truly a bit field.

#### [aiConfig](tes3creature/aiConfig.md)

> A substructure off of actors that contains information on the current AI configuration.

#### [attacks](tes3creature/attacks.md)

> A table of three attacks, represented by a trio of tes3rangeInt.

#### [attributes](tes3creature/attributes.md)

> A table of eight numbers, representing the base values for the actor's attributes.

#### [biped](tes3creature/biped.md)

> Access to the creature's biped flag.

#### [boundingBox](tes3creature/boundingBox.md)

> The bounding box for the object.

#### [cloneCount](tes3creature/cloneCount.md)

> The number of clones that exist of this actor.

#### [deleted](tes3creature/deleted.md)

> The deleted state of the object.

#### [disabled](tes3creature/disabled.md)

> The disabled state of the object.

#### [equipment](tes3creature/equipment.md)

> The items currently equipped to the actor.

#### [fatigue](tes3creature/fatigue.md)

> The actor's max fatigue.

#### [flies](tes3creature/flies.md)

> Access to the creature's flies flag.

#### [health](tes3creature/health.md)

> The actor's max health.

#### [id](tes3creature/id.md)

> The unique identifier for the object.

#### [inventory](tes3creature/inventory.md)

> The items currently carried by the actor.

#### [isAttacked](tes3creature/isAttacked.md)

> If true, the actor's attacked flag is set.

#### [isEssential](tes3creature/isEssential.md)

> If true, the actor's essential flag is set.

#### [isInstance](tes3creature/isInstance.md)

> Always returns false.

#### [isRespawn](tes3creature/isRespawn.md)

> If true, the actor's respawn flag is set.

#### [level](tes3creature/level.md)

> The base level of the creature.

#### [magicka](tes3creature/magicka.md)

> The actor's max magicka.

#### [mesh](tes3creature/mesh.md)

> The path to the object's mesh.

#### [modified](tes3creature/modified.md)

> The modification state of the object since the last save.

#### [name](tes3creature/name.md)

> The player-facing name for the object.

#### [nextInCollection](tes3creature/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3creature/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3creature/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [owningCollection](tes3creature/owningCollection.md)

> The collection responsible for holding this object.

#### [previousInCollection](tes3creature/previousInCollection.md)

> The previous object in parent collection's list.

#### [respawns](tes3creature/respawns.md)

> Access to the creature's respawns flag.

#### [scale](tes3creature/scale.md)

> The object's scale.

#### [sceneNode](tes3creature/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3creature/sceneReference.md)

> The scene graph reference node for this object.

#### [script](tes3creature/script.md)

> The script that runs on the object.

#### [skills](tes3creature/skills.md)

> A table of three numbers, representing the base values for the creature's combat, magic, and stealth skills.

#### [soul](tes3creature/soul.md)

> The amount of soul value that the creature provides.

#### [soundCreature](tes3creature/soundCreature.md)

> A creature to use instead of this one for sound generation.

#### [sourceMod](tes3creature/sourceMod.md)

> The filename of the mod that owns this object.

#### [spells](tes3creature/spells.md)

> A list of spells that the actor has access to.

#### [stolenList](tes3creature/stolenList.md)

> A list of actors that the object has been stolen from.

#### [swims](tes3creature/swims.md)

> Access to the creature's swims flag.

#### [type](tes3creature/type.md)

> The type of the creature, represented by a number for normal, daedra, undead, or humanoid.

#### [usesEquipment](tes3creature/usesEquipment.md)

> Access to the creature's usesEquipment flag.

#### [walks](tes3creature/walks.md)

> Access to the creature's walks flag.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3creature/onInventoryClose
```

#### [onInventoryClose](tes3creature/onInventoryClose.md)

> A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
