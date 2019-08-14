# tes3mobileNPC

A mobile object for an NPC.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3mobileNPC/acrobatics
    tes3mobileNPC/actionBeforeCombat
    tes3mobileNPC/actionData
    tes3mobileNPC/activeAI
    tes3mobileNPC/activeMagicEffectCount
    tes3mobileNPC/activeMagicEffects
    tes3mobileNPC/actorType
    tes3mobileNPC/agility
    tes3mobileNPC/aiPlanner
    tes3mobileNPC/alarm
    tes3mobileNPC/alchemy
    tes3mobileNPC/alteration
    tes3mobileNPC/animationData
    tes3mobileNPC/armorer
    tes3mobileNPC/athletics
    tes3mobileNPC/attackBonus
    tes3mobileNPC/attacked
    tes3mobileNPC/attributes
    tes3mobileNPC/axe
    tes3mobileNPC/barterGold
    tes3mobileNPC/blind
    tes3mobileNPC/block
    tes3mobileNPC/bluntWeapon
    tes3mobileNPC/boundSize
    tes3mobileNPC/cell
    tes3mobileNPC/cellX
    tes3mobileNPC/cellY
    tes3mobileNPC/chameleon
    tes3mobileNPC/collidingReference
    tes3mobileNPC/conjuration
    tes3mobileNPC/corpseHourstamp
    tes3mobileNPC/currentEnchantedItem
    tes3mobileNPC/currentSpell
    tes3mobileNPC/destruction
    tes3mobileNPC/effectAttributes
    tes3mobileNPC/enchant
    tes3mobileNPC/encumbrance
    tes3mobileNPC/endurance
    tes3mobileNPC/fatigue
    tes3mobileNPC/fight
    tes3mobileNPC/flags
    tes3mobileNPC/flee
    tes3mobileNPC/flySpeed
    tes3mobileNPC/forceJump
    tes3mobileNPC/forceMoveJump
    tes3mobileNPC/forceRun
    tes3mobileNPC/forceSneak
    tes3mobileNPC/friendlyActors
    tes3mobileNPC/greetDuration
    tes3mobileNPC/greetTimer
    tes3mobileNPC/handToHand
    tes3mobileNPC/health
    tes3mobileNPC/heavyArmor
    tes3mobileNPC/height
    tes3mobileNPC/hello
    tes3mobileNPC/holdBreathTime
    tes3mobileNPC/hostileActors
    tes3mobileNPC/idleAnim
    tes3mobileNPC/illusion
    tes3mobileNPC/impulseVelocity
    tes3mobileNPC/inCombat
    tes3mobileNPC/intelligence
    tes3mobileNPC/invisibility
    tes3mobileNPC/isCrittable
    tes3mobileNPC/isFlying
    tes3mobileNPC/isJumping
    tes3mobileNPC/isMovingBack
    tes3mobileNPC/isMovingForward
    tes3mobileNPC/isMovingLeft
    tes3mobileNPC/isMovingRight
    tes3mobileNPC/isRunning
    tes3mobileNPC/isSneaking
    tes3mobileNPC/isStartingJump
    tes3mobileNPC/isSwimming
    tes3mobileNPC/isTurningLeft
    tes3mobileNPC/isTurningRight
    tes3mobileNPC/isWalking
    tes3mobileNPC/jump
    tes3mobileNPC/lastGroundZ
    tes3mobileNPC/levitate
    tes3mobileNPC/lightArmor
    tes3mobileNPC/longBlade
    tes3mobileNPC/luck
    tes3mobileNPC/magicka
    tes3mobileNPC/magickaMultiplier
    tes3mobileNPC/marksman
    tes3mobileNPC/mediumArmor
    tes3mobileNPC/mercantile
    tes3mobileNPC/moveSpeed
    tes3mobileNPC/movementFlags
    tes3mobileNPC/mysticism
    tes3mobileNPC/nextActionWeight
    tes3mobileNPC/object
    tes3mobileNPC/objectType
    tes3mobileNPC/paralyze
    tes3mobileNPC/personality
    tes3mobileNPC/position
    tes3mobileNPC/prevMovementFlags
    tes3mobileNPC/readiedAmmo
    tes3mobileNPC/readiedAmmoCount
    tes3mobileNPC/readiedShield
    tes3mobileNPC/readiedWeapon
    tes3mobileNPC/reference
    tes3mobileNPC/resistBlightDisease
    tes3mobileNPC/resistCommonDisease
    tes3mobileNPC/resistCorprus
    tes3mobileNPC/resistFire
    tes3mobileNPC/resistFrost
    tes3mobileNPC/resistMagicka
    tes3mobileNPC/resistNormalWeapons
    tes3mobileNPC/resistParalysis
    tes3mobileNPC/resistPoison
    tes3mobileNPC/resistShock
    tes3mobileNPC/restoration
    tes3mobileNPC/runSpeed
    tes3mobileNPC/sanctuary
    tes3mobileNPC/scanInterval
    tes3mobileNPC/scanTimer
    tes3mobileNPC/security
    tes3mobileNPC/shield
    tes3mobileNPC/shortBlade
    tes3mobileNPC/silence
    tes3mobileNPC/skills
    tes3mobileNPC/sneak
    tes3mobileNPC/sound
    tes3mobileNPC/spear
    tes3mobileNPC/speechcraft
    tes3mobileNPC/speed
    tes3mobileNPC/spellReadied
    tes3mobileNPC/strength
    tes3mobileNPC/swiftSwim
    tes3mobileNPC/swimRunSpeed
    tes3mobileNPC/swimSpeed
    tes3mobileNPC/torchSlot
    tes3mobileNPC/unarmored
    tes3mobileNPC/underwater
    tes3mobileNPC/velocity
    tes3mobileNPC/walkSpeed
    tes3mobileNPC/waterBreathing
    tes3mobileNPC/waterWalking
    tes3mobileNPC/weaponDrawn
    tes3mobileNPC/werewolf
    tes3mobileNPC/width
    tes3mobileNPC/willpower
```

#### [acrobatics](tes3mobileNPC/acrobatics.md)

> Direct access to the NPC's acrobatics skill statistic.

#### [actionBeforeCombat](tes3mobileNPC/actionBeforeCombat.md)

> Action data stored before the actor entered combat.

#### [actionData](tes3mobileNPC/actionData.md)

> Current action data. Pre-combat action data is stored in the actionBeforeCombat property.

#### [activeAI](tes3mobileNPC/activeAI.md)

> Friendly access to the actor's flag that controls if AI is active.

#### [activeMagicEffectCount](tes3mobileNPC/activeMagicEffectCount.md)

> The number of active magic effects currently operating on the actor.

#### [activeMagicEffects](tes3mobileNPC/activeMagicEffects.md)

> The first active magic effect on the actor, from which all others can be accessed.

#### [actorType](tes3mobileNPC/actorType.md)

> The type of the mobile actor. 0 is a creature, 1 is an NPC, 2 is the player.

#### [agility](tes3mobileNPC/agility.md)

> Direct access to the actor's agility attribute statistic.

#### [aiPlanner](tes3mobileNPC/aiPlanner.md)

> Access to the mobile's AI planner and AI package information.

#### [alarm](tes3mobileNPC/alarm.md)

> The actor's alarm AI value.

#### [alchemy](tes3mobileNPC/alchemy.md)

> Direct access to the NPC's alchemy skill statistic.

#### [alteration](tes3mobileNPC/alteration.md)

> Direct access to the NPC's alteration skill statistic.

#### [animationData](tes3mobileNPC/animationData.md)

> No description available.

#### [armorer](tes3mobileNPC/armorer.md)

> Direct access to the NPC's armorer skill statistic.

#### [athletics](tes3mobileNPC/athletics.md)

> Direct access to the NPC's athletics skill statistic.

#### [attackBonus](tes3mobileNPC/attackBonus.md)

> Direct access to the actor's attack bonus effect attribute.

#### [attacked](tes3mobileNPC/attacked.md)

> Friendly access to the actor's flag that controls if the actor has been attacked.

#### [attributes](tes3mobileNPC/attributes.md)

> Access to a table of 8 tes3statistic objects for the actor's attributes.

#### [axe](tes3mobileNPC/axe.md)

> Direct access to the NPC's axe skill statistic.

#### [barterGold](tes3mobileNPC/barterGold.md)

> The current amount of gold that the actor has access to for bartering.

#### [blind](tes3mobileNPC/blind.md)

> Direct access to the actor's blind effect attribute.

#### [block](tes3mobileNPC/block.md)

> Direct access to the NPC's block skill statistic.

#### [bluntWeapon](tes3mobileNPC/bluntWeapon.md)

> Direct access to the NPC's blunt weapon skill statistic.

#### [boundSize](tes3mobileNPC/boundSize.md)

> A vector that shows the size of the bounding box in each direction.

#### [cell](tes3mobileNPC/cell.md)

> Fetches the cell that the actor is in.

#### [cellX](tes3mobileNPC/cellX.md)

> The X grid coordinate of the cell the mobile is in.

#### [cellY](tes3mobileNPC/cellY.md)

> The Y grid coordinate of the cell the mobile is in.

#### [chameleon](tes3mobileNPC/chameleon.md)

> Direct access to the actor's chameleon effect attribute.

#### [collidingReference](tes3mobileNPC/collidingReference.md)

> The reference that the mobile has collided with this frame.

#### [conjuration](tes3mobileNPC/conjuration.md)

> Direct access to the NPC's conjuration skill statistic.

#### [corpseHourstamp](tes3mobileNPC/corpseHourstamp.md)

> No description available.

#### [currentEnchantedItem](tes3mobileNPC/currentEnchantedItem.md)

> The currently equipped enchanted item that the actor will use.

#### [currentSpell](tes3mobileNPC/currentSpell.md)

> The currently equipped spell that the actor will use.

#### [destruction](tes3mobileNPC/destruction.md)

> Direct access to the NPC's destruction skill statistic.

#### [effectAttributes](tes3mobileNPC/effectAttributes.md)

> Access to a table of 24 numbers for the actor's effect attributes.

#### [enchant](tes3mobileNPC/enchant.md)

> Direct access to the NPC's enchant skill statistic.

#### [encumbrance](tes3mobileNPC/encumbrance.md)

> Access to the actor's encumbrance statistic.

#### [endurance](tes3mobileNPC/endurance.md)

> Direct access to the actor's endurance attribute statistic.

#### [fatigue](tes3mobileNPC/fatigue.md)

> Access to the actor's fatigue statistic.

#### [fight](tes3mobileNPC/fight.md)

> The actor's fight AI value.

#### [flags](tes3mobileNPC/flags.md)

> Access to the root mobile object flags, represented as an integer. Should not be accessed directly.

#### [flee](tes3mobileNPC/flee.md)

> The actor's flee AI value.

#### [flySpeed](tes3mobileNPC/flySpeed.md)

> The calculated fly movement speed.

#### [forceJump](tes3mobileNPC/forceJump.md)

> Toggle flag for if the NPC jumps.

#### [forceMoveJump](tes3mobileNPC/forceMoveJump.md)

> Toggle flag for if the NPC moves and jumps.

#### [forceRun](tes3mobileNPC/forceRun.md)

> Toggle flag for if the NPC runs.

#### [forceSneak](tes3mobileNPC/forceSneak.md)

> Toggle flag for if the NPC sneaks.

#### [friendlyActors](tes3mobileNPC/friendlyActors.md)

> A collection of other tes3mobileActors that this actor considers friendly.

#### [greetDuration](tes3mobileNPC/greetDuration.md)

> No description available.

#### [greetTimer](tes3mobileNPC/greetTimer.md)

> No description available.

#### [handToHand](tes3mobileNPC/handToHand.md)

> Direct access to the NPC's hand to hand skill statistic.

#### [health](tes3mobileNPC/health.md)

> Access to the actor's health statistic.

#### [heavyArmor](tes3mobileNPC/heavyArmor.md)

> Direct access to the NPC's heavy armor skill statistic.

#### [height](tes3mobileNPC/height.md)

> The height of the mobile above the ground.

#### [hello](tes3mobileNPC/hello.md)

> The actor's hello AI value.

#### [holdBreathTime](tes3mobileNPC/holdBreathTime.md)

> No description available.

#### [hostileActors](tes3mobileNPC/hostileActors.md)

> A collection of other tes3mobileActors that this actor considers hostile.

#### [idleAnim](tes3mobileNPC/idleAnim.md)

> Friendly access to the actor's flag that controls if the actor is using their idle animation.

#### [illusion](tes3mobileNPC/illusion.md)

> Direct access to the NPC's illusion skill statistic.

#### [impulseVelocity](tes3mobileNPC/impulseVelocity.md)

> A vector that represents the 3D acceleration of the object.

#### [inCombat](tes3mobileNPC/inCombat.md)

> Friendly access to the actor's flag that controls if the actor is in combat.

#### [intelligence](tes3mobileNPC/intelligence.md)

> Direct access to the actor's intelligence attribute statistic.

#### [invisibility](tes3mobileNPC/invisibility.md)

> Direct access to the actor's invisibility effect attribute.

#### [isCrittable](tes3mobileNPC/isCrittable.md)

> Friendly access to the actor's flag that controls if the actor can be crittically hit.

#### [isFlying](tes3mobileNPC/isFlying.md)

> Direct access to the actor's current movement flags, showing if the actor is flying.

#### [isJumping](tes3mobileNPC/isJumping.md)

> Direct access to the actor's current movement flags, showing if the actor is jumping.

#### [isMovingBack](tes3mobileNPC/isMovingBack.md)

> Direct access to the actor's current movement flags, showing if the actor is moving backwards.

#### [isMovingForward](tes3mobileNPC/isMovingForward.md)

> Direct access to the actor's current movement flags, showing if the actor is moving forwards.

#### [isMovingLeft](tes3mobileNPC/isMovingLeft.md)

> Direct access to the actor's current movement flags, showing if the actor is moving left.

#### [isMovingRight](tes3mobileNPC/isMovingRight.md)

> Direct access to the actor's current movement flags, showing if the actor is moving right.

#### [isRunning](tes3mobileNPC/isRunning.md)

> Direct access to the actor's current movement flags, showing if the actor is running.

#### [isSneaking](tes3mobileNPC/isSneaking.md)

> Direct access to the actor's current movement flags, showing if the actor is sneaking.

#### [isStartingJump](tes3mobileNPC/isStartingJump.md)

> Direct access to the actor's current movement flags, showing if the actor has started jumping.

#### [isSwimming](tes3mobileNPC/isSwimming.md)

> Direct access to the actor's current movement flags, showing if the actor is swimming.

#### [isTurningLeft](tes3mobileNPC/isTurningLeft.md)

> Direct access to the actor's current movement flags, showing if the actor is turning left.

#### [isTurningRight](tes3mobileNPC/isTurningRight.md)

> Direct access to the actor's current movement flags, showing if the actor is turning right.

#### [isWalking](tes3mobileNPC/isWalking.md)

> Direct access to the actor's current movement flags, showing if the actor is walking.

#### [jump](tes3mobileNPC/jump.md)

> Direct access to the actor's jump effect attribute.

#### [lastGroundZ](tes3mobileNPC/lastGroundZ.md)

> No description available.

#### [levitate](tes3mobileNPC/levitate.md)

> Direct access to the actor's levitate effect attribute.

#### [lightArmor](tes3mobileNPC/lightArmor.md)

> Direct access to the NPC's light armor skill statistic.

#### [longBlade](tes3mobileNPC/longBlade.md)

> Direct access to the NPC's long blade skill statistic.

#### [luck](tes3mobileNPC/luck.md)

> Direct access to the actor's luck attribute statistic.

#### [magicka](tes3mobileNPC/magicka.md)

> Access to the actor's magicka statistic.

#### [magickaMultiplier](tes3mobileNPC/magickaMultiplier.md)

> Access to the actor's magicka multiplier statistic.

#### [marksman](tes3mobileNPC/marksman.md)

> Direct access to the NPC's marksman skill statistic.

#### [mediumArmor](tes3mobileNPC/mediumArmor.md)

> Direct access to the NPC's medium armor skill statistic.

#### [mercantile](tes3mobileNPC/mercantile.md)

> Direct access to the NPC's mercantile skill statistic.

#### [moveSpeed](tes3mobileNPC/moveSpeed.md)

> The calculated base movement speed.

#### [movementFlags](tes3mobileNPC/movementFlags.md)

> Access to the root mobile object movement flags, represented as an integer. Should not be accessed directly.

#### [mysticism](tes3mobileNPC/mysticism.md)

> Direct access to the NPC's mysticism skill statistic.

#### [nextActionWeight](tes3mobileNPC/nextActionWeight.md)

> No description available.

#### [object](tes3mobileNPC/object.md)

> The actor object that maps to this mobile.

#### [objectType](tes3mobileNPC/objectType.md)

> The type of mobile object. Maps to values in tes3.objectType.

#### [paralyze](tes3mobileNPC/paralyze.md)

> Direct access to the actor's paralyze effect attribute.

#### [personality](tes3mobileNPC/personality.md)

> Direct access to the actor's personality attribute statistic.

#### [position](tes3mobileNPC/position.md)

> A vector that represents the 3D position of the object.

#### [prevMovementFlags](tes3mobileNPC/prevMovementFlags.md)

> Access to the root mobile object movement flags from the previous frame, represented as an integer. Should not be accessed directly.

#### [readiedAmmo](tes3mobileNPC/readiedAmmo.md)

> The currently equipped ammo.

#### [readiedAmmoCount](tes3mobileNPC/readiedAmmoCount.md)

> The number of ammo equipped for the readied ammo.

#### [readiedShield](tes3mobileNPC/readiedShield.md)

> The currently equipped shield.

#### [readiedWeapon](tes3mobileNPC/readiedWeapon.md)

> The currently equipped weapon.

#### [reference](tes3mobileNPC/reference.md)

> Access to the reference object for the mobile, if any.

#### [resistBlightDisease](tes3mobileNPC/resistBlightDisease.md)

> Direct access to the actor's blight disease resistance effect attribute.

#### [resistCommonDisease](tes3mobileNPC/resistCommonDisease.md)

> Direct access to the actor's common disease resistance effect attribute.

#### [resistCorprus](tes3mobileNPC/resistCorprus.md)

> Direct access to the actor's corprus disease resistance effect attribute.

#### [resistFire](tes3mobileNPC/resistFire.md)

> Direct access to the actor's fire resistance effect attribute.

#### [resistFrost](tes3mobileNPC/resistFrost.md)

> Direct access to the actor's frost resistance effect attribute.

#### [resistMagicka](tes3mobileNPC/resistMagicka.md)

> Direct access to the actor's magicka resistance effect attribute.

#### [resistNormalWeapons](tes3mobileNPC/resistNormalWeapons.md)

> Direct access to the actor's normal weapon resistance effect attribute.

#### [resistParalysis](tes3mobileNPC/resistParalysis.md)

> Direct access to the actor's paralysis resistance effect attribute.

#### [resistPoison](tes3mobileNPC/resistPoison.md)

> Direct access to the actor's poison resistance effect attribute.

#### [resistShock](tes3mobileNPC/resistShock.md)

> Direct access to the actor's shock resistance effect attribute.

#### [restoration](tes3mobileNPC/restoration.md)

> Direct access to the NPC's restoration skill statistic.

#### [runSpeed](tes3mobileNPC/runSpeed.md)

> The calculated run movement speed.

#### [sanctuary](tes3mobileNPC/sanctuary.md)

> Direct access to the actor's sanctuary effect attribute.

#### [scanInterval](tes3mobileNPC/scanInterval.md)

> No description available.

#### [scanTimer](tes3mobileNPC/scanTimer.md)

> No description available.

#### [security](tes3mobileNPC/security.md)

> Direct access to the NPC's security skill statistic.

#### [shield](tes3mobileNPC/shield.md)

> Direct access to the actor's shield effect attribute.

#### [shortBlade](tes3mobileNPC/shortBlade.md)

> Direct access to the NPC's short blade skill statistic.

#### [silence](tes3mobileNPC/silence.md)

> Direct access to the actor's silence effect attribute.

#### [skills](tes3mobileNPC/skills.md)

> An array-style table with access to the twenty seven NPC skill statistics.

#### [sneak](tes3mobileNPC/sneak.md)

> Direct access to the NPC's sneak skill statistic.

#### [sound](tes3mobileNPC/sound.md)

> Direct access to the actor's sound effect attribute.

#### [spear](tes3mobileNPC/spear.md)

> Direct access to the NPC's spear skill statistic.

#### [speechcraft](tes3mobileNPC/speechcraft.md)

> Direct access to the NPC's speechcraft skill statistic.

#### [speed](tes3mobileNPC/speed.md)

> Direct access to the actor's speed attribute statistic.

#### [spellReadied](tes3mobileNPC/spellReadied.md)

> Friendly access to the actor's flag that controls if the actor has a spell readied.

#### [strength](tes3mobileNPC/strength.md)

> Direct access to the actor's strength attribute statistic.

#### [swiftSwim](tes3mobileNPC/swiftSwim.md)

> Direct access to the actor's swift swim effect attribute.

#### [swimRunSpeed](tes3mobileNPC/swimRunSpeed.md)

> The calculated swim movement speed while running.

#### [swimSpeed](tes3mobileNPC/swimSpeed.md)

> The calculated swim movement speed.

#### [torchSlot](tes3mobileNPC/torchSlot.md)

> The currently equipped light.

#### [unarmored](tes3mobileNPC/unarmored.md)

> Direct access to the NPC's unarmored skill statistic.

#### [underwater](tes3mobileNPC/underwater.md)

> Friendly access to the actor's flag that controls if the actor is under water.

#### [velocity](tes3mobileNPC/velocity.md)

> A vector that represents the 3D velocity of the object.

#### [walkSpeed](tes3mobileNPC/walkSpeed.md)

> The calculated walk movement speed.

#### [waterBreathing](tes3mobileNPC/waterBreathing.md)

> Direct access to the actor's water breathing effect attribute.

#### [waterWalking](tes3mobileNPC/waterWalking.md)

> Direct access to the actor's water walking effect attribute.

#### [weaponDrawn](tes3mobileNPC/weaponDrawn.md)

> Friendly access to the actor's flag that controls if the actor has a weapon readied.

#### [werewolf](tes3mobileNPC/werewolf.md)

> Friendly access to the actor's flag that controls if the actor in werewolf form.

#### [width](tes3mobileNPC/width.md)

> No description available.

#### [willpower](tes3mobileNPC/willpower.md)

> Direct access to the actor's willpower attribute statistic.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3mobileNPC/applyHealthDamage
    tes3mobileNPC/equip
    tes3mobileNPC/getSkillStatistic
    tes3mobileNPC/getSkillValue
    tes3mobileNPC/hasFreeAction
    tes3mobileNPC/isAffectedByObject
    tes3mobileNPC/startCombat
    tes3mobileNPC/startDialogue
    tes3mobileNPC/stopCombat
    tes3mobileNPC/unequip
```

#### [applyHealthDamage](tes3mobileNPC/applyHealthDamage.md)

> Damages the actor.

#### [equip](tes3mobileNPC/equip.md)

> Equips an item, optionally adding the item if needed.

#### [getSkillStatistic](tes3mobileNPC/getSkillStatistic.md)

> Fetches the statistic object of a skill with a given index. This converts to the limited options available for creatures.

#### [getSkillValue](tes3mobileNPC/getSkillValue.md)

> Fetches the current value of a skill with a given index. This converts to the limited options available for creatures.

#### [hasFreeAction](tes3mobileNPC/hasFreeAction.md)

> If true, the actor isn't paralyzed, dead, stunned, or otherwise unable to take action.

#### [isAffectedByObject](tes3mobileNPC/isAffectedByObject.md)

> Determines if the actor is currently being affected by a given alchemy, enchantment, or spell.

#### [startCombat](tes3mobileNPC/startCombat.md)

> Forces the actor into combat with another actor.

#### [startDialogue](tes3mobileNPC/startDialogue.md)

> Starts dialogue with this actor for the player.

#### [stopCombat](tes3mobileNPC/stopCombat.md)

> Ends combat for the actor.

#### [unequip](tes3mobileNPC/unequip.md)

> Unequips one or more items from the actor.
