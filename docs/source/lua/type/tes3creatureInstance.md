# tes3creatureInstance

A creature object that has been cloned. Typically represents a creature that has been instanced in the world.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3creatureInstance/__tostring
    tes3creatureInstance/actorFlags
    tes3creatureInstance/aiConfig
    tes3creatureInstance/attacks
    tes3creatureInstance/attributes
    tes3creatureInstance/barterGold
    tes3creatureInstance/baseObject
    tes3creatureInstance/biped
    tes3creatureInstance/boundingBox
    tes3creatureInstance/cloneCount
    tes3creatureInstance/deleted
    tes3creatureInstance/disabled
    tes3creatureInstance/equipment
    tes3creatureInstance/fatigue
    tes3creatureInstance/flies
    tes3creatureInstance/health
    tes3creatureInstance/id
    tes3creatureInstance/inventory
    tes3creatureInstance/isAttacked
    tes3creatureInstance/isEssential
    tes3creatureInstance/isInstance
    tes3creatureInstance/isRespawn
    tes3creatureInstance/level
    tes3creatureInstance/magicka
    tes3creatureInstance/mesh
    tes3creatureInstance/modified
    tes3creatureInstance/name
    tes3creatureInstance/nextInCollection
    tes3creatureInstance/objectFlags
    tes3creatureInstance/objectType
    tes3creatureInstance/owningCollection
    tes3creatureInstance/previousInCollection
    tes3creatureInstance/respawns
    tes3creatureInstance/scale
    tes3creatureInstance/sceneNode
    tes3creatureInstance/sceneReference
    tes3creatureInstance/script
    tes3creatureInstance/skills
    tes3creatureInstance/soul
    tes3creatureInstance/soundCreature
    tes3creatureInstance/sourceMod
    tes3creatureInstance/spells
    tes3creatureInstance/stolenList
    tes3creatureInstance/swims
    tes3creatureInstance/type
    tes3creatureInstance/usesEquipment
    tes3creatureInstance/walks
    tes3creatureInstance/weapon
```

#### [__tostring](tes3creatureInstance/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [actorFlags](tes3creatureInstance/actorFlags.md)

> A number representing the actor flags. Truly a bit field.

#### [aiConfig](tes3creatureInstance/aiConfig.md)

> Simplified access to the base creature's AI configuration.

#### [attacks](tes3creatureInstance/attacks.md)

> Simplified access to the base creature's attacks. A table of three attacks, represented by a trio of tes3rangeInt.

#### [attributes](tes3creatureInstance/attributes.md)

> Simplified access to the base creature's attributes. A table of eight numbers, representing the base values for the creature's attributes.

#### [barterGold](tes3creatureInstance/barterGold.md)

> The amount of gold that the creature has to barter with.

#### [baseObject](tes3creatureInstance/baseObject.md)

> Access to creature that this one is instanced from.

#### [biped](tes3creatureInstance/biped.md)

> Access to the creature's biped flag.

#### [boundingBox](tes3creatureInstance/boundingBox.md)

> The bounding box for the object.

#### [cloneCount](tes3creatureInstance/cloneCount.md)

> The number of clones that exist of this actor.

#### [deleted](tes3creatureInstance/deleted.md)

> The deleted state of the object.

#### [disabled](tes3creatureInstance/disabled.md)

> The disabled state of the object.

#### [equipment](tes3creatureInstance/equipment.md)

> A collection that contains the currently equipped items.

#### [fatigue](tes3creatureInstance/fatigue.md)

> The creature's current fatigue.

#### [flies](tes3creatureInstance/flies.md)

> Access to the creature's flies flag.

#### [health](tes3creatureInstance/health.md)

> The creature's current health.

#### [id](tes3creatureInstance/id.md)

> The unique identifier for the object.

#### [inventory](tes3creatureInstance/inventory.md)

> A collection that contains the items in the actor's inventory.

#### [isAttacked](tes3creatureInstance/isAttacked.md)

> If true, the creature attacked flag is set.

#### [isEssential](tes3creatureInstance/isEssential.md)

> If true, the creature essential flag is set.

#### [isInstance](tes3creatureInstance/isInstance.md)

> Always returns true.

#### [isRespawn](tes3creatureInstance/isRespawn.md)

> If true, the creature respawn flag is set.

#### [level](tes3creatureInstance/level.md)

> The base level of the creature.

#### [magicka](tes3creatureInstance/magicka.md)

> The creature's current magicka.

#### [mesh](tes3creatureInstance/mesh.md)

> The path to the object's mesh.

#### [modified](tes3creatureInstance/modified.md)

> The modification state of the object since the last save.

#### [name](tes3creatureInstance/name.md)

> The player-facing name for the object.

#### [nextInCollection](tes3creatureInstance/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3creatureInstance/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3creatureInstance/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [owningCollection](tes3creatureInstance/owningCollection.md)

> The collection responsible for holding this object.

#### [previousInCollection](tes3creatureInstance/previousInCollection.md)

> The previous object in parent collection's list.

#### [respawns](tes3creatureInstance/respawns.md)

> Access to the creature's respawns flag.

#### [scale](tes3creatureInstance/scale.md)

> The object's scale.

#### [sceneNode](tes3creatureInstance/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3creatureInstance/sceneReference.md)

> The scene graph reference node for this object.

#### [script](tes3creatureInstance/script.md)

> The script that runs on the object.

#### [skills](tes3creatureInstance/skills.md)

> Simplified access to the base creature's skills. A table of three numbers, representing the base values for the creature's combat, magic, and stealth skills.

#### [soul](tes3creatureInstance/soul.md)

> Simplified access to the base creature's soul. The amount of soul value that the creature provides.

#### [soundCreature](tes3creatureInstance/soundCreature.md)

> Simplified access to the base creature's sound generator. A creature to use instead of this one for sound generation.

#### [sourceMod](tes3creatureInstance/sourceMod.md)

> The filename of the mod that owns this object.

#### [spells](tes3creatureInstance/spells.md)

> Simplified access to the base creature's spell list. A list of spells that the creature has access to.

#### [stolenList](tes3creatureInstance/stolenList.md)

> A list of actors that the object has been stolen from.

#### [swims](tes3creatureInstance/swims.md)

> Access to the creature's swims flag.

#### [type](tes3creatureInstance/type.md)

> Simplified access to the base creature's type. The type of the creature, represented by a number for normal, daedra, undead, or humanoid.

#### [usesEquipment](tes3creatureInstance/usesEquipment.md)

> Access to the creature's usesEquipment flag.

#### [walks](tes3creatureInstance/walks.md)

> Access to the creature's walks flag.

#### [weapon](tes3creatureInstance/weapon.md)

> The creature's currently equipped weapon.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3creatureInstance/onInventoryClose
```

#### [onInventoryClose](tes3creatureInstance/onInventoryClose.md)

> A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.
