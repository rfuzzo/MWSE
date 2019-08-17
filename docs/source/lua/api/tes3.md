# tes3

The tes3 library provides the majority of the functions for interacting with the game system.

## Values

<dl class="describe">
<dt><code class="descname">animationState: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

Constant values relating to animation state.

</dd>
<dt><code class="descname">dataHandler: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dataHandler.html">tes3dataHandler</a></code></dt>
<dd>

One of the core game objects.

</dd>
<dt><code class="descname">game: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3game.html">tes3game</a></code></dt>
<dd>

One of the core game objects.

</dd>
<dt><code class="descname">mobilePlayer: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobilePlayer.html">tes3mobilePlayer</a></code></dt>
<dd>

The player's mobile actor.

</dd>
<dt><code class="descname">player: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

A reference to the player.

</dd>
<dt><code class="descname">worldController: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3worldController.html">tes3worldController</a></code></dt>
<dd>

One of the core game objects.

</dd>
</dl>

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3/addItem
    tes3/addItemData
    tes3/addSoulGem
    tes3/adjustSoundVolume
    tes3/cast
    tes3/checkMerchantTradesItem
    tes3/createReference
    tes3/deleteObject
    tes3/disableKey
    tes3/dropItem
    tes3/enableKey
    tes3/fadeIn
    tes3/fadeOut
    tes3/fadeTo
    tes3/findDialogue
    tes3/findGMST
    tes3/findGlobal
    tes3/getActiveCells
    tes3/getAttachment
    tes3/getAttributeName
    tes3/getCameraPosition
    tes3/getCameraVector
    tes3/getCell
    tes3/getCumulativeDaysForMonth
    tes3/getCurrentAIPackageId
    tes3/getCurrentWeather
    tes3/getCursorPosition
    tes3/getDaysInMonth
    tes3/getDialogueInfo
    tes3/getEquippedItem
    tes3/getFaction
    tes3/getFileExists
    tes3/getFileSource
    tes3/getGlobal
    tes3/getInputBinding
    tes3/getJournalIndex
    tes3/getLanguage
    tes3/getLanguageCode
    tes3/getLockLevel
    tes3/getLocked
    tes3/getMagicEffect
    tes3/getModList
    tes3/getObject
    tes3/getOwner
    tes3/getPlayerCell
    tes3/getPlayerEyePosition
    tes3/getPlayerEyeVector
    tes3/getPlayerGold
    tes3/getPlayerTarget
    tes3/getReference
    tes3/getRegion
    tes3/getScript
    tes3/getSimulationTimestamp
    tes3/getSkill
    tes3/getSkillName
    tes3/getSound
    tes3/getSoundGenerator
    tes3/getSoundPlaying
    tes3/getSpecializationName
    tes3/getTopMenu
    tes3/getTrap
    tes3/hammerKey
    tes3/hasCodePatchFeature
    tes3/hasOwnershipAccess
    tes3/is3rdPerson
    tes3/isModActive
    tes3/iterate
    tes3/iterateObjects
    tes3/loadGame
    tes3/loadMesh
    tes3/lock
    tes3/loopTArray
    tes3/menuMode
    tes3/messageBox
    tes3/modStatistic
    tes3/newGame
    tes3/onMainMenu
    tes3/persuade
    tes3/playAnimation
    tes3/playItemPickupSound
    tes3/playSound
    tes3/playVoiceover
    tes3/positionCell
    tes3/pushKey
    tes3/rayTest
    tes3/releaseKey
    tes3/removeEffects
    tes3/removeItem
    tes3/removeSound
    tes3/runLegacyScript
    tes3/saveGame
    tes3/say
    tes3/setAIActivate
    tes3/setAIEscort
    tes3/setAIFollow
    tes3/setAITravel
    tes3/setAIWander
    tes3/setDestination
    tes3/setEnabled
    tes3/setGlobal
    tes3/setJournalIndex
    tes3/setLockLevel
    tes3/setStatistic
    tes3/setTrap
    tes3/showRepairServiceMenu
    tes3/skipAnimationFrame
    tes3/streamMusic
    tes3/tapKey
    tes3/transferItem
    tes3/triggerCrime
    tes3/unhammerKey
    tes3/unlock
    tes3/updateJournal
```

<dl class="describe">
<dt><code class="descname"><a href="tes3/addItem.html">addItem</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item|string, <i>count:</i> number, <i>playSound:</i> boolean, <i>limit:</i> boolean, <i>updateGUI:</i> boolean}) -> <i>addedCount:</i> number</code></dt>
<dd>

Adds an item to a given reference's inventory.

</dd>
<dt><code class="descname"><a href="tes3/addItemData.html">addItemData</a>({<i>to:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item|string, <i>updateGUI:</i> boolean}) -> <i>createdData:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a></code></dt>
<dd>

Creates an item data if there is room for a new stack in a given inventory. This can be then used to add custom user data or adjust an item's condition. This will return nil if no item data could be allocated for the item -- for example if the reference doesn't have the item in their inventory or each item of that type already has item data.

</dd>
<dt><code class="descname"><a href="tes3/addSoulGem.html">addSoulGem</a>(<i>params:</i> table) -> <i>wasAdded:</i> number</code></dt>
<dd>

Causes a misc item to be recognized as a soul gem, so that it can be used for soul trapping.

</dd>
<dt><code class="descname"><a href="tes3/adjustSoundVolume.html">adjustSoundVolume</a>({<i>sound:</i> tes3sound|string, <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>mixChannel:</i> number, <i>volume:</i> number})</code></dt>
<dd>

Changes the volume of a sound that is playing on a given reference.

</dd>
<dt><code class="descname"><a href="tes3/cast.html">cast</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>target:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>spell:</i> tes3spell|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Casts a spell from a given reference to a target reference. The caster doesn't need to know the spell.

</dd>
<dt><code class="descname"><a href="tes3/checkMerchantTradesItem.html">checkMerchantTradesItem</a>(<i>item:</i> tes3item|string, <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string) -> <i>trades:</i> boolean</code></dt>
<dd>

Determines if a merchant trades in a given item.

</dd>
<dt><code class="descname"><a href="tes3/createReference.html">createReference</a>({<i>object:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3physicalObject.html">tes3physicalObject</a>|string, <i>position:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>|table, <i>orientation:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>|table, <i>cell:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a>|string|table, <i>scale:</i> number}) -> <i>newReference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

Similar to mwscript's PlaceAtPC or PlaceAtMe, this creates a new reference in the game world.

</dd>
<dt><code class="descname"><a href="tes3/deleteObject.html">deleteObject</a>(<i>object:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3object.html">tes3object</a>)</code></dt>
<dd>

Deletes a game object from the system. This can be dangerous, use caution.

</dd>
<dt><code class="descname"><a href="tes3/disableKey.html">disableKey</a>(<i>keyCode:</i> number)</code></dt>
<dd>

Disables the use of a key.

</dd>
<dt><code class="descname"><a href="tes3/dropItem.html">dropItem</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>item:</i> tes3item|string, <i>itemData:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a>, <i>count:</i> number, <i>matchExact:</i> boolean, <i>updateGUI:</i> boolean}) -> <i>createdReference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

Drops one or more items from a reference's inventory onto the ground at their feet.

</dd>
<dt><code class="descname"><a href="tes3/enableKey.html">enableKey</a>(<i>keyCode:</i> number)</code></dt>
<dd>

Enables the use of a key.

</dd>
<dt><code class="descname"><a href="tes3/fadeIn.html">fadeIn</a>({<i>fader:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3fader.html">tes3fader</a>, <i>duration:</i> number})</code></dt>
<dd>

Similar to the vanilla FadeIn mwscript command.

</dd>
<dt><code class="descname"><a href="tes3/fadeOut.html">fadeOut</a>({<i>fader:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3fader.html">tes3fader</a>, <i>duration:</i> number})</code></dt>
<dd>

Similar to the vanilla FadeOut mwscript command.

</dd>
<dt><code class="descname"><a href="tes3/fadeTo.html">fadeTo</a>({<i>fader:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3fader.html">tes3fader</a>, <i>duration:</i> number, <i>value:</i> number})</code></dt>
<dd>

Similar to the vanilla FadeTo mwscript command.

</dd>
<dt><code class="descname"><a href="tes3/findDialogue.html">findDialogue</a>({<i>type:</i> number, <i>page:</i> number}) -> <i>dialogue:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue.html">tes3dialogue</a></code></dt>
<dd>

Locates a root dialogue that can then be filtered down for a specific actor to return a specific dialogue info For example, a type of 2 and a page of 1 will return the "Greeting 0" topic.

</dd>
<dt><code class="descname"><a href="tes3/findGMST.html">findGMST</a>(<i>id:</i> number|string) -> <i>gameSetting:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3gameSetting.html">tes3gameSetting</a></code></dt>
<dd>

Fetches the core game object that represents a game setting. While this function accepts a name, it is recommended to use the tes3.GMST constants.

</dd>
<dt><code class="descname"><a href="tes3/findGlobal.html">findGlobal</a>(<i>id:</i> string) -> <i>globalVariable:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3globalVariable.html">tes3globalVariable</a></code></dt>
<dd>

Fetches the core game object that represents a global variable.

</dd>
<dt><code class="descname"><a href="tes3/getActiveCells.html">getActiveCells</a>()</code></dt>
<dd>

Returns a table of active cells. If indoors, the table will have only one entry. If outdoors, the 9 surrounding cells will be provided.

</dd>
<dt><code class="descname"><a href="tes3/getAttachment.html">getAttachment</a>(<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>, <i>attachment:</i> string)</code></dt>
<dd>

Fetches an attachment with a given type.

</dd>
<dt><code class="descname"><a href="tes3/getAttributeName.html">getAttributeName</a>(<i>attributeId:</i> number) -> <i>name:</i> string</code></dt>
<dd>

Returns the lowercase identifying name of an attribute for a given numerical, 0-based index. E.g. "strength".

</dd>
<dt><code class="descname"><a href="tes3/getCameraPosition.html">getCameraPosition</a>()</code></dt>
<dd>

Returns the camera's position.

</dd>
<dt><code class="descname"><a href="tes3/getCameraVector.html">getCameraVector</a>()</code></dt>
<dd>

Returns the camera look vector.

</dd>
<dt><code class="descname"><a href="tes3/getCell.html">getCell</a>({<i>id:</i> string, <i>x:</i> number, <i>y:</i> number}) -> <i>cell:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a></code></dt>
<dd>

Finds a cell, either by an id or an X/Y grid position.

</dd>
<dt><code class="descname"><a href="tes3/getCumulativeDaysForMonth.html">getCumulativeDaysForMonth</a>(<i>month:</i> number) -> <i>days:</i> number</code></dt>
<dd>

Gets the number of days that have passed leading up to the start of a given month.

</dd>
<dt><code class="descname"><a href="tes3/getCurrentAIPackageId.html">getCurrentAIPackageId</a>(<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>) -> <i>packageID:</i> number</code></dt>
<dd>

Returns an actor's current AI package ID, just as the mwscript function `GetCurrentAIPackage` would.

</dd>
<dt><code class="descname"><a href="tes3/getCurrentWeather.html">getCurrentWeather</a>()</code></dt>
<dd>

Gets the currently active weather, from the player's current region.

</dd>
<dt><code class="descname"><a href="tes3/getCursorPosition.html">getCursorPosition</a>()</code></dt>
<dd>

Returns a table with values x and y that contain the current cursor position.

</dd>
<dt><code class="descname"><a href="tes3/getDaysInMonth.html">getDaysInMonth</a>(<i>month:</i> number) -> <i>dayCount:</i> number</code></dt>
<dd>

Returns the number of days in a given month. This may be altered if a Morrowind Code Patch feature was installed.

</dd>
<dt><code class="descname"><a href="tes3/getDialogueInfo.html">getDialogueInfo</a>(<i>dialogue:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue.html">tes3dialogue</a>|string, <i>id:</i> string) -> <i>dialogueInfo:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogueInfo.html">tes3dialogueInfo</a></code></dt>
<dd>

Locates and returns a Dialogue Info by a given id. This involves file IO and is an expensive call. Results should be cached.

</dd>
<dt><code class="descname"><a href="tes3/getEquippedItem.html">getEquippedItem</a>({<i>actor:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3actor.html">tes3actor</a>, <i>enchanted:</i> boolean, <i>objectType:</i> number, <i>slot:</i> number, <i>type:</i> number}) -> <i>stack:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3equipmentStack.html">tes3equipmentStack</a></code></dt>
<dd>

Returns an actor's equipped item stack, provided a given filter

</dd>
<dt><code class="descname"><a href="tes3/getFaction.html">getFaction</a>(<i>id:</i> string) -> <i>faction:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3faction.html">tes3faction</a></code></dt>
<dd>

Fetches the core game faction object for a given faction ID.

</dd>
<dt><code class="descname"><a href="tes3/getFileExists.html">getFileExists</a>(<i>path:</i> string) -> <i>exists:</i> boolean</code></dt>
<dd>

Determines if a file exists in the user's Data Files.

</dd>
<dt><code class="descname"><a href="tes3/getFileSource.html">getFileSource</a>(<i>path:</i> string) -> <i>exists:</i> string</code></dt>
<dd>

Determines if a file exists on the filesystem or inside of a bsa. The returned string will be "file" or "bsa".

</dd>
<dt><code class="descname"><a href="tes3/getGlobal.html">getGlobal</a>(<i>id:</i> string) -> <i>value:</i> number</code></dt>
<dd>

Retrieves the value of a global value, or nil if the global could not be found.

</dd>
<dt><code class="descname"><a href="tes3/getInputBinding.html">getInputBinding</a>(<i>keybind:</i> number) -> <i>inputConfig:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3inputConfig.html">tes3inputConfig</a></code></dt>
<dd>

Gets the input configuration for a given keybind.

</dd>
<dt><code class="descname"><a href="tes3/getJournalIndex.html">getJournalIndex</a>({<i>id:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue.html">tes3dialogue</a>|string}) -> <i>index:</i> number</code></dt>
<dd>

Gets the index of a given journal, or nil if no valid journal could be found.

</dd>
<dt><code class="descname"><a href="tes3/getLanguage.html">getLanguage</a>()</code></dt>
<dd>

Gets the language as an ISO string (e.g. "eng"), determined by the language entry in Morrowind.ini.

</dd>
<dt><code class="descname"><a href="tes3/getLanguageCode.html">getLanguageCode</a>()</code></dt>
<dd>

Gets the language code, determined by the language entry in Morrowind.ini.

</dd>
<dt><code class="descname"><a href="tes3/getLockLevel.html">getLockLevel</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> <i>level:</i> number</code></dt>
<dd>

Gets an locked reference's lock level. If no lock data is available, it will return nil.

</dd>
<dt><code class="descname"><a href="tes3/getLocked.html">getLocked</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> <i>isLocked:</i> boolean</code></dt>
<dd>

Determines if a given reference is a locked door or container.

</dd>
<dt><code class="descname"><a href="tes3/getMagicEffect.html">getMagicEffect</a>(<i>id:</i> number) -> <i>magicEffect:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3magicEffect.html">tes3magicEffect</a></code></dt>
<dd>

Fetches the core game Magic Effect object for a given ID.

</dd>
<dt><code class="descname"><a href="tes3/getModList.html">getModList</a>()</code></dt>
<dd>

Fetches the list of the active ESM and ESP files.

</dd>
<dt><code class="descname"><a href="tes3/getObject.html">getObject</a>(<i>id:</i> string) -> <i>object:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3object.html">tes3object</a></code></dt>
<dd>

Fetches the core game object for a given object ID.

</dd>
<dt><code class="descname"><a href="tes3/getOwner.html">getOwner</a>(<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>) -> <i>object:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3object.html">tes3object</a></code></dt>
<dd>

Returns the object's owner, or nil if the object is unowned.

</dd>
<dt><code class="descname"><a href="tes3/getPlayerCell.html">getPlayerCell</a>()</code></dt>
<dd>

Fetches the cell that the player is currently in.

</dd>
<dt><code class="descname"><a href="tes3/getPlayerEyePosition.html">getPlayerEyePosition</a>()</code></dt>
<dd>

Returns the position of the player's eyes.

</dd>
<dt><code class="descname"><a href="tes3/getPlayerEyeVector.html">getPlayerEyeVector</a>()</code></dt>
<dd>

Returns the look direction of the player's eyes.

</dd>
<dt><code class="descname"><a href="tes3/getPlayerGold.html">getPlayerGold</a>()</code></dt>
<dd>

Gets the gold count carried by the player.

</dd>
<dt><code class="descname"><a href="tes3/getPlayerTarget.html">getPlayerTarget</a>()</code></dt>
<dd>

This function is used to see what the player is looking at. Unlike a real raycast, this does not work in all circumstances. As a general rule, it will return the reference if the information box is shown when it is looked at.

</dd>
<dt><code class="descname"><a href="tes3/getReference.html">getReference</a>(<i>id:</i> string) -> <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

Fetches the first reference for a given base object ID.

</dd>
<dt><code class="descname"><a href="tes3/getRegion.html">getRegion</a>()</code></dt>
<dd>

Gets the current region the player is in. This checks the player's current cell first, but will fall back to the last exterior cell.

</dd>
<dt><code class="descname"><a href="tes3/getScript.html">getScript</a>(<i>id:</i> string) -> <i>script:</i> tes3script</code></dt>
<dd>

Locates and returns a script by a given id.

</dd>
<dt><code class="descname"><a href="tes3/getSimulationTimestamp.html">getSimulationTimestamp</a>()</code></dt>
<dd>

Returns a UNIX-style timestamp based on in-world simulation time since the start of the era.

</dd>
<dt><code class="descname"><a href="tes3/getSkill.html">getSkill</a>(<i>id:</i> number) -> <i>skill:</i> tes3skill</code></dt>
<dd>

Fetches the core game object for a given skill ID.

</dd>
<dt><code class="descname"><a href="tes3/getSkillName.html">getSkillName</a>()</code></dt>
<dd>

Returns the identifying name of a skill for a given numerical, 0-based index. E.g. "Enchant".

</dd>
<dt><code class="descname"><a href="tes3/getSound.html">getSound</a>(<i>id:</i> string) -> <i>sound:</i> tes3sound</code></dt>
<dd>

Locates and returns a sound by a given id.

</dd>
<dt><code class="descname"><a href="tes3/getSoundGenerator.html">getSoundGenerator</a>(<i>creatureId:</i> string, <i>soundType:</i> number) -> <i>soundGenerator:</i> tes3soundGenerator</code></dt>
<dd>

Returns a sound generator by a given creature id and type.

</dd>
<dt><code class="descname"><a href="tes3/getSoundPlaying.html">getSoundPlaying</a>({<i>sound:</i> tes3sound|string, <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> <i>soundIsPlaying:</i> boolean</code></dt>
<dd>

Without a reference, this function returns true if the sound is playing unattached or on any reference. With a reference, it returns true if the sound is playing on that specific reference.

</dd>
<dt><code class="descname"><a href="tes3/getSpecializationName.html">getSpecializationName</a>()</code></dt>
<dd>

Returns the lowercase identifying name of a specialization type for a given numerical, 0-based index. E.g. "magic".

</dd>
<dt><code class="descname"><a href="tes3/getTopMenu.html">getTopMenu</a>()</code></dt>
<dd>

Gets the top-level UI menu.

</dd>
<dt><code class="descname"><a href="tes3/getTrap.html">getTrap</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> <i>spell:</i> tes3spell</code></dt>
<dd>

Gets the trap on a given reference.

</dd>
<dt><code class="descname"><a href="tes3/hammerKey.html">hammerKey</a>(<i>keyCode:</i> number)</code></dt>
<dd>

Simulates hammering a key.

</dd>
<dt><code class="descname"><a href="tes3/hasCodePatchFeature.html">hasCodePatchFeature</a>(<i>id:</i> number) -> <i>state:</i> boolean|nil</code></dt>
<dd>

Attempts to determine if a given Morrowind Code Patch feature is enabled. This may not be possible, in which case nil will be returned.

</dd>
<dt><code class="descname"><a href="tes3/hasOwnershipAccess.html">hasOwnershipAccess</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>target:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> <i>hasAccess:</i> boolean</code></dt>
<dd>

Determines if a reference has access to another object, including its inventory.

</dd>
<dt><code class="descname"><a href="tes3/is3rdPerson.html">is3rdPerson</a>()</code></dt>
<dd>

Returns if the game is in 3rd person.

</dd>
<dt><code class="descname"><a href="tes3/isModActive.html">isModActive</a>(<i>filename:</i> string) -> boolean</code></dt>
<dd>

Determines if the player has a given ESP or ESM file active.

</dd>
<dt><code class="descname"><a href="tes3/iterate.html">iterate</a>(<i>iterator:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a>) -> <i>function:</i> function</code></dt>
<dd>

This function returns a function that iterates over a tes3iterator object. This is useful for for loops.

</dd>
<dt><code class="descname"><a href="tes3/iterateObjects.html">iterateObjects</a>(<i>filter:</i> number) -> <i>object:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3object.html">tes3object</a></code></dt>
<dd>

Iteration function used for looping over game options.

</dd>
<dt><code class="descname"><a href="tes3/loadGame.html">loadGame</a>(<i>filename:</i> string)</code></dt>
<dd>

Loads a game.

</dd>
<dt><code class="descname"><a href="tes3/loadMesh.html">loadMesh</a>(<i>path:</i> string) -> <i>model:</i> niNode</code></dt>
<dd>

Loads a mesh file and provides a scene graph object.

</dd>
<dt><code class="descname"><a href="tes3/lock.html">lock</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>level:</i> number}) -> <i>locked:</i> boolean</code></dt>
<dd>

Locks an object, and optionally sets a locked reference's lock level. Returns true if the object can be and wasn't already locked.

</dd>
<dt><code class="descname"><a href="tes3/loopTArray.html">loopTArray</a>(<i>tarray:</i> tes3tarray) -> <i>iterationFunction:</i> function</code></dt>
<dd>

This function returns a function that iterates over a tes3tarray object. This is useful for for loops.

</dd>
<dt><code class="descname"><a href="tes3/menuMode.html">menuMode</a>()</code></dt>
<dd>

Returns true if the player is currently in menu mode.

</dd>
<dt><code class="descname"><a href="tes3/messageBox.html">messageBox</a>(<i>messageOrParams:</i> string|table, <i>formatAdditions:</i> variadic) -> <i>soundIsPlaying:</i> boolean</code></dt>
<dd>

Displays a message box. This may be a simple toast-style message, or a box with choice buttons.

</dd>
<dt><code class="descname"><a href="tes3/modStatistic.html">modStatistic</a>({<i>attribute:</i> number, <i>base:</i> number, <i>current:</i> number, <i>limit:</i> boolean, <i>name:</i> string, <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>skill:</i> number, <i>value:</i> number})</code></dt>
<dd>

Modifies a statistic on a given actor. This should be used instead of manually setting values on the game structures, to ensure that events and GUI elements are properly handled. Either skill, attribute, or name must be provided.

</dd>
<dt><code class="descname"><a href="tes3/newGame.html">newGame</a>()</code></dt>
<dd>

Starts a new game.

</dd>
<dt><code class="descname"><a href="tes3/onMainMenu.html">onMainMenu</a>()</code></dt>
<dd>

Returns true if the player is on the main menu, and hasn't loaded a game yet.

</dd>
<dt><code class="descname"><a href="tes3/persuade.html">persuade</a>({<i>actor:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>index:</i> number, <i>modifier:</i> number}) -> <i>success:</i> boolean</code></dt>
<dd>

Attempts a persuasion attempt on an actor, potentially adjusting their disposition. Returns true if the attempt was a success.

</dd>
<dt><code class="descname"><a href="tes3/playAnimation.html">playAnimation</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>group:</i> number, <i>startFlag:</i> number, <i>loopCount:</i> number})</code></dt>
<dd>

Plays a given animation group. Optional flags can be used to define how the group starts.

</dd>
<dt><code class="descname"><a href="tes3/playItemPickupSound.html">playItemPickupSound</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item, <i>pickup:</i> boolean}) -> <i>executed:</i> boolean</code></dt>
<dd>

Plays the sound responsible for picking up or putting down an item.

</dd>
<dt><code class="descname"><a href="tes3/playSound.html">playSound</a>({<i>sound:</i> tes3sound|string, <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>loop:</i> boolean, <i>mixChannel:</i> number, <i>volume:</i> number, <i>pitch:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

Plays a sound on a given reference. Provides control over volume (including volume channel), pitch, and loop control.

</dd>
<dt><code class="descname"><a href="tes3/playVoiceover.html">playVoiceover</a>({<i>actor:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>voiceover:</i> number}) -> <i>played:</i> boolean</code></dt>
<dd>

Causes a target actor to play a voiceover.

</dd>
<dt><code class="descname"><a href="tes3/positionCell.html">positionCell</a>({<i>cell:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a>, <i>orientation:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>|table, <i>position:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>|table, <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>teleportCompanions:</i> boolean}) -> <i>executed:</i> boolean</code></dt>
<dd>

Positions a reference to another place.

</dd>
<dt><code class="descname"><a href="tes3/pushKey.html">pushKey</a>(<i>keyCode:</i> number)</code></dt>
<dd>

Simulates pushing a key.

</dd>
<dt><code class="descname"><a href="tes3/rayTest.html">rayTest</a>({<i>position:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>|table, <i>direction:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>|table, <i>findAll:</i> boolean, <i>maxDistance:</i> number, <i>sort:</i> boolean, <i>useModelBounds:</i> boolean, <i>useModelCoordinates:</i> boolean, <i>useBackTriangles:</i> boolean, <i>observeAppCullFlag:</i> boolean, <i>returnColor:</i> boolean, <i>returnNormal:</i> boolean, <i>returnSmoothNormal:</i> boolean, <i>returnTexture:</i> boolean, <i>ignore:</i> table}) -> <i>result:</i> niPickRecord|table</code></dt>
<dd>

Performs a ray test and returns various information related to the result(s). If findAll is set, the result will be a table of results, otherwise only the first result is returned.

</dd>
<dt><code class="descname"><a href="tes3/releaseKey.html">releaseKey</a>(<i>keyCode:</i> number)</code></dt>
<dd>

Simulates releasing a key.

</dd>
<dt><code class="descname"><a href="tes3/removeEffects.html">removeEffects</a>(<i>castType:</i> number, <i>chance:</i> number, <i>effect:</i> number, <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>, <i>removeSpell:</i> boolean)</code></dt>
<dd>

Removes effects from a given reference. Requires that either the effect or castType parameter be provided.

</dd>
<dt><code class="descname"><a href="tes3/removeItem.html">removeItem</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item|string, <i>count:</i> number, <i>playSound:</i> boolean, <i>updateGUI:</i> boolean}) -> <i>removedCount:</i> number</code></dt>
<dd>

Removes an item to a given reference's inventory.

</dd>
<dt><code class="descname"><a href="tes3/removeSound.html">removeSound</a>({<i>sound:</i> tes3sound|string, <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string})</code></dt>
<dd>

Stops a sound playing. Without a reference, it will match unattached sounds. With a reference, it will only match a sound playing on that specific reference.

</dd>
<dt><code class="descname"><a href="tes3/runLegacyScript.html">runLegacyScript</a>({<i>script:</i> tes3script, <i>source:</i> number, <i>command:</i> string, <i>variables:</i> tes3scriptVariables, <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>dialogue:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue.html">tes3dialogue</a>|string, <i>info:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogueInfo.html">tes3dialogueInfo</a>}) -> <i>executed:</i> boolean</code></dt>
<dd>

This function will compile and run a mwscript chunk of code. This is not ideal to use, but can be used for features not yet exposed to lua.

</dd>
<dt><code class="descname"><a href="tes3/saveGame.html">saveGame</a>({<i>file:</i> string, <i>name:</i> string}) -> <i>saved:</i> boolean</code></dt>
<dd>

Saves the game.

</dd>
<dt><code class="descname"><a href="tes3/say.html">say</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>path:</i> string, <i>pitch:</i> number, <i>volume:</i> number, <i>forceSubtitle:</i> boolean, <i>subtitle:</i> string})</code></dt>
<dd>

Plays a sound file, with an optional alteration and subtitle.

</dd>
<dt><code class="descname"><a href="tes3/setAIActivate.html">setAIActivate</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>, <i>target:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>, <i>reset:</i> boolean})</code></dt>
<dd>

Configures a mobile actor to activate an object.

</dd>
<dt><code class="descname"><a href="tes3/setAIEscort.html">setAIEscort</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>, <i>target:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>, <i>destination:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>|table, <i>duration:</i> number, <i>cell:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a>|string, <i>reset:</i> boolean})</code></dt>
<dd>

Configures a mobile actor to escort another actor to a destination.

</dd>
<dt><code class="descname"><a href="tes3/setAIFollow.html">setAIFollow</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>, <i>target:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>, <i>destination:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>|table, <i>duration:</i> number, <i>cell:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a>|string, <i>reset:</i> boolean})</code></dt>
<dd>

Configures a mobile actor to follow another actor to a destination.

</dd>
<dt><code class="descname"><a href="tes3/setAITravel.html">setAITravel</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>, <i>destination:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>|table, <i>reset:</i> boolean})</code></dt>
<dd>

Configures a mobile actor to travel to a destination.

</dd>
<dt><code class="descname"><a href="tes3/setAIWander.html">setAIWander</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>, <i>idles:</i> table, <i>range:</i> number, <i>duration:</i> number, <i>time:</i> number, <i>reset:</i> boolean})</code></dt>
<dd>

Configures a mobile actor to wander around a cell.

</dd>
<dt><code class="descname"><a href="tes3/setDestination.html">setDestination</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>, <i>position:</i> tes3vector|table, <i>orientation:</i> tes3vector|table, <i>cell:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a>|string})</code></dt>
<dd>

Sets or changes the destination of a door to a new location.

</dd>
<dt><code class="descname"><a href="tes3/setEnabled.html">setEnabled</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>toggle:</i> boolean, <i>enabled:</i> boolean}) -> <i>success:</i> boolean</code></dt>
<dd>

Enables or disables a reference.

</dd>
<dt><code class="descname"><a href="tes3/setGlobal.html">setGlobal</a>(<i>id:</i> string, <i>value:</i> number) -> <i>value:</i> boolean</code></dt>
<dd>

Sets the value of a global value. If the global could not be found, the function returns false.

</dd>
<dt><code class="descname"><a href="tes3/setJournalIndex.html">setJournalIndex</a>({<i>id:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue.html">tes3dialogue</a>|string, <i>index:</i> number, <i>speaker:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>showMessage:</i> boolean}) -> <i>wasSet:</i> boolean</code></dt>
<dd>

Sets the index of a given journal in a way similar to the mwscript function SetJournalIndex.

</dd>
<dt><code class="descname"><a href="tes3/setLockLevel.html">setLockLevel</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>level:</i> number}) -> <i>set:</i> boolean</code></dt>
<dd>

Sets a locked reference's lock level. This does not lock the object.

</dd>
<dt><code class="descname"><a href="tes3/setStatistic.html">setStatistic</a>({<i>attribute:</i> number, <i>base:</i> number, <i>current:</i> number, <i>limit:</i> boolean, <i>name:</i> string, <i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>skill:</i> number, <i>value:</i> number})</code></dt>
<dd>

Sets a statistic on a given actor. This should be used instead of manually setting values on the game structures, to ensure that events and GUI elements are properly handled. Either skill, attribute, or name must be provided.

</dd>
<dt><code class="descname"><a href="tes3/setTrap.html">setTrap</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>spell:</i> tes3spell|string}) -> <i>trapped:</i> boolean</code></dt>
<dd>

Sets the trap on a given reference.

</dd>
<dt><code class="descname"><a href="tes3/showRepairServiceMenu.html">showRepairServiceMenu</a>()</code></dt>
<dd>

Opens the service repair menu.

</dd>
<dt><code class="descname"><a href="tes3/skipAnimationFrame.html">skipAnimationFrame</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string})</code></dt>
<dd>

Skips a given reference's animation for a single frame.

</dd>
<dt><code class="descname"><a href="tes3/streamMusic.html">streamMusic</a>({<i>path:</i> string, <i>situation:</i> number, <i>crossfade:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

This function interrupts the current music to play the specified music track.

</dd>
<dt><code class="descname"><a href="tes3/tapKey.html">tapKey</a>(<i>keyCode:</i> number)</code></dt>
<dd>

Simulates tapping a key.

</dd>
<dt><code class="descname"><a href="tes3/transferItem.html">transferItem</a>({<i>from:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>to:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item|string, <i>itemData:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a>, <i>count:</i> number, <i>playSound:</i> boolean, <i>limitCapacity:</i> boolean, <i>updateGUI:</i> boolean}) -> <i>transferredCount:</i> number</code></dt>
<dd>

Moves one or more items from one reference to another. Returns the actual amount of items successfully transferred.

</dd>
<dt><code class="descname"><a href="tes3/triggerCrime.html">triggerCrime</a>({<i>criminal:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>forceDetection:</i> boolean, <i>type:</i> number, <i>value:</i> number, <i>victim:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Emulates the player committing a crime.

</dd>
<dt><code class="descname"><a href="tes3/unhammerKey.html">unhammerKey</a>(<i>keyCode:</i> number)</code></dt>
<dd>

Stops simulating hammering a key.

</dd>
<dt><code class="descname"><a href="tes3/unlock.html">unlock</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> <i>unlocked:</i> boolean</code></dt>
<dd>

Unlocks an object. Returns true if the object can be and wasn't already unlocked.

</dd>
<dt><code class="descname"><a href="tes3/updateJournal.html">updateJournal</a>({<i>id:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue.html">tes3dialogue</a>|string, <i>index:</i> number, <i>showMessage:</i> boolean}) -> <i>wasSet:</i> boolean</code></dt>
<dd>

Updates the journal index in a way similar to the mwscript function Journal.

</dd>
</dl>
