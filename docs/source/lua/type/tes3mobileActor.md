# tes3mobileActor

A mobile object for a creature, NPC, or the player.

## Properties

<dl class="describe">
<dt><code class="descname">actionBeforeCombat: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3actionData.html">tes3actionData</a></code></dt>
<dd>

Action data stored before the actor entered combat.

</dd>
<dt><code class="descname">actionData: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3actionData.html">tes3actionData</a></code></dt>
<dd>

Current action data. Pre-combat action data is stored in the actionBeforeCombat property.

</dd>
<dt><code class="descname">activeAI: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Friendly access to the actor's flag that controls if AI is active.

</dd>
<dt><code class="descname">activeMagicEffectCount: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The number of active magic effects currently operating on the actor.

</dd>
<dt><code class="descname">activeMagicEffects: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3activeMagicEffect.html">tes3activeMagicEffect</a></code></dt>
<dd>

The first active magic effect on the actor, from which all others can be accessed.

</dd>
<dt><code class="descname">actorType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of the mobile actor. 0 is a creature, 1 is an NPC, 2 is the player.

</dd>
<dt><code class="descname">agility: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Direct access to the actor's agility attribute statistic.

</dd>
<dt><code class="descname">aiPlanner: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3aiPlanner.html">tes3aiPlanner</a></code></dt>
<dd>

Access to the mobile's AI planner and AI package information.

</dd>
<dt><code class="descname">alarm: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The actor's alarm AI value.

</dd>
<dt><code class="descname">animationData: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3actorAnimationData.html">tes3actorAnimationData</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">attackBonus: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's attack bonus effect attribute.

</dd>
<dt><code class="descname">attacked: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Friendly access to the actor's flag that controls if the actor has been attacked.

</dd>
<dt><code class="descname">attributes: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

Access to a table of 8 tes3statistic objects for the actor's attributes.

</dd>
<dt><code class="descname">barterGold: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The current amount of gold that the actor has access to for bartering.

</dd>
<dt><code class="descname">blind: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's blind effect attribute.

</dd>
<dt><code class="descname">boundSize: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A vector that shows the size of the bounding box in each direction.

</dd>
<dt><code class="descname">cell: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a></code></dt>
<dd>

Fetches the cell that the actor is in.

</dd>
<dt><code class="descname">cellX: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The X grid coordinate of the cell the mobile is in.

</dd>
<dt><code class="descname">cellY: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The Y grid coordinate of the cell the mobile is in.

</dd>
<dt><code class="descname">chameleon: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's chameleon effect attribute.

</dd>
<dt><code class="descname">collidingReference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

The reference that the mobile has collided with this frame.

</dd>
<dt><code class="descname">corpseHourstamp: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">currentEnchantedItem: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3equipmentStack.html">tes3equipmentStack</a></code></dt>
<dd>

The currently equipped enchanted item that the actor will use.

</dd>
<dt><code class="descname">currentSpell: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3spell.html">tes3spell</a></code></dt>
<dd>

The currently equipped spell that the actor will use.

</dd>
<dt><code class="descname">effectAttributes: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

Access to a table of 24 numbers for the actor's effect attributes.

</dd>
<dt><code class="descname">encumbrance: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Access to the actor's encumbrance statistic.

</dd>
<dt><code class="descname">endurance: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Direct access to the actor's endurance attribute statistic.

</dd>
<dt><code class="descname">fatigue: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Access to the actor's fatigue statistic.

</dd>
<dt><code class="descname">fight: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The actor's fight AI value.

</dd>
<dt><code class="descname">flags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Access to the root mobile object flags, represented as an integer. Should not be accessed directly.

</dd>
<dt><code class="descname">flee: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The actor's flee AI value.

</dd>
<dt><code class="descname">friendlyActors: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of other tes3mobileActors that this actor considers friendly.

</dd>
<dt><code class="descname">greetDuration: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">greetTimer: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">health: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Access to the actor's health statistic.

</dd>
<dt><code class="descname">height: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The height of the mobile above the ground.

</dd>
<dt><code class="descname">hello: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The actor's hello AI value.

</dd>
<dt><code class="descname">holdBreathTime: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">hostileActors: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of other tes3mobileActors that this actor considers hostile.

</dd>
<dt><code class="descname">idleAnim: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Friendly access to the actor's flag that controls if the actor is using their idle animation.

</dd>
<dt><code class="descname">impulseVelocity: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A vector that represents the 3D acceleration of the object.

</dd>
<dt><code class="descname">inCombat: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Friendly access to the actor's flag that controls if the actor is in combat.

</dd>
<dt><code class="descname">intelligence: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Direct access to the actor's intelligence attribute statistic.

</dd>
<dt><code class="descname">invisibility: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's invisibility effect attribute.

</dd>
<dt><code class="descname">isCrittable: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Friendly access to the actor's flag that controls if the actor can be crittically hit.

</dd>
<dt><code class="descname">isFlying: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is flying.

</dd>
<dt><code class="descname">isJumping: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is jumping.

</dd>
<dt><code class="descname">isMovingBack: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is moving backwards.

</dd>
<dt><code class="descname">isMovingForward: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is moving forwards.

</dd>
<dt><code class="descname">isMovingLeft: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is moving left.

</dd>
<dt><code class="descname">isMovingRight: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is moving right.

</dd>
<dt><code class="descname">isRunning: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is running.

</dd>
<dt><code class="descname">isSneaking: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is sneaking.

</dd>
<dt><code class="descname">isStartingJump: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor has started jumping.

</dd>
<dt><code class="descname">isSwimming: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is swimming.

</dd>
<dt><code class="descname">isTurningLeft: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is turning left.

</dd>
<dt><code class="descname">isTurningRight: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is turning right.

</dd>
<dt><code class="descname">isWalking: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor's current movement flags, showing if the actor is walking.

</dd>
<dt><code class="descname">jump: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's jump effect attribute.

</dd>
<dt><code class="descname">lastGroundZ: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">levitate: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's levitate effect attribute.

</dd>
<dt><code class="descname">luck: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Direct access to the actor's luck attribute statistic.

</dd>
<dt><code class="descname">magicka: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Access to the actor's magicka statistic.

</dd>
<dt><code class="descname">magickaMultiplier: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Access to the actor's magicka multiplier statistic.

</dd>
<dt><code class="descname">movementFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Access to the root mobile object movement flags, represented as an integer. Should not be accessed directly.

</dd>
<dt><code class="descname">nextActionWeight: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">objectType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of mobile object. Maps to values in tes3.objectType.

</dd>
<dt><code class="descname">paralyze: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's paralyze effect attribute.

</dd>
<dt><code class="descname">personality: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Direct access to the actor's personality attribute statistic.

</dd>
<dt><code class="descname">position: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A vector that represents the 3D position of the object.

</dd>
<dt><code class="descname">prevMovementFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Access to the root mobile object movement flags from the previous frame, represented as an integer. Should not be accessed directly.

</dd>
<dt><code class="descname">readiedAmmo: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3equipmentStack.html">tes3equipmentStack</a></code></dt>
<dd>

The currently equipped ammo.

</dd>
<dt><code class="descname">readiedAmmoCount: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The number of ammo equipped for the readied ammo.

</dd>
<dt><code class="descname">readiedShield: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3equipmentStack.html">tes3equipmentStack</a></code></dt>
<dd>

The currently equipped shield.

</dd>
<dt><code class="descname">readiedWeapon: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3equipmentStack.html">tes3equipmentStack</a></code></dt>
<dd>

The currently equipped weapon.

</dd>
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

Access to the reference object for the mobile, if any.

</dd>
<dt><code class="descname">resistBlightDisease: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's blight disease resistance effect attribute.

</dd>
<dt><code class="descname">resistCommonDisease: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's common disease resistance effect attribute.

</dd>
<dt><code class="descname">resistCorprus: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's corprus disease resistance effect attribute.

</dd>
<dt><code class="descname">resistFire: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's fire resistance effect attribute.

</dd>
<dt><code class="descname">resistFrost: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's frost resistance effect attribute.

</dd>
<dt><code class="descname">resistMagicka: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's magicka resistance effect attribute.

</dd>
<dt><code class="descname">resistNormalWeapons: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's normal weapon resistance effect attribute.

</dd>
<dt><code class="descname">resistParalysis: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's paralysis resistance effect attribute.

</dd>
<dt><code class="descname">resistPoison: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's poison resistance effect attribute.

</dd>
<dt><code class="descname">resistShock: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's shock resistance effect attribute.

</dd>
<dt><code class="descname">sanctuary: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's sanctuary effect attribute.

</dd>
<dt><code class="descname">scanInterval: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">scanTimer: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">shield: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's shield effect attribute.

</dd>
<dt><code class="descname">silence: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's silence effect attribute.

</dd>
<dt><code class="descname">sound: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's sound effect attribute.

</dd>
<dt><code class="descname">speed: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Direct access to the actor's speed attribute statistic.

</dd>
<dt><code class="descname">spellReadied: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Friendly access to the actor's flag that controls if the actor has a spell readied.

</dd>
<dt><code class="descname">strength: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Direct access to the actor's strength attribute statistic.

</dd>
<dt><code class="descname">swiftSwim: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's swift swim effect attribute.

</dd>
<dt><code class="descname">torchSlot: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3equipmentStack.html">tes3equipmentStack</a></code></dt>
<dd>

The currently equipped light.

</dd>
<dt><code class="descname">underwater: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Friendly access to the actor's flag that controls if the actor is under water.

</dd>
<dt><code class="descname">velocity: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A vector that represents the 3D velocity of the object.

</dd>
<dt><code class="descname">waterBreathing: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's water breathing effect attribute.

</dd>
<dt><code class="descname">waterWalking: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Direct access to the actor's water walking effect attribute.

</dd>
<dt><code class="descname">weaponDrawn: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Friendly access to the actor's flag that controls if the actor has a weapon readied.

</dd>
<dt><code class="descname">werewolf: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Friendly access to the actor's flag that controls if the actor in werewolf form.

</dd>
<dt><code class="descname">width: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">willpower: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3statistic.html">tes3statistic</a></code></dt>
<dd>

Direct access to the actor's willpower attribute statistic.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">applyHealthDamage(<i>damage:</i> number, <i>flipDifficultyScale:</i> boolean, <i>scaleWithDifficulty:</i> boolean, <i>takeHealth:</i> boolean) -> boolean</code></dt>
<dd>

Damages the actor.

</dd>
<dt><code class="descname">getSkillStatistic(<i>skillId:</i> number) -> tes3skillStatistic</code></dt>
<dd>

Fetches the statistic object of a skill with a given index. This converts to the limited options available for creatures.

</dd>
<dt><code class="descname">getSkillValue(<i>skillId:</i> number) -> number</code></dt>
<dd>

Fetches the current value of a skill with a given index. This converts to the limited options available for creatures.

</dd>
<dt><code class="descname">hasFreeAction()</code></dt>
<dd>

If true, the actor isn't paralyzed, dead, stunned, or otherwise unable to take action.

</dd>
<dt><code class="descname">isAffectedByObject(<i>object:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3alchemy.html">tes3alchemy</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3enchantment.html">tes3enchantment</a>|tes3spell) -> boolean</code></dt>
<dd>

Determines if the actor is currently being affected by a given alchemy, enchantment, or spell.

</dd>
<dt><code class="descname">startCombat(<i>target:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>)</code></dt>
<dd>

Forces the actor into combat with another actor.

</dd>
<dt><code class="descname">startDialogue()</code></dt>
<dd>

Starts dialogue with this actor for the player.

</dd>
<dt><code class="descname">stopCombat(<i>force:</i> boolean)</code></dt>
<dd>

Ends combat for the actor.

</dd>
</dl>
