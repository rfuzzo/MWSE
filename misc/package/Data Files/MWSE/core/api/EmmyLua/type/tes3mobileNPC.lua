
--- A mobile object for an NPC.
---@class tes3mobileNPC : tes3mobileActor
tes3mobileNPC = {}

--- Direct access to the NPC's enchant skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.enchant = nil

--- Direct access to the NPC's axe skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.axe = nil

--- Direct access to the actor's luck attribute statistic.
---@type tes3statistic
tes3mobileNPC.luck = nil

--- Fetches the statistic object of a skill with a given index. This converts to the limited options available for creatures.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileNPC/getSkillStatistic.html).
---@type method
---@param skillId number { comment = "The index of the skill statistic to fetch." }
---@return tes3skillStatistic
function tes3mobileNPC:getSkillStatistic(skillId) end

--- Direct access to the NPC's restoration skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.restoration = nil

--- The currently equipped shield.
---@type tes3equipmentStack
tes3mobileNPC.readiedShield = nil

--- Direct access to the NPC's long blade skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.longBlade = nil

--- Toggle flag for if the NPC jumps.
---@type boolean
tes3mobileNPC.forceJump = nil

--- Direct access to the NPC's alchemy skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.alchemy = nil

--- Direct access to the NPC's mercantile skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.mercantile = nil

--- Direct access to the NPC's heavy armor skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.heavyArmor = nil

--- Direct access to the NPC's alteration skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.alteration = nil

--- A vector that shows the size of the bounding box in each direction.
---@type tes3vector3
tes3mobileNPC.boundSize = nil

--- Direct access to the actor's current movement flags, showing if the actor has started jumping.
---@type boolean
tes3mobileNPC.isStartingJump = nil

--- Direct access to the actor's blight disease resistance effect attribute.
---@type number
tes3mobileNPC.resistBlightDisease = nil

--- Current action data. Pre-combat action data is stored in the actionBeforeCombat property.
---@type tes3actionData
tes3mobileNPC.actionData = nil

--- Direct access to the actor's current movement flags, showing if the actor is jumping.
---@type boolean
tes3mobileNPC.isJumping = nil

--- Direct access to the actor's paralyze effect attribute.
---@type number
tes3mobileNPC.paralyze = nil

--- Direct access to the actor's silence effect attribute.
---@type number
tes3mobileNPC.silence = nil

--- The currently equipped light.
---@type tes3equipmentStack
tes3mobileNPC.torchSlot = nil

--- Direct access to the actor's blind effect attribute.
---@type number
tes3mobileNPC.blind = nil

--- Friendly access to the actor's flag that controls if the actor is under water.
---@type boolean
tes3mobileNPC.underwater = nil

--- Access to the root mobile object movement flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileNPC.movementFlags = nil

--- Direct access to the actor's sanctuary effect attribute.
---@type number
tes3mobileNPC.sanctuary = nil

--- Direct access to the actor's paralysis resistance effect attribute.
---@type number
tes3mobileNPC.resistParalysis = nil

--- Determines if the actor is currently being affected by a given alchemy, enchantment, or spell.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileNPC/isAffectedByObject.html).
---@type method
---@param object tes3alchemy|tes3enchantment|tes3spell { comment = "The magic to check for." }
---@return boolean
function tes3mobileNPC:isAffectedByObject(object) end

--- Toggle flag for if the NPC moves and jumps.
---@type boolean
tes3mobileNPC.forceMoveJump = nil

--- Direct access to the NPC's illusion skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.illusion = nil

--- Direct access to the actor's frost resistance effect attribute.
---@type number
tes3mobileNPC.resistFrost = nil

--- Direct access to the actor's shield effect attribute.
---@type number
tes3mobileNPC.shield = nil

--- Damages the actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileNPC/applyHealthDamage.html).
---@type method
---@param damage number { comment = "The amount of damage to apply." }
---@param flipDifficultyScale boolean
---@param scaleWithDifficulty boolean { comment = "Apply difficulty scaling to the damage." }
---@param takeHealth boolean
---@return boolean
function tes3mobileNPC:applyHealthDamage(damage, flipDifficultyScale, scaleWithDifficulty, takeHealth) end

--- Direct access to the actor's sound effect attribute.
---@type number
tes3mobileNPC.sound = nil

--- Ends combat for the actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileNPC/stopCombat.html).
---@type method
---@param force boolean { comment = "If false, the function won't stop combat if the actor has other valid hostile targets." }
function tes3mobileNPC:stopCombat(force) end

--- Direct access to the actor's current movement flags, showing if the actor is running.
---@type boolean
tes3mobileNPC.isRunning = nil

--- Direct access to the actor's attack bonus effect attribute.
---@type number
tes3mobileNPC.attackBonus = nil

--- Access to the root mobile object flags, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileNPC.flags = nil

--- Direct access to the actor's current movement flags, showing if the actor is moving backwards.
---@type boolean
tes3mobileNPC.isMovingBack = nil

---@type number
tes3mobileNPC.greetTimer = nil

--- The calculated run movement speed.
---@type number
tes3mobileNPC.runSpeed = nil

--- Direct access to the NPC's light armor skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.lightArmor = nil

--- Action data stored before the actor entered combat.
---@type tes3actionData
tes3mobileNPC.actionBeforeCombat = nil

--- The calculated fly movement speed.
---@type number
tes3mobileNPC.flySpeed = nil

--- The reference that the mobile has collided with this frame.
---@type tes3reference
tes3mobileNPC.collidingReference = nil

--- Direct access to the actor's poison resistance effect attribute.
---@type number
tes3mobileNPC.resistPoison = nil

--- If true, the actor isn't paralyzed, dead, stunned, or otherwise unable to take action.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileNPC/hasFreeAction.html).
---@type method
---@return boolean
function tes3mobileNPC:hasFreeAction() end

--- Direct access to the NPC's acrobatics skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.acrobatics = nil

--- Access to the actor's encumbrance statistic.
---@type tes3statistic
tes3mobileNPC.encumbrance = nil

--- The calculated base movement speed.
---@type number
tes3mobileNPC.moveSpeed = nil

--- A collection of other tes3mobileActors that this actor considers hostile.
---@type tes3iterator
tes3mobileNPC.hostileActors = nil

--- Access to the actor's fatigue statistic.
---@type tes3statistic
tes3mobileNPC.fatigue = nil

---@type number
tes3mobileNPC.scanInterval = nil

--- Access to the actor's health statistic.
---@type tes3statistic
tes3mobileNPC.health = nil

--- The currently equipped enchanted item that the actor will use.
---@type tes3equipmentStack
tes3mobileNPC.currentEnchantedItem = nil

--- Direct access to the actor's common disease resistance effect attribute.
---@type number
tes3mobileNPC.resistCommonDisease = nil

--- Friendly access to the actor's flag that controls if the actor has a weapon readied.
---@type boolean
tes3mobileNPC.weaponDrawn = nil

--- Direct access to the actor's personality attribute statistic.
---@type tes3statistic
tes3mobileNPC.personality = nil

--- Direct access to the actor's current movement flags, showing if the actor is sneaking.
---@type boolean
tes3mobileNPC.isSneaking = nil

--- The currently equipped spell that the actor will use.
---@type tes3spell
tes3mobileNPC.currentSpell = nil

--- Direct access to the actor's water walking effect attribute.
---@type number
tes3mobileNPC.waterWalking = nil

--- The first active magic effect on the actor, from which all others can be accessed.
---@type tes3activeMagicEffect
tes3mobileNPC.activeMagicEffects = nil

--- Friendly access to the actor's flag that controls if the actor in werewolf form.
---@type boolean
tes3mobileNPC.werewolf = nil

--- Direct access to the NPC's block skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.block = nil

---@type tes3actorAnimationData
tes3mobileNPC.animationData = nil

--- The actor's alarm AI value.
---@type number
tes3mobileNPC.alarm = nil

--- Direct access to the NPC's mysticism skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.mysticism = nil

--- Friendly access to the actor's flag that controls if the actor has a spell readied.
---@type boolean
tes3mobileNPC.spellReadied = nil

--- Unequips one or more items from the actor.
---|
---|**Accepts table parameters:**
---|* `item` (*tes3item|string*): The item to unequip. Optional.
---|* `type` (*number*): The item type to unequip. Only used if no other parameter is provided. Optional.
---|* `armorSlot` (*number*): The armor slot to unequip. Optional.
---|* `clothingSlot` (*number*): The clothing slot to unequip. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileNPC/unequip.html).
---@type method
---@param params table
---@return boolean
function tes3mobileNPC:unequip(params) end

--- Direct access to the NPC's destruction skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.destruction = nil

---@type number
tes3mobileNPC.corpseHourstamp = nil

--- The X grid coordinate of the cell the mobile is in.
---@type number
tes3mobileNPC.cellX = nil

--- Direct access to the NPC's speechcraft skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.speechcraft = nil

--- The current amount of gold that the actor has access to for bartering.
---@type number
tes3mobileNPC.barterGold = nil

--- Access to the root mobile object movement flags from the previous frame, represented as an integer. Should not be accessed directly.
---@type number
tes3mobileNPC.prevMovementFlags = nil

--- Access to the mobile's AI planner and AI package information.
---@type tes3aiPlanner
tes3mobileNPC.aiPlanner = nil

---@type number
tes3mobileNPC.scanTimer = nil

--- Direct access to the actor's agility attribute statistic.
---@type tes3statistic
tes3mobileNPC.agility = nil

--- Direct access to the actor's endurance attribute statistic.
---@type tes3statistic
tes3mobileNPC.endurance = nil

--- A collection of other tes3mobileActors that this actor considers friendly.
---@type tes3iterator
tes3mobileNPC.friendlyActors = nil

--- Direct access to the actor's current movement flags, showing if the actor is moving forwards.
---@type boolean
tes3mobileNPC.isMovingForward = nil

--- The Y grid coordinate of the cell the mobile is in.
---@type number
tes3mobileNPC.cellY = nil

--- Direct access to the actor's swift swim effect attribute.
---@type number
tes3mobileNPC.swiftSwim = nil

--- Direct access to the NPC's hand to hand skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.handToHand = nil

--- A vector that represents the 3D velocity of the object.
---@type tes3vector3
tes3mobileNPC.velocity = nil

--- Starts dialogue with this actor for the player.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileNPC/startDialogue.html).
---@type method
function tes3mobileNPC:startDialogue() end

--- The type of mobile object. Maps to values in tes3.objectType.
---@type number
tes3mobileNPC.objectType = nil

--- The calculated swim movement speed while running.
---@type number
tes3mobileNPC.swimRunSpeed = nil

--- A vector that represents the 3D position of the object.
---@type tes3vector3
tes3mobileNPC.position = nil

--- Access to the reference object for the mobile, if any.
---@type tes3reference
tes3mobileNPC.reference = nil

--- Direct access to the actor's current movement flags, showing if the actor is swimming.
---@type boolean
tes3mobileNPC.isSwimming = nil

--- Friendly access to the actor's flag that controls if AI is active.
---@type boolean
tes3mobileNPC.activeAI = nil

--- Access to the actor's magicka statistic.
---@type tes3statistic
tes3mobileNPC.magicka = nil

--- Direct access to the actor's current movement flags, showing if the actor is turning right.
---@type boolean
tes3mobileNPC.isTurningRight = nil

--- Friendly access to the actor's flag that controls if the actor has been attacked.
---@type boolean
tes3mobileNPC.attacked = nil

--- Direct access to the actor's levitate effect attribute.
---@type number
tes3mobileNPC.levitate = nil

---@type number
tes3mobileNPC.nextActionWeight = nil

--- Direct access to the NPC's conjuration skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.conjuration = nil

--- Direct access to the actor's shock resistance effect attribute.
---@type number
tes3mobileNPC.resistShock = nil

--- Direct access to the actor's current movement flags, showing if the actor is moving right.
---@type boolean
tes3mobileNPC.isMovingRight = nil

--- Direct access to the NPC's armorer skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.armorer = nil

---@type number
tes3mobileNPC.lastGroundZ = nil

--- Direct access to the actor's speed attribute statistic.
---@type tes3statistic
tes3mobileNPC.speed = nil

--- Fetches the cell that the actor is in.
---@type tes3cell
tes3mobileNPC.cell = nil

--- Fetches the current value of a skill with a given index. This converts to the limited options available for creatures.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileNPC/getSkillValue.html).
---@type method
---@param skillId number { comment = "The index of the skill statistic's value to fetch." }
---@return number
function tes3mobileNPC:getSkillValue(skillId) end

--- Friendly access to the actor's flag that controls if the actor is using their idle animation.
---@type boolean
tes3mobileNPC.idleAnim = nil

--- Direct access to the actor's current movement flags, showing if the actor is moving left.
---@type boolean
tes3mobileNPC.isMovingLeft = nil

--- Direct access to the actor's chameleon effect attribute.
---@type number
tes3mobileNPC.chameleon = nil

---@type number
tes3mobileNPC.holdBreathTime = nil

--- Direct access to the NPC's sneak skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.sneak = nil

--- The number of active magic effects currently operating on the actor.
---@type number
tes3mobileNPC.activeMagicEffectCount = nil

--- Direct access to the actor's current movement flags, showing if the actor is turning left.
---@type boolean
tes3mobileNPC.isTurningLeft = nil

--- Direct access to the NPC's short blade skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.shortBlade = nil

--- The actor's fight AI value.
---@type number
tes3mobileNPC.fight = nil

--- Direct access to the actor's current movement flags, showing if the actor is walking.
---@type boolean
tes3mobileNPC.isWalking = nil

--- Direct access to the actor's fire resistance effect attribute.
---@type number
tes3mobileNPC.resistFire = nil

--- The actor's flee AI value.
---@type number
tes3mobileNPC.flee = nil

--- The height of the mobile above the ground.
---@type number
tes3mobileNPC.height = nil

--- The type of the mobile actor. 0 is a creature, 1 is an NPC, 2 is the player.
---@type number
tes3mobileNPC.actorType = nil

--- Toggle flag for if the NPC sneaks.
---@type boolean
tes3mobileNPC.forceSneak = nil

--- Direct access to the actor's invisibility effect attribute.
---@type number
tes3mobileNPC.invisibility = nil

--- Direct access to the NPC's spear skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.spear = nil

--- A vector that represents the 3D acceleration of the object.
---@type tes3vector3
tes3mobileNPC.impulseVelocity = nil

--- The calculated walk movement speed.
---@type number
tes3mobileNPC.walkSpeed = nil

--- Friendly access to the actor's flag that controls if the actor can be crittically hit.
---@type boolean
tes3mobileNPC.isCrittable = nil

--- The calculated swim movement speed.
---@type number
tes3mobileNPC.swimSpeed = nil

--- Direct access to the actor's willpower attribute statistic.
---@type tes3statistic
tes3mobileNPC.willpower = nil

--- Direct access to the actor's intelligence attribute statistic.
---@type tes3statistic
tes3mobileNPC.intelligence = nil

---@type number
tes3mobileNPC.greetDuration = nil

--- The actor's hello AI value.
---@type number
tes3mobileNPC.hello = nil

--- Direct access to the NPC's marksman skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.marksman = nil

--- Direct access to the NPC's medium armor skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.mediumArmor = nil

--- Direct access to the actor's corprus disease resistance effect attribute.
---@type number
tes3mobileNPC.resistCorprus = nil

--- Equips an item, optionally adding the item if needed.
---|
---|**Accepts table parameters:**
---|* `item` (*tes3item|string*): The item to equip.
---|* `itemData` (*tes3itemData*): The item data to equip. Optional.
---|* `forceSpecifiedItemData` (*boolean*): If true, the first available itemData in the stack won't be chosen.
---|* `addItem` (*boolean*): If true, the item will be added to the actor's inventory if needed.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileNPC/equip.html).
---@type method
---@param params table
---@return boolean
function tes3mobileNPC:equip(params) end

--- Direct access to the actor's water breathing effect attribute.
---@type number
tes3mobileNPC.waterBreathing = nil

--- Toggle flag for if the NPC runs.
---@type boolean
tes3mobileNPC.forceRun = nil

--- Access to the actor's magicka multiplier statistic.
---@type tes3statistic
tes3mobileNPC.magickaMultiplier = nil

--- Direct access to the actor's jump effect attribute.
---@type number
tes3mobileNPC.jump = nil

--- The currently equipped ammo.
---@type tes3equipmentStack
tes3mobileNPC.readiedAmmo = nil

--- Direct access to the NPC's athletics skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.athletics = nil

--- The number of ammo equipped for the readied ammo.
---@type number
tes3mobileNPC.readiedAmmoCount = nil

--- Friendly access to the actor's flag that controls if the actor is in combat.
---@type boolean
tes3mobileNPC.inCombat = nil

--- The currently equipped weapon.
---@type tes3equipmentStack
tes3mobileNPC.readiedWeapon = nil

--- Direct access to the actor's strength attribute statistic.
---@type tes3statistic
tes3mobileNPC.strength = nil

---@type number
tes3mobileNPC.width = nil

--- Direct access to the NPC's security skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.security = nil

--- Direct access to the actor's magicka resistance effect attribute.
---@type number
tes3mobileNPC.resistMagicka = nil

--- The actor object that maps to this mobile.
---@type tes3npcInstance
tes3mobileNPC.object = nil

--- Direct access to the actor's normal weapon resistance effect attribute.
---@type number
tes3mobileNPC.resistNormalWeapons = nil

--- Direct access to the actor's current movement flags, showing if the actor is flying.
---@type boolean
tes3mobileNPC.isFlying = nil

--- Forces the actor into combat with another actor.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileNPC/startCombat.html).
---@type method
---@param target tes3mobileActor
function tes3mobileNPC:startCombat(target) end

--- Direct access to the NPC's blunt weapon skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.bluntWeapon = nil

--- Direct access to the NPC's unarmored skill statistic.
---@type tes3skillStatistic
tes3mobileNPC.unarmored = nil


