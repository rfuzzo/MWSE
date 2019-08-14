# tes3mobileActor

A mobile object for a creature, NPC, or the player.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3mobileActor/actionBeforeCombat
    tes3mobileActor/actionData
    tes3mobileActor/activeAI
    tes3mobileActor/activeMagicEffectCount
    tes3mobileActor/activeMagicEffects
    tes3mobileActor/actorType
    tes3mobileActor/agility
    tes3mobileActor/aiPlanner
    tes3mobileActor/alarm
    tes3mobileActor/animationData
    tes3mobileActor/attackBonus
    tes3mobileActor/attacked
    tes3mobileActor/attributes
    tes3mobileActor/barterGold
    tes3mobileActor/blind
    tes3mobileActor/boundSize
    tes3mobileActor/cell
    tes3mobileActor/cellX
    tes3mobileActor/cellY
    tes3mobileActor/chameleon
    tes3mobileActor/collidingReference
    tes3mobileActor/corpseHourstamp
    tes3mobileActor/currentEnchantedItem
    tes3mobileActor/currentSpell
    tes3mobileActor/effectAttributes
    tes3mobileActor/encumbrance
    tes3mobileActor/endurance
    tes3mobileActor/fatigue
    tes3mobileActor/fight
    tes3mobileActor/flags
    tes3mobileActor/flee
    tes3mobileActor/friendlyActors
    tes3mobileActor/greetDuration
    tes3mobileActor/greetTimer
    tes3mobileActor/health
    tes3mobileActor/height
    tes3mobileActor/hello
    tes3mobileActor/holdBreathTime
    tes3mobileActor/hostileActors
    tes3mobileActor/idleAnim
    tes3mobileActor/impulseVelocity
    tes3mobileActor/inCombat
    tes3mobileActor/intelligence
    tes3mobileActor/invisibility
    tes3mobileActor/isCrittable
    tes3mobileActor/isFlying
    tes3mobileActor/isJumping
    tes3mobileActor/isMovingBack
    tes3mobileActor/isMovingForward
    tes3mobileActor/isMovingLeft
    tes3mobileActor/isMovingRight
    tes3mobileActor/isRunning
    tes3mobileActor/isSneaking
    tes3mobileActor/isStartingJump
    tes3mobileActor/isSwimming
    tes3mobileActor/isTurningLeft
    tes3mobileActor/isTurningRight
    tes3mobileActor/isWalking
    tes3mobileActor/jump
    tes3mobileActor/lastGroundZ
    tes3mobileActor/levitate
    tes3mobileActor/luck
    tes3mobileActor/magicka
    tes3mobileActor/magickaMultiplier
    tes3mobileActor/movementFlags
    tes3mobileActor/nextActionWeight
    tes3mobileActor/objectType
    tes3mobileActor/paralyze
    tes3mobileActor/personality
    tes3mobileActor/position
    tes3mobileActor/prevMovementFlags
    tes3mobileActor/readiedAmmo
    tes3mobileActor/readiedAmmoCount
    tes3mobileActor/readiedShield
    tes3mobileActor/readiedWeapon
    tes3mobileActor/reference
    tes3mobileActor/resistBlightDisease
    tes3mobileActor/resistCommonDisease
    tes3mobileActor/resistCorprus
    tes3mobileActor/resistFire
    tes3mobileActor/resistFrost
    tes3mobileActor/resistMagicka
    tes3mobileActor/resistNormalWeapons
    tes3mobileActor/resistParalysis
    tes3mobileActor/resistPoison
    tes3mobileActor/resistShock
    tes3mobileActor/sanctuary
    tes3mobileActor/scanInterval
    tes3mobileActor/scanTimer
    tes3mobileActor/shield
    tes3mobileActor/silence
    tes3mobileActor/sound
    tes3mobileActor/speed
    tes3mobileActor/spellReadied
    tes3mobileActor/strength
    tes3mobileActor/swiftSwim
    tes3mobileActor/torchSlot
    tes3mobileActor/underwater
    tes3mobileActor/velocity
    tes3mobileActor/waterBreathing
    tes3mobileActor/waterWalking
    tes3mobileActor/weaponDrawn
    tes3mobileActor/werewolf
    tes3mobileActor/width
    tes3mobileActor/willpower
```

#### [actionBeforeCombat](tes3mobileActor/actionBeforeCombat.md)

> Action data stored before the actor entered combat.

#### [actionData](tes3mobileActor/actionData.md)

> Current action data. Pre-combat action data is stored in the actionBeforeCombat property.

#### [activeAI](tes3mobileActor/activeAI.md)

> Friendly access to the actor's flag that controls if AI is active.

#### [activeMagicEffectCount](tes3mobileActor/activeMagicEffectCount.md)

> The number of active magic effects currently operating on the actor.

#### [activeMagicEffects](tes3mobileActor/activeMagicEffects.md)

> The first active magic effect on the actor, from which all others can be accessed.

#### [actorType](tes3mobileActor/actorType.md)

> The type of the mobile actor. 0 is a creature, 1 is an NPC, 2 is the player.

#### [agility](tes3mobileActor/agility.md)

> Direct access to the actor's agility attribute statistic.

#### [aiPlanner](tes3mobileActor/aiPlanner.md)

> Access to the mobile's AI planner and AI package information.

#### [alarm](tes3mobileActor/alarm.md)

> The actor's alarm AI value.

#### [animationData](tes3mobileActor/animationData.md)

> No description available.

#### [attackBonus](tes3mobileActor/attackBonus.md)

> Direct access to the actor's attack bonus effect attribute.

#### [attacked](tes3mobileActor/attacked.md)

> Friendly access to the actor's flag that controls if the actor has been attacked.

#### [attributes](tes3mobileActor/attributes.md)

> Access to a table of 8 tes3statistic objects for the actor's attributes.

#### [barterGold](tes3mobileActor/barterGold.md)

> The current amount of gold that the actor has access to for bartering.

#### [blind](tes3mobileActor/blind.md)

> Direct access to the actor's blind effect attribute.

#### [boundSize](tes3mobileActor/boundSize.md)

> A vector that shows the size of the bounding box in each direction.

#### [cell](tes3mobileActor/cell.md)

> Fetches the cell that the actor is in.

#### [cellX](tes3mobileActor/cellX.md)

> The X grid coordinate of the cell the mobile is in.

#### [cellY](tes3mobileActor/cellY.md)

> The Y grid coordinate of the cell the mobile is in.

#### [chameleon](tes3mobileActor/chameleon.md)

> Direct access to the actor's chameleon effect attribute.

#### [collidingReference](tes3mobileActor/collidingReference.md)

> The reference that the mobile has collided with this frame.

#### [corpseHourstamp](tes3mobileActor/corpseHourstamp.md)

> No description available.

#### [currentEnchantedItem](tes3mobileActor/currentEnchantedItem.md)

> The currently equipped enchanted item that the actor will use.

#### [currentSpell](tes3mobileActor/currentSpell.md)

> The currently equipped spell that the actor will use.

#### [effectAttributes](tes3mobileActor/effectAttributes.md)

> Access to a table of 24 numbers for the actor's effect attributes.

#### [encumbrance](tes3mobileActor/encumbrance.md)

> Access to the actor's encumbrance statistic.

#### [endurance](tes3mobileActor/endurance.md)

> Direct access to the actor's endurance attribute statistic.

#### [fatigue](tes3mobileActor/fatigue.md)

> Access to the actor's fatigue statistic.

#### [fight](tes3mobileActor/fight.md)

> The actor's fight AI value.

#### [flags](tes3mobileActor/flags.md)

> Access to the root mobile object flags, represented as an integer. Should not be accessed directly.

#### [flee](tes3mobileActor/flee.md)

> The actor's flee AI value.

#### [friendlyActors](tes3mobileActor/friendlyActors.md)

> A collection of other tes3mobileActors that this actor considers friendly.

#### [greetDuration](tes3mobileActor/greetDuration.md)

> No description available.

#### [greetTimer](tes3mobileActor/greetTimer.md)

> No description available.

#### [health](tes3mobileActor/health.md)

> Access to the actor's health statistic.

#### [height](tes3mobileActor/height.md)

> The height of the mobile above the ground.

#### [hello](tes3mobileActor/hello.md)

> The actor's hello AI value.

#### [holdBreathTime](tes3mobileActor/holdBreathTime.md)

> No description available.

#### [hostileActors](tes3mobileActor/hostileActors.md)

> A collection of other tes3mobileActors that this actor considers hostile.

#### [idleAnim](tes3mobileActor/idleAnim.md)

> Friendly access to the actor's flag that controls if the actor is using their idle animation.

#### [impulseVelocity](tes3mobileActor/impulseVelocity.md)

> A vector that represents the 3D acceleration of the object.

#### [inCombat](tes3mobileActor/inCombat.md)

> Friendly access to the actor's flag that controls if the actor is in combat.

#### [intelligence](tes3mobileActor/intelligence.md)

> Direct access to the actor's intelligence attribute statistic.

#### [invisibility](tes3mobileActor/invisibility.md)

> Direct access to the actor's invisibility effect attribute.

#### [isCrittable](tes3mobileActor/isCrittable.md)

> Friendly access to the actor's flag that controls if the actor can be crittically hit.

#### [isFlying](tes3mobileActor/isFlying.md)

> Direct access to the actor's current movement flags, showing if the actor is flying.

#### [isJumping](tes3mobileActor/isJumping.md)

> Direct access to the actor's current movement flags, showing if the actor is jumping.

#### [isMovingBack](tes3mobileActor/isMovingBack.md)

> Direct access to the actor's current movement flags, showing if the actor is moving backwards.

#### [isMovingForward](tes3mobileActor/isMovingForward.md)

> Direct access to the actor's current movement flags, showing if the actor is moving forwards.

#### [isMovingLeft](tes3mobileActor/isMovingLeft.md)

> Direct access to the actor's current movement flags, showing if the actor is moving left.

#### [isMovingRight](tes3mobileActor/isMovingRight.md)

> Direct access to the actor's current movement flags, showing if the actor is moving right.

#### [isRunning](tes3mobileActor/isRunning.md)

> Direct access to the actor's current movement flags, showing if the actor is running.

#### [isSneaking](tes3mobileActor/isSneaking.md)

> Direct access to the actor's current movement flags, showing if the actor is sneaking.

#### [isStartingJump](tes3mobileActor/isStartingJump.md)

> Direct access to the actor's current movement flags, showing if the actor has started jumping.

#### [isSwimming](tes3mobileActor/isSwimming.md)

> Direct access to the actor's current movement flags, showing if the actor is swimming.

#### [isTurningLeft](tes3mobileActor/isTurningLeft.md)

> Direct access to the actor's current movement flags, showing if the actor is turning left.

#### [isTurningRight](tes3mobileActor/isTurningRight.md)

> Direct access to the actor's current movement flags, showing if the actor is turning right.

#### [isWalking](tes3mobileActor/isWalking.md)

> Direct access to the actor's current movement flags, showing if the actor is walking.

#### [jump](tes3mobileActor/jump.md)

> Direct access to the actor's jump effect attribute.

#### [lastGroundZ](tes3mobileActor/lastGroundZ.md)

> No description available.

#### [levitate](tes3mobileActor/levitate.md)

> Direct access to the actor's levitate effect attribute.

#### [luck](tes3mobileActor/luck.md)

> Direct access to the actor's luck attribute statistic.

#### [magicka](tes3mobileActor/magicka.md)

> Access to the actor's magicka statistic.

#### [magickaMultiplier](tes3mobileActor/magickaMultiplier.md)

> Access to the actor's magicka multiplier statistic.

#### [movementFlags](tes3mobileActor/movementFlags.md)

> Access to the root mobile object movement flags, represented as an integer. Should not be accessed directly.

#### [nextActionWeight](tes3mobileActor/nextActionWeight.md)

> No description available.

#### [objectType](tes3mobileActor/objectType.md)

> The type of mobile object. Maps to values in tes3.objectType.

#### [paralyze](tes3mobileActor/paralyze.md)

> Direct access to the actor's paralyze effect attribute.

#### [personality](tes3mobileActor/personality.md)

> Direct access to the actor's personality attribute statistic.

#### [position](tes3mobileActor/position.md)

> A vector that represents the 3D position of the object.

#### [prevMovementFlags](tes3mobileActor/prevMovementFlags.md)

> Access to the root mobile object movement flags from the previous frame, represented as an integer. Should not be accessed directly.

#### [readiedAmmo](tes3mobileActor/readiedAmmo.md)

> The currently equipped ammo.

#### [readiedAmmoCount](tes3mobileActor/readiedAmmoCount.md)

> The number of ammo equipped for the readied ammo.

#### [readiedShield](tes3mobileActor/readiedShield.md)

> The currently equipped shield.

#### [readiedWeapon](tes3mobileActor/readiedWeapon.md)

> The currently equipped weapon.

#### [reference](tes3mobileActor/reference.md)

> Access to the reference object for the mobile, if any.

#### [resistBlightDisease](tes3mobileActor/resistBlightDisease.md)

> Direct access to the actor's blight disease resistance effect attribute.

#### [resistCommonDisease](tes3mobileActor/resistCommonDisease.md)

> Direct access to the actor's common disease resistance effect attribute.

#### [resistCorprus](tes3mobileActor/resistCorprus.md)

> Direct access to the actor's corprus disease resistance effect attribute.

#### [resistFire](tes3mobileActor/resistFire.md)

> Direct access to the actor's fire resistance effect attribute.

#### [resistFrost](tes3mobileActor/resistFrost.md)

> Direct access to the actor's frost resistance effect attribute.

#### [resistMagicka](tes3mobileActor/resistMagicka.md)

> Direct access to the actor's magicka resistance effect attribute.

#### [resistNormalWeapons](tes3mobileActor/resistNormalWeapons.md)

> Direct access to the actor's normal weapon resistance effect attribute.

#### [resistParalysis](tes3mobileActor/resistParalysis.md)

> Direct access to the actor's paralysis resistance effect attribute.

#### [resistPoison](tes3mobileActor/resistPoison.md)

> Direct access to the actor's poison resistance effect attribute.

#### [resistShock](tes3mobileActor/resistShock.md)

> Direct access to the actor's shock resistance effect attribute.

#### [sanctuary](tes3mobileActor/sanctuary.md)

> Direct access to the actor's sanctuary effect attribute.

#### [scanInterval](tes3mobileActor/scanInterval.md)

> No description available.

#### [scanTimer](tes3mobileActor/scanTimer.md)

> No description available.

#### [shield](tes3mobileActor/shield.md)

> Direct access to the actor's shield effect attribute.

#### [silence](tes3mobileActor/silence.md)

> Direct access to the actor's silence effect attribute.

#### [sound](tes3mobileActor/sound.md)

> Direct access to the actor's sound effect attribute.

#### [speed](tes3mobileActor/speed.md)

> Direct access to the actor's speed attribute statistic.

#### [spellReadied](tes3mobileActor/spellReadied.md)

> Friendly access to the actor's flag that controls if the actor has a spell readied.

#### [strength](tes3mobileActor/strength.md)

> Direct access to the actor's strength attribute statistic.

#### [swiftSwim](tes3mobileActor/swiftSwim.md)

> Direct access to the actor's swift swim effect attribute.

#### [torchSlot](tes3mobileActor/torchSlot.md)

> The currently equipped light.

#### [underwater](tes3mobileActor/underwater.md)

> Friendly access to the actor's flag that controls if the actor is under water.

#### [velocity](tes3mobileActor/velocity.md)

> A vector that represents the 3D velocity of the object.

#### [waterBreathing](tes3mobileActor/waterBreathing.md)

> Direct access to the actor's water breathing effect attribute.

#### [waterWalking](tes3mobileActor/waterWalking.md)

> Direct access to the actor's water walking effect attribute.

#### [weaponDrawn](tes3mobileActor/weaponDrawn.md)

> Friendly access to the actor's flag that controls if the actor has a weapon readied.

#### [werewolf](tes3mobileActor/werewolf.md)

> Friendly access to the actor's flag that controls if the actor in werewolf form.

#### [width](tes3mobileActor/width.md)

> No description available.

#### [willpower](tes3mobileActor/willpower.md)

> Direct access to the actor's willpower attribute statistic.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3mobileActor/applyHealthDamage
    tes3mobileActor/getSkillStatistic
    tes3mobileActor/getSkillValue
    tes3mobileActor/hasFreeAction
    tes3mobileActor/isAffectedByObject
    tes3mobileActor/startCombat
    tes3mobileActor/startDialogue
    tes3mobileActor/stopCombat
```

#### [applyHealthDamage](tes3mobileActor/applyHealthDamage.md)

> Damages the actor.

#### [getSkillStatistic](tes3mobileActor/getSkillStatistic.md)

> Fetches the statistic object of a skill with a given index. This converts to the limited options available for creatures.

#### [getSkillValue](tes3mobileActor/getSkillValue.md)

> Fetches the current value of a skill with a given index. This converts to the limited options available for creatures.

#### [hasFreeAction](tes3mobileActor/hasFreeAction.md)

> If true, the actor isn't paralyzed, dead, stunned, or otherwise unable to take action.

#### [isAffectedByObject](tes3mobileActor/isAffectedByObject.md)

> Determines if the actor is currently being affected by a given alchemy, enchantment, or spell.

#### [startCombat](tes3mobileActor/startCombat.md)

> Forces the actor into combat with another actor.

#### [startDialogue](tes3mobileActor/startDialogue.md)

> Starts dialogue with this actor for the player.

#### [stopCombat](tes3mobileActor/stopCombat.md)

> Ends combat for the actor.
