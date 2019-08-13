
--- A mobile object for a creature.
---@class tes3mobileCreature : tes3mobileActor
tes3mobileCreature = {}

--- Direct access to the actor's current movement flags, showing if the actor is moving right.
---@type boolean
tes3mobileCreature.isMovingRight = nil

--- Direct access to the actor's current movement flags, showing if the actor is sneaking.
---@type boolean
tes3mobileCreature.isSneaking = nil

--- The currently equipped spell that the actor will use.
---@type tes3spell
tes3mobileCreature.currentSpell = nil

--- Direct access to the creature's magic statistic.
---@type tes3statistic
tes3mobileCreature.magic = nil

--- The first active magic effect on the actor, from which all others can be accessed.
---@type tes3activeMagicEffect
tes3mobileCreature.activeMagicEffects = nil

--- Friendly access to the actor's flag that controls if the actor in werewolf form.
---@type boolean
tes3mobileCreature.werewolf = nil

--- Direct access to the actor's luck attribute statistic.
---@type tes3statistic
tes3mobileCreature.luck = nil

--- Direct access to the actor's swift swim effect attribute.
---@type number
tes3mobileCreature.swiftSwim = nil

--- A vector that represents the 3D velocity of the object.
---@type tes3vector3
tes3mobileCreature.velocity = nil

--- Fetches the statistic object of a skill with a given index. This converts to the limited options available for creatures.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileCreature/getSkillStatistic.html).
---@type method
---@param skillId number { comment = "The index of the skill statistic to fetch." }
---@return tes3skillStatistic
function tes3mobileCreature:getSkillStatistic(skillId) end

--- The type of mobile object. Maps to values in tes3.objectType.
---@type number
tes3mobileCreature.objectType = nil

---@type tes3actorAnimationData
tes3mobileCreature.animationData = nil

--- The type of the mobile actor. 0 is a creature, 1 is an NPC, 2 is the player.
---@type number
tes3mobileCreature.actorType = nil

--- A vector that represents the 3D position of the object.
---@type tes3vector3
tes3mobileCreature.position = nil

--- The currently equipped shield.
---@type tes3equipmentStack
tes3mobileCreature.readiedShield = nil

--- Access to the reference object for the mobile, if any.
---@type tes3reference
tes3mobileCreature.reference = nil

--- The actor's alarm AI value.
---@type number
tes3mobileCreature.alarm = nil

--- Access to the actor's health statistic.
---@type tes3statistic
tes3mobileCreature.health = nil

--- Determines if the actor is currently being affected by a given alchemy, enchantment, or spell.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileCreature/isAffectedByObject.html).
---@type method
---@param object tes3alchemy|tes3enchantment|tes3spell { comment = "The magic to check for." }
---@return boolean
function tes3mobileCreature:isAffectedByObject(object) end

--- Friendly access to the actor's flag that controls if the actor has a spell readied.
---@type boolean
tes3mobileCreature.spellReadied = nil

--- The X grid coordinate of the cell the mobile is in.
---@type number
tes3mobileCreature.cellX = nil

--- The number of ammo equipped for the readied ammo.
---@type number
tes3mobileCreature.readiedAmmoCount = nil

--- The currently equipped enchanted item that the actor will use.
---@type tes3equipmentStack
tes3mobileCreature.currentEnchantedItem = nil

---@type number
tes3mobileCreature.corpseHourstamp = nil

--- Action data stored before the actor entered combat.
---@type tes3actionData
tes3mobileCreature.actionBeforeCombat = nil

--- Direct access to the actor's current movement flags, showing if the actor has started jumping.
---@type boolean
tes3mobileCreature.isStartingJump = nil

--- Friendly access to the actor's flag that controls if the actor has a weapon readied.
---@type boolean
tes3mobileCreature.weaponDrawn = nil

--- Direct access to the actor's water breathing effect attribute.
---@type number
tes3mobileCreature.waterBreathing = nil

--- A vector that shows the size of the bounding box in each direction.
---@type tes3vector3
tes3mobileCreature.boundSize = nil

--- The calculated swim movement speed while running.
---@type number
tes3mobileCreature.swimRunSpeed = nil

--- Direct access to the actor's blight disease resistance effect attribute.
---@type number
tes3mobileCreature.resistBlightDisease = nil

--- Current action data. Pre-combat action data is stored in the actionBeforeCombat property.
---@type tes3actionData
tes3mobileCreature.actionData = nil

--- The current amount of gold that the actor has access to for bartering.
---@type number
tes3mobileCreature.barterGold = nil

--- Access to the root mobile object movement flags from the previous frame, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileCreature.prevMovementFlags = nil

--- Access to the mobile's AI planner and AI package information.
---@type tes3aiPlanner
tes3mobileCreature.aiPlanner = nil

--- Direct access to the actor's current movement flags, showing if the actor is jumping.
---@type boolean
tes3mobileCreature.isJumping = nil

--- Direct access to the actor's current movement flags, showing if the actor is swimming.
---@type boolean
tes3mobileCreature.isSwimming = nil

--- Direct access to the actor's agility attribute statistic.
---@type tes3statistic
tes3mobileCreature.agility = nil

--- Direct access to the actor's endurance attribute statistic.
---@type tes3statistic
tes3mobileCreature.endurance = nil

--- Direct access to the actor's paralyze effect attribute.
---@type number
tes3mobileCreature.paralyze = nil

--- Direct access to the actor's silence effect attribute.
---@type number
tes3mobileCreature.silence = nil

--- A collection of other tes3mobileActors that this actor considers friendly.
---@type tes3iterator
tes3mobileCreature.friendlyActors = nil

--- Direct access to the actor's current movement flags, showing if the actor is moving forwards.
---@type boolean
tes3mobileCreature.isMovingForward = nil

--- The currently equipped light.
---@type tes3equipmentStack
tes3mobileCreature.torchSlot = nil

--- The Y grid coordinate of the cell the mobile is in.
---@type number
tes3mobileCreature.cellY = nil

--- A collection of other tes3mobileActors that this actor considers hostile.
---@type tes3iterator
tes3mobileCreature.hostileActors = nil

--- Direct access to the actor's blind effect attribute.
---@type number
tes3mobileCreature.blind = nil

--- Direct access to the actor's jump effect attribute.
---@type number
tes3mobileCreature.jump = nil

--- Access to the root mobile object movement flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileCreature.movementFlags = nil

---@type number
tes3mobileCreature.holdBreathTime = nil

--- Direct access to the actor's current movement flags, showing if the actor is turning right.
---@type boolean
tes3mobileCreature.isTurningRight = nil

--- Friendly access to the actor's flag that controls if the actor has been attacked.
---@type boolean
tes3mobileCreature.attacked = nil

--- Direct access to the actor's sanctuary effect attribute.
---@type number
tes3mobileCreature.sanctuary = nil

--- Friendly access to the actor's flag that controls if the actor is using their idle animation.
---@type boolean
tes3mobileCreature.idleAnim = nil

---@type number
tes3mobileCreature.lastGroundZ = nil

--- Starts dialogue with this actor for the player.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileCreature/startDialogue.html).
---@type method
function tes3mobileCreature:startDialogue() end

--- Direct access to the actor's paralysis resistance effect attribute.
---@type number
tes3mobileCreature.resistParalysis = nil

--- Friendly access to the actor's flag that controls if AI is active.
---@type boolean
tes3mobileCreature.activeAI = nil

--- Direct access to the actor's current movement flags, showing if the actor is walking.
---@type boolean
tes3mobileCreature.isWalking = nil

--- Direct access to the actor's fire resistance effect attribute.
---@type number
tes3mobileCreature.resistFire = nil

--- Direct access to the actor's frost resistance effect attribute.
---@type number
tes3mobileCreature.resistFrost = nil

--- Access to the actor's encumbrance statistic.
---@type tes3statistic
tes3mobileCreature.encumbrance = nil

--- Access to the actor's magicka statistic.
---@type tes3statistic
tes3mobileCreature.magicka = nil

--- Direct access to the actor's shield effect attribute.
---@type number
tes3mobileCreature.shield = nil

--- Direct access to the actor's current movement flags, showing if the actor is flying.
---@type boolean
tes3mobileCreature.isFlying = nil

---@type number
tes3mobileCreature.nextActionWeight = nil

--- Direct access to the actor's magicka resistance effect attribute.
---@type number
tes3mobileCreature.resistMagicka = nil

--- Direct access to the actor's shock resistance effect attribute.
---@type number
tes3mobileCreature.resistShock = nil

--- Direct access to the actor's current movement flags, showing if the actor is turning left.
---@type boolean
tes3mobileCreature.isTurningLeft = nil

--- The reference that the mobile has collided with this frame.
---@type tes3reference
tes3mobileCreature.collidingReference = nil

--- Direct access to the actor's speed attribute statistic.
---@type tes3statistic
tes3mobileCreature.speed = nil

--- Fetches the cell that the actor is in.
---@type tes3cell
tes3mobileCreature.cell = nil

--- Fetches the current value of a skill with a given index. This converts to the limited options available for creatures.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileCreature/getSkillValue.html).
---@type method
---@param skillId number { comment = "The index of the skill statistic's value to fetch." }
---@return number
function tes3mobileCreature:getSkillValue(skillId) end

--- Direct access to the actor's sound effect attribute.
---@type number
tes3mobileCreature.sound = nil

--- Ends combat for the actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileCreature/stopCombat.html).
---@type method
---@param force boolean { comment = "If false, the function won't stop combat if the actor has other valid hostile targets." }
function tes3mobileCreature:stopCombat(force) end

--- Direct access to the actor's current movement flags, showing if the actor is moving left.
---@type boolean
tes3mobileCreature.isMovingLeft = nil

--- Friendly access to the actor's flag that controls if the actor is under water.
---@type boolean
tes3mobileCreature.underwater = nil

--- Direct access to the actor's current movement flags, showing if the actor is running.
---@type boolean
tes3mobileCreature.isRunning = nil

--- Direct access to the actor's invisibility effect attribute.
---@type number
tes3mobileCreature.invisibility = nil

--- The number of active magic effects currently operating on the actor.
---@type number
tes3mobileCreature.activeMagicEffectCount = nil

--- The currently equipped weapon.
---@type tes3equipmentStack
tes3mobileCreature.readiedWeapon = nil

--- Direct access to the actor's attack bonus effect attribute.
---@type number
tes3mobileCreature.attackBonus = nil

--- Access to the root mobile object flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileCreature.flags = nil

--- Friendly access to the actor's flag that controls if the actor is in combat.
---@type boolean
tes3mobileCreature.inCombat = nil

--- Friendly access to the actor's flag that controls if the actor can be crittically hit.
---@type boolean
tes3mobileCreature.isCrittable = nil

--- The actor's flee AI value.
---@type number
tes3mobileCreature.flee = nil

--- The height of the mobile above the ground.
---@type number
tes3mobileCreature.height = nil

---@type number
tes3mobileCreature.greetTimer = nil

--- Direct access to the actor's current movement flags, showing if the actor is moving backwards.
---@type boolean
tes3mobileCreature.isMovingBack = nil

--- The currently equipped ammo.
---@type tes3equipmentStack
tes3mobileCreature.readiedAmmo = nil

--- A vector that represents the 3D acceleration of the object.
---@type tes3vector3
tes3mobileCreature.impulseVelocity = nil

--- Direct access to the creature's combat statistic.
---@type tes3statistic
tes3mobileCreature.combat = nil

--- The calculated run movement speed.
---@type number
tes3mobileCreature.runSpeed = nil

--- The calculated swim movement speed.
---@type number
tes3mobileCreature.swimSpeed = nil

--- Direct access to the actor's willpower attribute statistic.
---@type tes3statistic
tes3mobileCreature.willpower = nil

--- Direct access to the actor's intelligence attribute statistic.
---@type tes3statistic
tes3mobileCreature.intelligence = nil

---@type number
tes3mobileCreature.greetDuration = nil

--- The actor's hello AI value.
---@type number
tes3mobileCreature.hello = nil

--- The actor's fight AI value.
---@type number
tes3mobileCreature.fight = nil

--- The calculated fly movement speed.
---@type number
tes3mobileCreature.flySpeed = nil

--- Direct access to the actor's corprus disease resistance effect attribute.
---@type number
tes3mobileCreature.resistCorprus = nil

--- Direct access to the actor's poison resistance effect attribute.
---@type number
tes3mobileCreature.resistPoison = nil

--- If true, the actor isn't paralyzed, dead, stunned, or otherwise unable to take action.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileCreature/hasFreeAction.html).
---@type method
---@return boolean
function tes3mobileCreature:hasFreeAction() end

---@type number
tes3mobileCreature.scanTimer = nil

--- Access to the actor's magicka multiplier statistic.
---@type tes3statistic
tes3mobileCreature.magickaMultiplier = nil

--- Forces the actor into combat with another actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileCreature/startCombat.html).
---@type method
---@param target tes3mobileActor
function tes3mobileCreature:startCombat(target) end

--- Direct access to the actor's water walking effect attribute.
---@type number
tes3mobileCreature.waterWalking = nil

--- Direct access to the actor's levitate effect attribute.
---@type number
tes3mobileCreature.levitate = nil

--- Direct access to the actor's chameleon effect attribute.
---@type number
tes3mobileCreature.chameleon = nil

--- The calculated base movement speed.
---@type number
tes3mobileCreature.moveSpeed = nil

--- Damages the actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileCreature/applyHealthDamage.html).
---@type method
---@param damage number { comment = "The amount of damage to apply." }
---@param flipDifficultyScale boolean
---@param scaleWithDifficulty boolean { comment = "Apply difficulty scaling to the damage." }
---@param takeHealth boolean
---@return boolean
function tes3mobileCreature:applyHealthDamage(damage, flipDifficultyScale, scaleWithDifficulty, takeHealth) end

--- Direct access to the actor's strength attribute statistic.
---@type tes3statistic
tes3mobileCreature.strength = nil

---@type number
tes3mobileCreature.width = nil

--- Access to the actor's fatigue statistic.
---@type tes3statistic
tes3mobileCreature.fatigue = nil

---@type number
tes3mobileCreature.scanInterval = nil

--- The actor object that maps to this mobile.
---@type tes3creatureInstance
tes3mobileCreature.object = nil

--- Direct access to the actor's normal weapon resistance effect attribute.
---@type number
tes3mobileCreature.resistNormalWeapons = nil

--- Direct access to the actor's common disease resistance effect attribute.
---@type number
tes3mobileCreature.resistCommonDisease = nil

--- Direct access to the creature's stealth statistic.
---@type tes3statistic
tes3mobileCreature.stealth = nil

--- Direct access to the actor's personality attribute statistic.
---@type tes3statistic
tes3mobileCreature.personality = nil

--- The calculated walk movement speed.
---@type number
tes3mobileCreature.walkSpeed = nil


