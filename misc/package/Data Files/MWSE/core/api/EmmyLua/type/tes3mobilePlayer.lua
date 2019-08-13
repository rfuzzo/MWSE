
--- A mobile object for a the player.
---@class tes3mobilePlayer : tes3mobileNPC
tes3mobilePlayer = {}

--- Direct access to the actor's current movement flags, showing if the actor is moving right.
---@type boolean
tes3mobilePlayer.isMovingRight = nil

--- Checks to see if a skill is ready to be leveled up, and performs any levelup logic.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/levelSkill.html).
---@type method
---@param skill number { comment = "The skill index to check for leveling." }
function tes3mobilePlayer:levelSkill(skill) end

--- Direct access to the NPC's axe skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.axe = nil

--- Direct access to the actor's chameleon effect attribute.
---@type number
tes3mobilePlayer.chameleon = nil

--- Fetches the statistic object of a skill with a given index. This converts to the limited options available for creatures.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/getSkillStatistic.html).
---@type method
---@param skillId number { comment = "The index of the skill statistic to fetch." }
---@return tes3skillStatistic
function tes3mobilePlayer:getSkillStatistic(skillId) end

--- Direct access to the NPC's restoration skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.restoration = nil

--- The currently equipped shield.
---@type tes3equipmentStack
tes3mobilePlayer.readiedShield = nil

--- Direct access to the NPC's long blade skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.longBlade = nil

--- Toggle flag for if the player is currently travelling.
---@type boolean
tes3mobilePlayer.travelling = nil

--- Toggle flag for if the NPC jumps.
---@type boolean
tes3mobilePlayer.forceJump = nil

--- Direct access to the NPC's alchemy skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.alchemy = nil

--- Direct access to the NPC's mercantile skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.mercantile = nil

--- Direct access to the NPC's heavy armor skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.heavyArmor = nil

--- Direct access to the NPC's alteration skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.alteration = nil

--- A vector that shows the size of the bounding box in each direction.
---@type tes3vector3
tes3mobilePlayer.boundSize = nil

--- The calculated swim movement speed while running.
---@type number
tes3mobilePlayer.swimRunSpeed = nil

--- Direct access to the actor's blight disease resistance effect attribute.
---@type number
tes3mobilePlayer.resistBlightDisease = nil

--- Current action data. Pre-combat action data is stored in the actionBeforeCombat property.
---@type tes3actionData
tes3mobilePlayer.actionData = nil

--- Toggle flag for if the player's vanity camera is disabled.
---@type boolean
tes3mobilePlayer.vanityDisabled = nil

--- Direct access to the NPC's spear skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.spear = nil

--- Toggle flag for if the player has casting ready.
---@type boolean
tes3mobilePlayer.castReady = nil

--- Direct access to the actor's silence effect attribute.
---@type number
tes3mobilePlayer.silence = nil

--- The currently equipped light.
---@type tes3equipmentStack
tes3mobilePlayer.torchSlot = nil

--- Toggle flag for if the player can attack.
---@type boolean
tes3mobilePlayer.attackDisabled = nil

--- Direct access to the actor's blind effect attribute.
---@type number
tes3mobilePlayer.blind = nil

--- Direct access to the actor's jump effect attribute.
---@type number
tes3mobilePlayer.jump = nil

--- Access to the root mobile object movement flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobilePlayer.movementFlags = nil

--- Access to the structure that holds the player's current mark/recall location.
---@type tes3markData
tes3mobilePlayer.markLocation = nil

--- Direct access to the actor's sanctuary effect attribute.
---@type number
tes3mobilePlayer.sanctuary = nil

--- Direct access to the actor's paralysis resistance effect attribute.
---@type number
tes3mobilePlayer.resistParalysis = nil

--- Friendly access to the actor's flag that controls if AI is active.
---@type boolean
tes3mobilePlayer.activeAI = nil

--- Toggle flag for if the NPC moves and jumps.
---@type boolean
tes3mobilePlayer.forceMoveJump = nil

--- Direct access to the NPC's security skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.security = nil

--- Direct access to the actor's frost resistance effect attribute.
---@type number
tes3mobilePlayer.resistFrost = nil

--- Direct access to the actor's shield effect attribute.
---@type number
tes3mobilePlayer.shield = nil

--- How many hours are left while resting.
---@type number
tes3mobilePlayer.restHoursRemaining = nil

--- The last used alchemy calcinator.
---@type tes3apparatus
tes3mobilePlayer.lastUsedCalcinator = nil

--- Damages the actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/applyHealthDamage.html).
---@type method
---@param damage number { comment = "The amount of damage to apply." }
---@param flipDifficultyScale boolean
---@param scaleWithDifficulty boolean { comment = "Apply difficulty scaling to the damage." }
---@param takeHealth boolean
---@return boolean
function tes3mobilePlayer:applyHealthDamage(damage, flipDifficultyScale, scaleWithDifficulty, takeHealth) end

--- Direct access to the actor's sound effect attribute.
---@type number
tes3mobilePlayer.sound = nil

--- Ends combat for the actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/stopCombat.html).
---@type method
---@param force boolean { comment = "If false, the function won't stop combat if the actor has other valid hostile targets." }
function tes3mobilePlayer:stopCombat(force) end

--- The player's current bounty.
---@type number
tes3mobilePlayer.bounty = nil

--- Direct access to the actor's current movement flags, showing if the actor is running.
---@type boolean
tes3mobilePlayer.isRunning = nil

--- The amount of ammo for the ranged weapon that that was last equipped.
---@type number
tes3mobilePlayer.lastUsedAmmoCount = nil

--- Direct access to the actor's attack bonus effect attribute.
---@type number
tes3mobilePlayer.attackBonus = nil

--- Access to the root mobile object flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobilePlayer.flags = nil

--- The time that the player has spent inactive.
---@type number
tes3mobilePlayer.inactivityTime = nil

--- Direct access to the actor's current movement flags, showing if the actor is moving backwards.
---@type boolean
tes3mobilePlayer.isMovingBack = nil

---@type number
tes3mobilePlayer.greetTimer = nil

--- The calculated run movement speed.
---@type number
tes3mobilePlayer.runSpeed = nil

--- Direct access to the NPC's light armor skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.lightArmor = nil

--- Action data stored before the actor entered combat.
---@type tes3actionData
tes3mobilePlayer.actionBeforeCombat = nil

--- The calculated fly movement speed.
---@type number
tes3mobilePlayer.flySpeed = nil

--- The reference that the mobile has collided with this frame.
---@type tes3reference
tes3mobilePlayer.collidingReference = nil

--- Direct access to the actor's poison resistance effect attribute.
---@type number
tes3mobilePlayer.resistPoison = nil

--- If true, the actor isn't paralyzed, dead, stunned, or otherwise unable to take action.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/hasFreeAction.html).
---@type method
---@return boolean
function tes3mobilePlayer:hasFreeAction() end

--- Direct access to the NPC's acrobatics skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.acrobatics = nil

--- Access to the actor's encumbrance statistic.
---@type tes3statistic
tes3mobilePlayer.encumbrance = nil

--- Toggle flag for if the player is currently waiting.
---@type boolean
tes3mobilePlayer.waiting = nil

--- The calculated base movement speed.
---@type number
tes3mobilePlayer.moveSpeed = nil

--- Toggle flag for if the player should always run.
---@type boolean
tes3mobilePlayer.alwaysRun = nil

--- Access to the actor's fatigue statistic.
---@type tes3statistic
tes3mobilePlayer.fatigue = nil

---@type number
tes3mobilePlayer.scanInterval = nil

--- Access to the actor's health statistic.
---@type tes3statistic
tes3mobilePlayer.health = nil

--- The currently equipped enchanted item that the actor will use.
---@type tes3equipmentStack
tes3mobilePlayer.currentEnchantedItem = nil

--- Quick access to the KnownWerewolf global variable.
---@type tes3globalVariable
tes3mobilePlayer.knownWerewolf = nil

--- Friendly access to the actor's flag that controls if the actor has a weapon readied.
---@type boolean
tes3mobilePlayer.weaponDrawn = nil

--- Direct access to the actor's personality attribute statistic.
---@type tes3statistic
tes3mobilePlayer.personality = nil

--- Direct access to the actor's current movement flags, showing if the actor is sneaking.
---@type boolean
tes3mobilePlayer.isSneaking = nil

--- The currently equipped spell that the actor will use.
---@type tes3spell
tes3mobilePlayer.currentSpell = nil

--- Direct access to the actor's water walking effect attribute.
---@type number
tes3mobilePlayer.waterWalking = nil

--- The first active magic effect on the actor, from which all others can be accessed.
---@type tes3activeMagicEffect
tes3mobilePlayer.activeMagicEffects = nil

--- Toggle flag for if the player can use magic.
---@type boolean
tes3mobilePlayer.magicDisabled = nil

--- Friendly access to the actor's flag that controls if the actor is using their idle animation.
---@type boolean
tes3mobilePlayer.idleAnim = nil

--- The last used alchemy alembic.
---@type tes3apparatus
tes3mobilePlayer.lastUsedAlembic = nil

--- Direct access to the actor's current movement flags, showing if the actor is turning left.
---@type boolean
tes3mobilePlayer.isTurningLeft = nil

--- Direct access to the NPC's sneak skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.sneak = nil

--- A vector that represents the 3D velocity of the object.
---@type tes3vector3
tes3mobilePlayer.velocity = nil

---@type tes3playerAnimationData
tes3mobilePlayer.animationData = nil

--- The type of mobile object. Maps to values in tes3.objectType.
---@type number
tes3mobilePlayer.objectType = nil

--- The last used alchemy mortar.
---@type tes3apparatus
tes3mobilePlayer.lastUsedMortar = nil

--- A vector that represents the 3D position of the object.
---@type tes3vector3
tes3mobilePlayer.position = nil

--- Access to the reference object for the mobile, if any.
---@type tes3reference
tes3mobilePlayer.reference = nil

--- The actor's alarm AI value.
---@type number
tes3mobilePlayer.alarm = nil

--- Direct access to the NPC's mysticism skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.mysticism = nil

--- Direct access to the actor's levitate effect attribute.
---@type number
tes3mobilePlayer.levitate = nil

--- Friendly access to the actor's flag that controls if the actor has a spell readied.
---@type boolean
tes3mobilePlayer.spellReadied = nil

--- Unequips one or more items from the actor.
---|
---|**Accepts table parameters:**
---|* `item` (*tes3item|string*): The item to unequip. Optional.
---|* `type` (*number*): The item type to unequip. Only used if no other parameter is provided. Optional.
---|* `armorSlot` (*number*): The armor slot to unequip. Optional.
---|* `clothingSlot` (*number*): The clothing slot to unequip. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/unequip.html).
---@type method
---@param params table
---@return boolean
function tes3mobilePlayer:unequip(params) end

--- Friendly access to the actor's flag that controls if the actor has been attacked.
---@type boolean
tes3mobilePlayer.attacked = nil

--- Access to the collection that holds what dialogue topics the player has access to.
---@type tes3iterator
tes3mobilePlayer.dialogueList = nil

---@type number
tes3mobilePlayer.corpseHourstamp = nil

--- Direct access to the actor's current movement flags, showing if the actor is jumping.
---@type boolean
tes3mobilePlayer.isJumping = nil

--- Direct access to the actor's common disease resistance effect attribute.
---@type number
tes3mobilePlayer.resistCommonDisease = nil

--- A collection of other tes3mobileActors that this actor considers hostile.
---@type tes3iterator
tes3mobilePlayer.hostileActors = nil

--- Direct access to the actor's strength attribute statistic.
---@type tes3statistic
tes3mobilePlayer.strength = nil

--- Direct access to the NPC's enchant skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.enchant = nil

--- Direct access to the actor's current movement flags, showing if the actor is turning right.
---@type boolean
tes3mobilePlayer.isTurningRight = nil

--- The X grid coordinate of the cell the mobile is in.
---@type number
tes3mobilePlayer.cellX = nil

--- Direct access to the NPC's speechcraft skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.speechcraft = nil

--- The current amount of gold that the actor has access to for bartering.
---@type number
tes3mobilePlayer.barterGold = nil

--- Access to the root mobile object movement flags from the previous frame, represented as an integer. Should not be accessed directly.
---@type number
tes3mobilePlayer.prevMovementFlags = nil

--- Access to the mobile's AI planner and AI package information.
---@type tes3aiPlanner
tes3mobilePlayer.aiPlanner = nil

--- The last used alchemy retort.
---@type tes3apparatus
tes3mobilePlayer.lastUsedRetort = nil

--- Direct access to the actor's current movement flags, showing if the actor is swimming.
---@type boolean
tes3mobilePlayer.isSwimming = nil

--- Direct access to the actor's agility attribute statistic.
---@type tes3statistic
tes3mobilePlayer.agility = nil

--- Direct access to the actor's endurance attribute statistic.
---@type tes3statistic
tes3mobilePlayer.endurance = nil

---@type number
tes3mobilePlayer.lastGroundZ = nil

--- A collection of other tes3mobileActors that this actor considers friendly.
---@type tes3iterator
tes3mobilePlayer.friendlyActors = nil

--- Direct access to the actor's current movement flags, showing if the actor is moving forwards.
---@type boolean
tes3mobilePlayer.isMovingForward = nil

--- Access to the actor's magicka statistic.
---@type tes3statistic
tes3mobilePlayer.magicka = nil

--- The Y grid coordinate of the cell the mobile is in.
---@type number
tes3mobilePlayer.cellY = nil

--- Access to the actor's magicka multiplier statistic.
---@type tes3statistic
tes3mobilePlayer.magickaMultiplier = nil

--- Toggle flag for if the NPC runs.
---@type boolean
tes3mobilePlayer.forceRun = nil

--- The actor's fight AI value.
---@type number
tes3mobilePlayer.fight = nil

--- Direct access to the NPC's hand to hand skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.handToHand = nil

--- Toggle flag for if the player can switch between first person and vanity cameras.
---@type boolean
tes3mobilePlayer.viewSwitchDisabled = nil

--- Direct access to the actor's water breathing effect attribute.
---@type number
tes3mobilePlayer.waterBreathing = nil

--- Friendly access to the actor's flag that controls if the actor is under water.
---@type boolean
tes3mobilePlayer.underwater = nil

--- Direct access to the actor's paralyze effect attribute.
---@type number
tes3mobilePlayer.paralyze = nil

--- Friendly access to the actor's flag that controls if the actor can be crittically hit.
---@type boolean
tes3mobilePlayer.isCrittable = nil

--- The type of the mobile actor. 0 is a creature, 1 is an NPC, 2 is the player.
---@type number
tes3mobilePlayer.actorType = nil

--- Starts dialogue with this actor for the player.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/startDialogue.html).
---@type method
function tes3mobilePlayer:startDialogue() end

--- Toggle flag for if the player's controls are disabled.
---@type boolean
tes3mobilePlayer.controlsDisabled = nil

--- The currently equipped ammo.
---@type tes3equipmentStack
tes3mobilePlayer.readiedAmmo = nil

--- The number of ammo equipped for the readied ammo.
---@type number
tes3mobilePlayer.readiedAmmoCount = nil

--- Direct access to the player's vision bonus effect attribute.
---@type number
tes3mobilePlayer.visionBonus = nil

--- Friendly access to the actor's flag that controls if the actor is in combat.
---@type boolean
tes3mobilePlayer.inCombat = nil

--- The currently equipped weapon.
---@type tes3equipmentStack
tes3mobilePlayer.readiedWeapon = nil

--- Direct access to the NPC's block skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.block = nil

--- Toggle flag for if the player is currently sleeping.
---@type boolean
tes3mobilePlayer.sleeping = nil

--- The calculated walk movement speed.
---@type number
tes3mobilePlayer.walkSpeed = nil

--- Direct access to the NPC's illusion skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.illusion = nil

---@type number
tes3mobilePlayer.nextActionWeight = nil

--- Direct access to the NPC's conjuration skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.conjuration = nil

--- Direct access to the actor's shock resistance effect attribute.
---@type number
tes3mobilePlayer.resistShock = nil

--- Direct access to the actor's current movement flags, showing if the actor is flying.
---@type boolean
tes3mobilePlayer.isFlying = nil

--- Toggle flag for if the player can jump.
---@type boolean
tes3mobilePlayer.jumpingDisabled = nil

--- The number of active magic effects currently operating on the actor.
---@type number
tes3mobilePlayer.activeMagicEffectCount = nil

--- Direct access to the actor's speed attribute statistic.
---@type tes3statistic
tes3mobilePlayer.speed = nil

--- Fetches the cell that the actor is in.
---@type tes3cell
tes3mobilePlayer.cell = nil

--- Direct access to the player's telekinesis effect attribute.
---@type number
tes3mobilePlayer.telekinesis = nil

---@type number
tes3mobilePlayer.scanTimer = nil

--- Forces the actor into combat with another actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/startCombat.html).
---@type method
---@param target tes3mobileActor
function tes3mobilePlayer:startCombat(target) end

--- Direct access to the actor's current movement flags, showing if the actor is moving left.
---@type boolean
tes3mobilePlayer.isMovingLeft = nil

--- Fetches the current value of a skill with a given index. This converts to the limited options available for creatures.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/getSkillValue.html).
---@type method
---@param skillId number { comment = "The index of the skill statistic's value to fetch." }
---@return number
function tes3mobilePlayer:getSkillValue(skillId) end

---@type number
tes3mobilePlayer.holdBreathTime = nil

--- Direct access to the actor's current movement flags, showing if the actor has started jumping.
---@type boolean
tes3mobilePlayer.isStartingJump = nil

--- Toggle flag for if the player should constantly run forward.
---@type boolean
tes3mobilePlayer.autoRun = nil

--- Shows if the player's camera is currently in 3rd person view.
---@type boolean
tes3mobilePlayer.is3rdPerson = nil

--- Direct access to the NPC's short blade skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.shortBlade = nil

--- Toggle flag for if the player's mouse look controls are disabled.
---@type boolean
tes3mobilePlayer.mouseLookDisabled = nil

--- Toggle flag for if the player has a weapon ready.
---@type boolean
tes3mobilePlayer.weaponReady = nil

--- The actor's flee AI value.
---@type number
tes3mobilePlayer.flee = nil

--- The height of the mobile above the ground.
---@type number
tes3mobilePlayer.height = nil

--- Determines if the actor is currently being affected by a given alchemy, enchantment, or spell.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/isAffectedByObject.html).
---@type method
---@param object tes3alchemy|tes3enchantment|tes3spell { comment = "The magic to check for." }
---@return boolean
function tes3mobilePlayer:isAffectedByObject(object) end

--- Toggle flag for if the NPC sneaks.
---@type boolean
tes3mobilePlayer.forceSneak = nil

--- Direct access to the actor's invisibility effect attribute.
---@type number
tes3mobilePlayer.invisibility = nil

--- Direct access to the actor's magicka resistance effect attribute.
---@type number
tes3mobilePlayer.resistMagicka = nil

--- A vector that represents the 3D acceleration of the object.
---@type tes3vector3
tes3mobilePlayer.impulseVelocity = nil

--- Direct access to the NPC's destruction skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.destruction = nil

--- Direct access to the actor's swift swim effect attribute.
---@type number
tes3mobilePlayer.swiftSwim = nil

--- The calculated swim movement speed.
---@type number
tes3mobilePlayer.swimSpeed = nil

--- Direct access to the actor's willpower attribute statistic.
---@type tes3statistic
tes3mobilePlayer.willpower = nil

--- Direct access to the actor's intelligence attribute statistic.
---@type tes3statistic
tes3mobilePlayer.intelligence = nil

---@type number
tes3mobilePlayer.greetDuration = nil

--- The actor's hello AI value.
---@type number
tes3mobilePlayer.hello = nil

--- Direct access to the NPC's marksman skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.marksman = nil

--- Direct access to the NPC's medium armor skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.mediumArmor = nil

--- Direct access to the actor's corprus disease resistance effect attribute.
---@type number
tes3mobilePlayer.resistCorprus = nil

--- Equips an item, optionally adding the item if needed.
---|
---|**Accepts table parameters:**
---|* `item` (*tes3item|string*): The item to equip.
---|* `itemData` (*tes3itemData*): The item data to equip. Optional.
---|* `forceSpecifiedItemData` (*boolean*): If true, the first available itemData in the stack won't be chosen.
---|* `addItem` (*boolean*): If true, the item will be added to the actor's inventory if needed.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/equip.html).
---@type method
---@param params table
---@return boolean
function tes3mobilePlayer:equip(params) end

--- Direct access to the NPC's armorer skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.armorer = nil

--- Direct access to the actor's fire resistance effect attribute.
---@type number
tes3mobilePlayer.resistFire = nil

--- The progress the player has made towards leveling up.
---@type number
tes3mobilePlayer.levelUpProgress = nil

--- Quick access to the first person NPC's reference.
---@type tes3reference
tes3mobilePlayer.firstPersonReference = nil

--- Quick access to the ClawMultiplier global variable.
---@type tes3globalVariable
tes3mobilePlayer.clawMultiplier = nil

--- Direct access to the actor's current movement flags, showing if the actor is walking.
---@type boolean
tes3mobilePlayer.isWalking = nil

--- Exercises a skill, providing experience in it.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer/exerciseSkill.html).
---@type method
---@param skill number { comment = "The skill index to give experience to." }
---@param progress number { comment = "The amount of experience to grant." }
function tes3mobilePlayer:exerciseSkill(skill, progress) end

--- Friendly access to the actor's flag that controls if the actor in werewolf form.
---@type boolean
tes3mobilePlayer.werewolf = nil

--- Toggle flag for if the player is currently in jail.
---@type boolean
tes3mobilePlayer.inJail = nil

---@type number
tes3mobilePlayer.width = nil

--- Direct access to the actor's luck attribute statistic.
---@type tes3statistic
tes3mobilePlayer.luck = nil

--- The actor object that maps to this mobile.
---@type tes3npcInstance
tes3mobilePlayer.object = nil

--- Direct access to the actor's normal weapon resistance effect attribute.
---@type number
tes3mobilePlayer.resistNormalWeapons = nil

--- Direct access to the NPC's unarmored skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.unarmored = nil

--- Direct access to the NPC's athletics skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.athletics = nil

--- Direct access to the NPC's blunt weapon skill statistic.
---@type tes3skillStatistic
tes3mobilePlayer.bluntWeapon = nil

--- Quick access to the first person NPC.
---@type tes3npc
tes3mobilePlayer.firstPerson = nil


