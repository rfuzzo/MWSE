
--- A mobile object for a creature, NPC, or the player.
---@class tes3mobileActor : tes3mobileObject
tes3mobileActor = {}

--- Direct access to the actor's current movement flags, showing if the actor is moving right.
---@type boolean
tes3mobileActor.isMovingRight = nil

--- Direct access to the actor's current movement flags, showing if the actor is sneaking.
---@type boolean
tes3mobileActor.isSneaking = nil

--- The currently equipped spell that the actor will use.
---@type tes3spell
tes3mobileActor.currentSpell = nil

--- Direct access to the actor's water walking effect attribute.
---@type number
tes3mobileActor.waterWalking = nil

--- The first active magic effect on the actor, from which all others can be accessed.
---@type tes3activeMagicEffect
tes3mobileActor.activeMagicEffects = nil

--- Friendly access to the actor's flag that controls if the actor is using their idle animation.
---@type boolean
tes3mobileActor.idleAnim = nil

--- Direct access to the actor's chameleon effect attribute.
---@type number
tes3mobileActor.chameleon = nil

--- Fetches the statistic object of a skill with a given index. This converts to the limited options available for creatures.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor/getSkillStatistic.html).
---@type method
---@param skillId number { comment = "The index of the skill statistic to fetch." }
---@return tes3skillStatistic
function tes3mobileActor:getSkillStatistic(skillId) end

---@type tes3actorAnimationData
tes3mobileActor.animationData = nil

--- The actor's alarm AI value.
---@type number
tes3mobileActor.alarm = nil

--- Friendly access to the actor's flag that controls if the actor has a spell readied.
---@type boolean
tes3mobileActor.spellReadied = nil

--- Access to the reference object for the mobile, if any.
---@type tes3reference
tes3mobileActor.reference = nil

---@type number
tes3mobileActor.corpseHourstamp = nil

--- A vector that represents the 3D velocity of the object.
---@type tes3vector3
tes3mobileActor.velocity = nil

--- The type of mobile object. Maps to values in tes3.objectType.
---@type number
tes3mobileActor.objectType = nil

--- Access to the actor's magicka statistic.
---@type tes3statistic
tes3mobileActor.magicka = nil

--- A vector that represents the 3D position of the object.
---@type tes3vector3
tes3mobileActor.position = nil

--- A vector that shows the size of the bounding box in each direction.
---@type tes3vector3
tes3mobileActor.boundSize = nil

--- Direct access to the actor's current movement flags, showing if the actor has started jumping.
---@type boolean
tes3mobileActor.isStartingJump = nil

--- Direct access to the actor's blight disease resistance effect attribute.
---@type number
tes3mobileActor.resistBlightDisease = nil

--- Current action data. Pre-combat action data is stored in the actionBeforeCombat property.
---@type tes3actionData
tes3mobileActor.actionData = nil

--- The current amount of gold that the actor has access to for bartering.
---@type number
tes3mobileActor.barterGold = nil

--- Access to the root mobile object movement flags from the previous frame, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileActor.prevMovementFlags = nil

--- Access to the mobile's AI planner and AI package information.
---@type tes3aiPlanner
tes3mobileActor.aiPlanner = nil

--- Direct access to the actor's current movement flags, showing if the actor is jumping.
---@type boolean
tes3mobileActor.isJumping = nil

--- Direct access to the actor's current movement flags, showing if the actor is swimming.
---@type boolean
tes3mobileActor.isSwimming = nil

--- Direct access to the actor's agility attribute statistic.
---@type tes3statistic
tes3mobileActor.agility = nil

--- Direct access to the actor's endurance attribute statistic.
---@type tes3statistic
tes3mobileActor.endurance = nil

--- Direct access to the actor's paralyze effect attribute.
---@type number
tes3mobileActor.paralyze = nil

--- Direct access to the actor's silence effect attribute.
---@type number
tes3mobileActor.silence = nil

--- A collection of other tes3mobileActors that this actor considers friendly.
---@type tes3iterator
tes3mobileActor.friendlyActors = nil

--- The currently equipped light.
---@type tes3equipmentStack
tes3mobileActor.torchSlot = nil

---@type number
tes3mobileActor.lastGroundZ = nil

--- The Y grid coordinate of the cell the mobile is in.
---@type number
tes3mobileActor.cellY = nil

--- The X grid coordinate of the cell the mobile is in.
---@type number
tes3mobileActor.cellX = nil

--- Direct access to the actor's blind effect attribute.
---@type number
tes3mobileActor.blind = nil

--- Friendly access to the actor's flag that controls if the actor is under water.
---@type boolean
tes3mobileActor.underwater = nil

--- Access to the root mobile object movement flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileActor.movementFlags = nil

--- The currently equipped shield.
---@type tes3equipmentStack
tes3mobileActor.readiedShield = nil

--- Action data stored before the actor entered combat.
---@type tes3actionData
tes3mobileActor.actionBeforeCombat = nil

--- Direct access to the actor's swift swim effect attribute.
---@type number
tes3mobileActor.swiftSwim = nil

--- Direct access to the actor's sanctuary effect attribute.
---@type number
tes3mobileActor.sanctuary = nil

--- Direct access to the actor's current movement flags, showing if the actor is moving forwards.
---@type boolean
tes3mobileActor.isMovingForward = nil

--- Determines if the actor is currently being affected by a given alchemy, enchantment, or spell.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor/isAffectedByObject.html).
---@type method
---@param object tes3alchemy|tes3enchantment|tes3spell { comment = "The magic to check for." }
---@return boolean
function tes3mobileActor:isAffectedByObject(object) end

--- Starts dialogue with this actor for the player.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor/startDialogue.html).
---@type method
function tes3mobileActor:startDialogue() end

--- Direct access to the actor's paralysis resistance effect attribute.
---@type number
tes3mobileActor.resistParalysis = nil

--- Friendly access to the actor's flag that controls if AI is active.
---@type boolean
tes3mobileActor.activeAI = nil

--- Direct access to the actor's current movement flags, showing if the actor is walking.
---@type boolean
tes3mobileActor.isWalking = nil

--- Direct access to the actor's fire resistance effect attribute.
---@type number
tes3mobileActor.resistFire = nil

--- Direct access to the actor's frost resistance effect attribute.
---@type number
tes3mobileActor.resistFrost = nil

--- The currently equipped enchanted item that the actor will use.
---@type tes3equipmentStack
tes3mobileActor.currentEnchantedItem = nil

--- Access to the actor's health statistic.
---@type tes3statistic
tes3mobileActor.health = nil

---@type number
tes3mobileActor.scanTimer = nil

--- Direct access to the actor's shield effect attribute.
---@type number
tes3mobileActor.shield = nil

--- Direct access to the actor's current movement flags, showing if the actor is flying.
---@type boolean
tes3mobileActor.isFlying = nil

---@type number
tes3mobileActor.nextActionWeight = nil

--- Direct access to the actor's magicka resistance effect attribute.
---@type number
tes3mobileActor.resistMagicka = nil

--- Direct access to the actor's shock resistance effect attribute.
---@type number
tes3mobileActor.resistShock = nil

--- A collection of other tes3mobileActors that this actor considers hostile.
---@type tes3iterator
tes3mobileActor.hostileActors = nil

--- Fetches the current value of a skill with a given index. This converts to the limited options available for creatures.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor/getSkillValue.html).
---@type method
---@param skillId number { comment = "The index of the skill statistic's value to fetch." }
---@return number
function tes3mobileActor:getSkillValue(skillId) end

--- Damages the actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor/applyHealthDamage.html).
---@type method
---@param damage number { comment = "The amount of damage to apply." }
---@param flipDifficultyScale boolean
---@param scaleWithDifficulty boolean { comment = "Apply difficulty scaling to the damage." }
---@param takeHealth boolean
---@return boolean
function tes3mobileActor:applyHealthDamage(damage, flipDifficultyScale, scaleWithDifficulty, takeHealth) end

--- Fetches the cell that the actor is in.
---@type tes3cell
tes3mobileActor.cell = nil

--- Direct access to the actor's sound effect attribute.
---@type number
tes3mobileActor.sound = nil

---@type number
tes3mobileActor.holdBreathTime = nil

--- Ends combat for the actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor/stopCombat.html).
---@type method
---@param force boolean { comment = "If false, the function won't stop combat if the actor has other valid hostile targets." }
function tes3mobileActor:stopCombat(force) end

--- Direct access to the actor's current movement flags, showing if the actor is moving left.
---@type boolean
tes3mobileActor.isMovingLeft = nil

--- Direct access to the actor's luck attribute statistic.
---@type tes3statistic
tes3mobileActor.luck = nil

--- Direct access to the actor's current movement flags, showing if the actor is running.
---@type boolean
tes3mobileActor.isRunning = nil

--- Friendly access to the actor's flag that controls if the actor has been attacked.
---@type boolean
tes3mobileActor.attacked = nil

--- The number of active magic effects currently operating on the actor.
---@type number
tes3mobileActor.activeMagicEffectCount = nil

--- Forces the actor into combat with another actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor/startCombat.html).
---@type method
---@param target tes3mobileActor
function tes3mobileActor:startCombat(target) end

--- Direct access to the actor's attack bonus effect attribute.
---@type number
tes3mobileActor.attackBonus = nil

--- Access to the root mobile object flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileActor.flags = nil

--- Access to the actor's encumbrance statistic.
---@type tes3statistic
tes3mobileActor.encumbrance = nil

--- The actor's flee AI value.
---@type number
tes3mobileActor.flee = nil

--- The height of the mobile above the ground.
---@type number
tes3mobileActor.height = nil

--- The number of ammo equipped for the readied ammo.
---@type number
tes3mobileActor.readiedAmmoCount = nil

--- Direct access to the actor's current movement flags, showing if the actor is turning left.
---@type boolean
tes3mobileActor.isTurningLeft = nil

--- Direct access to the actor's current movement flags, showing if the actor is moving backwards.
---@type boolean
tes3mobileActor.isMovingBack = nil

--- The reference that the mobile has collided with this frame.
---@type tes3reference
tes3mobileActor.collidingReference = nil

--- A vector that represents the 3D acceleration of the object.
---@type tes3vector3
tes3mobileActor.impulseVelocity = nil

---@type number
tes3mobileActor.greetTimer = nil

--- The type of the mobile actor. 0 is a creature, 1 is an NPC, 2 is the player.
---@type number
tes3mobileActor.actorType = nil

--- Friendly access to the actor's flag that controls if the actor can be crittically hit.
---@type boolean
tes3mobileActor.isCrittable = nil

--- Direct access to the actor's willpower attribute statistic.
---@type tes3statistic
tes3mobileActor.willpower = nil

--- Direct access to the actor's intelligence attribute statistic.
---@type tes3statistic
tes3mobileActor.intelligence = nil

---@type number
tes3mobileActor.greetDuration = nil

--- The actor's hello AI value.
---@type number
tes3mobileActor.hello = nil

--- The actor's fight AI value.
---@type number
tes3mobileActor.fight = nil

--- The currently equipped ammo.
---@type tes3equipmentStack
tes3mobileActor.readiedAmmo = nil

--- Direct access to the actor's corprus disease resistance effect attribute.
---@type number
tes3mobileActor.resistCorprus = nil

--- Direct access to the actor's poison resistance effect attribute.
---@type number
tes3mobileActor.resistPoison = nil

--- If true, the actor isn't paralyzed, dead, stunned, or otherwise unable to take action.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor/hasFreeAction.html).
---@type method
---@return boolean
function tes3mobileActor:hasFreeAction() end

--- Friendly access to the actor's flag that controls if the actor is in combat.
---@type boolean
tes3mobileActor.inCombat = nil

--- Access to the actor's magicka multiplier statistic.
---@type tes3statistic
tes3mobileActor.magickaMultiplier = nil

--- The currently equipped weapon.
---@type tes3equipmentStack
tes3mobileActor.readiedWeapon = nil

--- Direct access to the actor's invisibility effect attribute.
---@type number
tes3mobileActor.invisibility = nil

--- Direct access to the actor's levitate effect attribute.
---@type number
tes3mobileActor.levitate = nil

--- Friendly access to the actor's flag that controls if the actor in werewolf form.
---@type boolean
tes3mobileActor.werewolf = nil

--- Direct access to the actor's current movement flags, showing if the actor is turning right.
---@type boolean
tes3mobileActor.isTurningRight = nil

--- Direct access to the actor's speed attribute statistic.
---@type tes3statistic
tes3mobileActor.speed = nil

--- Direct access to the actor's strength attribute statistic.
---@type tes3statistic
tes3mobileActor.strength = nil

---@type number
tes3mobileActor.width = nil

--- Access to the actor's fatigue statistic.
---@type tes3statistic
tes3mobileActor.fatigue = nil

---@type number
tes3mobileActor.scanInterval = nil

--- Direct access to the actor's water breathing effect attribute.
---@type number
tes3mobileActor.waterBreathing = nil

--- Direct access to the actor's normal weapon resistance effect attribute.
---@type number
tes3mobileActor.resistNormalWeapons = nil

--- Direct access to the actor's common disease resistance effect attribute.
---@type number
tes3mobileActor.resistCommonDisease = nil

--- Friendly access to the actor's flag that controls if the actor has a weapon readied.
---@type boolean
tes3mobileActor.weaponDrawn = nil

--- Direct access to the actor's personality attribute statistic.
---@type tes3statistic
tes3mobileActor.personality = nil

--- Direct access to the actor's jump effect attribute.
---@type number
tes3mobileActor.jump = nil


