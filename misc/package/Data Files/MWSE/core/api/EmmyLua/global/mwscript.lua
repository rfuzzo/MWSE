
--- Wrapper for the PositionCell mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `cell` (*string*)
---|* `x` (*number*): Default: 0.
---|* `y` (*number*): Default: 0.
---|* `z` (*number*): Default: 0.
---|* `rotation` (*number*): Default: 0.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/positionCell.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.positionCell(params) end

--- Returns the script target for the currently running Morrowind script, if any.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getReference.html).
---@type function
---@return tes3reference
function mwscript.getReference() end

--- Wrapper for the GetDistance mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `target` (*tes3reference|tes3mobileActor|string*): Actor to check distance to.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getDistance.html).
---@type function
---@param params table
---@return boolean
function mwscript.getDistance(params) end

--- Wrapper for the GetItemCount mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `item` (*tes3item|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getItemCount.html).
---@type function
---@param params table
---@return number
function mwscript.getItemCount(params) end

--- Wrapper for the GetPCRunning mwscript function.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getPCRunning.html).
---@type function
---@return boolean
function mwscript.getPCRunning() end

--- Wrapper for the StopCombat mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `target` (*tes3reference|tes3mobileActor|string*): Actor to stop combat with.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/stopCombat.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.stopCombat(params) end

--- Wrapper for the AddItem mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `spell` (*tes3spell|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/addSpell.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.addSpell(params) end

--- Wrapper for the AddToLevItem mwscript function.
---|
---|**Accepts table parameters:**
---|* `list` (*tes3leveledItem|string*): Leveled item list to add a creature to.
---|* `item` (*tes3item|string*): Item to add to the list.
---|* `level` (*number*): Minimum level for the item to spawn. Default: 0.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/addToLevItem.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.addToLevItem(params) end

--- Wrapper for the HasItemEquipped mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `item` (*tes3item|string*): The item to be added.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/hasItemEquipped.html).
---@type function
---@param params table
---@return boolean
function mwscript.hasItemEquipped(params) end

--- Wrapper for the GetPCSneaking mwscript function.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getPCSneaking.html).
---@type function
---@return boolean
function mwscript.getPCSneaking() end

--- Wrapper for the SetLevel mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `level` (*number*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/setLevel.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.setLevel(params) end

--- Wrapper for the PlaySound mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `sound` (*tes3sound|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/playSound.html).
---@type function
---@param params table
---@return boolean
function mwscript.playSound(params) end

--- Wrapper for the AddItem mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `item` (*tes3item|string*): The item to be added.
---|* `count` (*number*): The number of items to be added. Default: 1.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/addItem.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.addItem(params) end

--- Wrapper for the Position mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `cell` (*string*)
---|* `x` (*number*): Default: 0.
---|* `y` (*number*): Default: 0.
---|* `z` (*number*): Default: 0.
---|* `rotation` (*number*): Default: 0.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/position.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.position(params) end

--- Wrapper for the ScriptRunning mwscript function.
---|
---|**Accepts table parameters:**
---|* `script` (*tes3script|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/scriptRunning.html).
---@type function
---@param params table
---@return boolean
function mwscript.scriptRunning(params) end

--- Wrapper for the GetDisabled mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getDisabled.html).
---@type function
---@param params table
---@return boolean
function mwscript.getDisabled(params) end

--- Wrapper for the AddItem mwscript function.
---|
---|**Accepts table parameters:**
---|* `topic` (*tes3dialogue|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/addTopic.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.addTopic(params) end

--- Wrapper for the GetSpellEffects mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `spell` (*tes3spell|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getSpellEffects.html).
---@type function
---@param params table
---@return boolean
function mwscript.getSpellEffects(params) end

--- Wrapper for the ExplodeSpell mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `spell` (*tes3spell|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/explodeSpell.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.explodeSpell(params) end

--- Wrapper for the AITravel mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `x` (*number*)
---|* `y` (*number*)
---|* `z` (*number*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/aiTravel.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.aiTravel(params) end

--- Wrapper for the StartCombat mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `script` (*tes3script|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/startScript.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.startScript(params) end

--- Wrapper for the Drop mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `item` (*tes3item|string*): The item to be dropped.
---|* `count` (*number*): The number of items to drop. Default: 1.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/drop.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.drop(params) end

--- Wrapper for the Equip mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `item` (*tes3item|string*): The item to be equipped.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/equip.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.equip(params) end

--- Wrapper for the RemoveSpell mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `spell` (*tes3spell|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/removeSpell.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.removeSpell(params) end

--- Returns the currently running Morrowind script, if any.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getScript.html).
---@type function
---@return tes3script
function mwscript.getScript() end

--- Wrapper for the GetButtonPressed mwscript function.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getButtonPressed.html).
---@type function
---@return number { name = "buttonIndex" }
function mwscript.getButtonPressed() end

--- Wrapper for the AddSoulGem mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `creature` (*tes3creature|string*): The creature to be stored in the soul gem.
---|* `soulgem` (*tes3misc|string*): The soul gem to store the soul in.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/addSoulGem.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.addSoulGem(params) end

--- Wrapper for the AddToLevCreature mwscript function.
---|
---|**Accepts table parameters:**
---|* `list` (*tes3leveledCreature|string*): Leveled creature list to add a creature to.
---|* `creature` (*tes3actor|string*): Creature to add to the list.
---|* `level` (*number*): Minimum level for the creature to spawn. Default: 0.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/addToLevCreature.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.addToLevCreature(params) end

--- Wrapper for the WakeUpPC mwscript function.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/wakeUpPC.html).
---@type function
function mwscript.wakeUpPC() end

--- Wrapper for the GetDetected mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `target` (*tes3reference|tes3mobileActor|string*): Actor to check detection for.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getDetected.html).
---@type function
---@param params table
---@return boolean
function mwscript.getDetected(params) end

--- Wrapper for the StartCombat mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `target` (*tes3reference|tes3mobileActor|string*): Actor to start combat with.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/startCombat.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.startCombat(params) end

--- Wrapper for the StopSound mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `sound` (*tes3sound|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/stopSound.html).
---@type function
---@param params table
---@return boolean
function mwscript.stopSound(params) end

--- Wrapper for the GetPCJumping mwscript function.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/getPCJumping.html).
---@type function
---@return boolean
function mwscript.getPCJumping() end

--- Wrapper for the Activate mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/activate.html).
---@type function
---@param params table
function mwscript.activate(params) end

--- Wrapper for the PlaceAtPC mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `object` (*tes3object|string*): The object to place.
---|* `count` (*number*): Default: 1.
---|* `distance` (*number*): Default: 256.
---|* `direction` (*number*): Default: 1.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/placeAtPC.html).
---@type function
---@param params table
---@return tes3reference { name = "lastPlacedReference" }
function mwscript.placeAtPC(params) end

--- Wrapper for the Enable mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `modify` (*boolean*): Set the object as modified. Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/enable.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.enable(params) end

--- Wrapper for the RemoveItem mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `item` (*tes3item|string*): The item to be added.
---|* `count` (*number*): The number of items to be added. Default: 1.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/removeItem.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.removeItem(params) end

--- Wrapper for the StartCombat mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `script` (*tes3script|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/stopScript.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.stopScript(params) end

--- Wrapper for the Disable mwscript function.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The target reference for this command to be executed on. Defaults to the normal script execution reference. Optional.
---|* `modify` (*boolean*): Set the object as modified. Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwscript/disable.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function mwscript.disable(params) end


