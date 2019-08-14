# tes3

The tes3 library provides the majority of the functions for interacting with the game system.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3/animationState
    tes3/dataHandler
    tes3/game
    tes3/mobilePlayer
    tes3/player
    tes3/worldController
```

#### [animationState](tes3/animationState.md)

> Constant values relating to animation state.

#### [dataHandler](tes3/dataHandler.md)

> One of the core game objects.

#### [game](tes3/game.md)

> One of the core game objects.

#### [mobilePlayer](tes3/mobilePlayer.md)

> The player's mobile actor.

#### [player](tes3/player.md)

> A reference to the player.

#### [worldController](tes3/worldController.md)

> One of the core game objects.

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

#### [addItem](tes3/addItem.md)

> Adds an item to a given reference's inventory.

#### [addItemData](tes3/addItemData.md)

> Creates an item data if there is room for a new stack in a given inventory. This can be then used to add custom user data or adjust an item's condition. This will return nil if no item data could be allocated for the item -- for example if the reference doesn't have the item in their inventory or each item of that type already has item data.

#### [addSoulGem](tes3/addSoulGem.md)

> Causes a misc item to be recognized as a soul gem, so that it can be used for soul trapping.

#### [adjustSoundVolume](tes3/adjustSoundVolume.md)

> Changes the volume of a sound that is playing on a given reference.

#### [cast](tes3/cast.md)

> Casts a spell from a given reference to a target reference. The caster doesn't need to know the spell.

#### [checkMerchantTradesItem](tes3/checkMerchantTradesItem.md)

> Determines if a merchant trades in a given item.

#### [createReference](tes3/createReference.md)

> Similar to mwscript's PlaceAtPC or PlaceAtMe, this creates a new reference in the game world.

#### [deleteObject](tes3/deleteObject.md)

> Deletes a game object from the system. This can be dangerous, use caution.

#### [disableKey](tes3/disableKey.md)

> Disables the use of a key.

#### [dropItem](tes3/dropItem.md)

> Drops one or more items from a reference's inventory onto the ground at their feet.

#### [enableKey](tes3/enableKey.md)

> Enables the use of a key.

#### [fadeIn](tes3/fadeIn.md)

> Similar to the vanilla FadeIn mwscript command.

#### [fadeOut](tes3/fadeOut.md)

> Similar to the vanilla FadeOut mwscript command.

#### [fadeTo](tes3/fadeTo.md)

> Similar to the vanilla FadeTo mwscript command.

#### [findDialogue](tes3/findDialogue.md)

> Locates a root dialogue that can then be filtered down for a specific actor to return a specific dialogue info For example, a type of 2 and a page of 1 will return the "Greeting 0" topic.

#### [findGMST](tes3/findGMST.md)

> Fetches the core game object that represents a game setting. While this function accepts a name, it is recommended to use the tes3.GMST constants.

#### [findGlobal](tes3/findGlobal.md)

> Fetches the core game object that represents a global variable.

#### [getActiveCells](tes3/getActiveCells.md)

> Returns a table of active cells. If indoors, the table will have only one entry. If outdoors, the 9 surrounding cells will be provided.

#### [getAttachment](tes3/getAttachment.md)

> Fetches an attachment with a given type.

#### [getAttributeName](tes3/getAttributeName.md)

> Returns the lowercase identifying name of an attribute for a given numerical, 0-based index. E.g. "strength".

#### [getCameraPosition](tes3/getCameraPosition.md)

> Returns the camera's position.

#### [getCameraVector](tes3/getCameraVector.md)

> Returns the camera look vector.

#### [getCell](tes3/getCell.md)

> Finds a cell, either by an id or an X/Y grid position.

#### [getCumulativeDaysForMonth](tes3/getCumulativeDaysForMonth.md)

> Gets the number of days that have passed leading up to the start of a given month.

#### [getCurrentAIPackageId](tes3/getCurrentAIPackageId.md)

> Returns an actor's current AI package ID, just as the mwscript function `GetCurrentAIPackage` would.

#### [getCurrentWeather](tes3/getCurrentWeather.md)

> Gets the currently active weather, from the player's current region.

#### [getCursorPosition](tes3/getCursorPosition.md)

> Returns a table with values x and y that contain the current cursor position.

#### [getDaysInMonth](tes3/getDaysInMonth.md)

> Returns the number of days in a given month. This may be altered if a Morrowind Code Patch feature was installed.

#### [getDialogueInfo](tes3/getDialogueInfo.md)

> Locates and returns a Dialogue Info by a given id. This involves file IO and is an expensive call. Results should be cached.

#### [getEquippedItem](tes3/getEquippedItem.md)

> Returns an actor's equipped item stack, provided a given filter

#### [getFaction](tes3/getFaction.md)

> Fetches the core game faction object for a given faction ID.

#### [getFileExists](tes3/getFileExists.md)

> Determines if a file exists in the user's Data Files.

#### [getFileSource](tes3/getFileSource.md)

> Determines if a file exists on the filesystem or inside of a bsa. The returned string will be "file" or "bsa".

#### [getGlobal](tes3/getGlobal.md)

> Retrieves the value of a global value, or nil if the global could not be found.

#### [getInputBinding](tes3/getInputBinding.md)

> Gets the input configuration for a given keybind.

#### [getJournalIndex](tes3/getJournalIndex.md)

> Gets the index of a given journal, or nil if no valid journal could be found.

#### [getLanguage](tes3/getLanguage.md)

> Gets the language as an ISO string (e.g. "eng"), determined by the language entry in Morrowind.ini.

#### [getLanguageCode](tes3/getLanguageCode.md)

> Gets the language code, determined by the language entry in Morrowind.ini.

#### [getLockLevel](tes3/getLockLevel.md)

> Gets an locked reference's lock level. If no lock data is available, it will return nil.

#### [getLocked](tes3/getLocked.md)

> Determines if a given reference is a locked door or container.

#### [getMagicEffect](tes3/getMagicEffect.md)

> Fetches the core game Magic Effect object for a given ID.

#### [getModList](tes3/getModList.md)

> Fetches the list of the active ESM and ESP files.

#### [getObject](tes3/getObject.md)

> Fetches the core game object for a given object ID.

#### [getOwner](tes3/getOwner.md)

> Returns the object's owner, or nil if the object is unowned.

#### [getPlayerCell](tes3/getPlayerCell.md)

> Fetches the cell that the player is currently in.

#### [getPlayerEyePosition](tes3/getPlayerEyePosition.md)

> Returns the position of the player's eyes.

#### [getPlayerEyeVector](tes3/getPlayerEyeVector.md)

> Returns the look direction of the player's eyes.

#### [getPlayerGold](tes3/getPlayerGold.md)

> Gets the gold count carried by the player.

#### [getPlayerTarget](tes3/getPlayerTarget.md)

> This function is used to see what the player is looking at. Unlike a real raycast, this does not work in all circumstances. As a general rule, it will return the reference if the information box is shown when it is looked at.

#### [getReference](tes3/getReference.md)

> Fetches the first reference for a given base object ID.

#### [getRegion](tes3/getRegion.md)

> Gets the current region the player is in. This checks the player's current cell first, but will fall back to the last exterior cell.

#### [getScript](tes3/getScript.md)

> Locates and returns a script by a given id.

#### [getSimulationTimestamp](tes3/getSimulationTimestamp.md)

> Returns a UNIX-style timestamp based on in-world simulation time since the start of the era.

#### [getSkill](tes3/getSkill.md)

> Fetches the core game object for a given skill ID.

#### [getSkillName](tes3/getSkillName.md)

> Returns the identifying name of a skill for a given numerical, 0-based index. E.g. "Enchant".

#### [getSound](tes3/getSound.md)

> Locates and returns a sound by a given id.

#### [getSoundGenerator](tes3/getSoundGenerator.md)

> Returns a sound generator by a given creature id and type.

#### [getSoundPlaying](tes3/getSoundPlaying.md)

> Without a reference, this function returns true if the sound is playing unattached or on any reference. With a reference, it returns true if the sound is playing on that specific reference.

#### [getSpecializationName](tes3/getSpecializationName.md)

> Returns the lowercase identifying name of a specialization type for a given numerical, 0-based index. E.g. "magic".

#### [getTopMenu](tes3/getTopMenu.md)

> Gets the top-level UI menu.

#### [getTrap](tes3/getTrap.md)

> Gets the trap on a given reference.

#### [hammerKey](tes3/hammerKey.md)

> Simulates hammering a key.

#### [hasCodePatchFeature](tes3/hasCodePatchFeature.md)

> Attempts to determine if a given Morrowind Code Patch feature is enabled. This may not be possible, in which case nil will be returned.

#### [hasOwnershipAccess](tes3/hasOwnershipAccess.md)

> Determines if a reference has access to another object, including its inventory.

#### [is3rdPerson](tes3/is3rdPerson.md)

> Returns if the game is in 3rd person.

#### [isModActive](tes3/isModActive.md)

> Determines if the player has a given ESP or ESM file active.

#### [iterate](tes3/iterate.md)

> This function returns a function that iterates over a tes3iterator object. This is useful for for loops.

#### [iterateObjects](tes3/iterateObjects.md)

> Iteration function used for looping over game options.

#### [loadGame](tes3/loadGame.md)

> Loads a game.

#### [loadMesh](tes3/loadMesh.md)

> Loads a mesh file and provides a scene graph object.

#### [lock](tes3/lock.md)

> Locks an object, and optionally sets a locked reference's lock level. Returns true if the object can be and wasn't already locked.

#### [loopTArray](tes3/loopTArray.md)

> This function returns a function that iterates over a tes3tarray object. This is useful for for loops.

#### [menuMode](tes3/menuMode.md)

> Returns true if the player is currently in menu mode.

#### [messageBox](tes3/messageBox.md)

> Displays a message box. This may be a simple toast-style message, or a box with choice buttons.

#### [modStatistic](tes3/modStatistic.md)

> Modifies a statistic on a given actor. This should be used instead of manually setting values on the game structures, to ensure that events and GUI elements are properly handled. Either skill, attribute, or name must be provided.

#### [newGame](tes3/newGame.md)

> Starts a new game.

#### [onMainMenu](tes3/onMainMenu.md)

> Returns true if the player is on the main menu, and hasn't loaded a game yet.

#### [persuade](tes3/persuade.md)

> Attempts a persuasion attempt on an actor, potentially adjusting their disposition. Returns true if the attempt was a success.

#### [playAnimation](tes3/playAnimation.md)

> Plays a given animation group. Optional flags can be used to define how the group starts.

#### [playItemPickupSound](tes3/playItemPickupSound.md)

> Plays the sound responsible for picking up or putting down an item.

#### [playSound](tes3/playSound.md)

> Plays a sound on a given reference. Provides control over volume (including volume channel), pitch, and loop control.

#### [playVoiceover](tes3/playVoiceover.md)

> Causes a target actor to play a voiceover.

#### [positionCell](tes3/positionCell.md)

> Positions a reference to another place.

#### [pushKey](tes3/pushKey.md)

> Simulates pushing a key.

#### [rayTest](tes3/rayTest.md)

> Performs a ray test and returns various information related to the result(s). If findAll is set, the result will be a table of results, otherwise only the first result is returned.

#### [releaseKey](tes3/releaseKey.md)

> Simulates releasing a key.

#### [removeEffects](tes3/removeEffects.md)

> Removes effects from a given reference. Requires that either the effect or castType parameter be provided.

#### [removeItem](tes3/removeItem.md)

> Removes an item to a given reference's inventory.

#### [removeSound](tes3/removeSound.md)

> Stops a sound playing. Without a reference, it will match unattached sounds. With a reference, it will only match a sound playing on that specific reference.

#### [runLegacyScript](tes3/runLegacyScript.md)

> This function will compile and run a mwscript chunk of code. This is not ideal to use, but can be used for features not yet exposed to lua.

#### [saveGame](tes3/saveGame.md)

> Saves the game.

#### [say](tes3/say.md)

> Plays a sound file, with an optional alteration and subtitle.

#### [setAIActivate](tes3/setAIActivate.md)

> Configures a mobile actor to activate an object.

#### [setAIEscort](tes3/setAIEscort.md)

> Configures a mobile actor to escort another actor to a destination.

#### [setAIFollow](tes3/setAIFollow.md)

> Configures a mobile actor to follow another actor to a destination.

#### [setAITravel](tes3/setAITravel.md)

> Configures a mobile actor to travel to a destination.

#### [setAIWander](tes3/setAIWander.md)

> Configures a mobile actor to wander around a cell.

#### [setDestination](tes3/setDestination.md)

> Sets or changes the destination of a door to a new location.

#### [setEnabled](tes3/setEnabled.md)

> Enables or disables a reference.

#### [setGlobal](tes3/setGlobal.md)

> Sets the value of a global value. If the global could not be found, the function returns false.

#### [setJournalIndex](tes3/setJournalIndex.md)

> Sets the index of a given journal in a way similar to the mwscript function SetJournalIndex.

#### [setLockLevel](tes3/setLockLevel.md)

> Sets a locked reference's lock level. This does not lock the object.

#### [setStatistic](tes3/setStatistic.md)

> Sets a statistic on a given actor. This should be used instead of manually setting values on the game structures, to ensure that events and GUI elements are properly handled. Either skill, attribute, or name must be provided.

#### [setTrap](tes3/setTrap.md)

> Sets the trap on a given reference.

#### [showRepairServiceMenu](tes3/showRepairServiceMenu.md)

> Opens the service repair menu.

#### [skipAnimationFrame](tes3/skipAnimationFrame.md)

> Skips a given reference's animation for a single frame.

#### [streamMusic](tes3/streamMusic.md)

> This function interrupts the current music to play the specified music track.

#### [tapKey](tes3/tapKey.md)

> Simulates tapping a key.

#### [transferItem](tes3/transferItem.md)

> Moves one or more items from one reference to another. Returns the actual amount of items successfully transferred.

#### [triggerCrime](tes3/triggerCrime.md)

> Emulates the player committing a crime.

#### [unhammerKey](tes3/unhammerKey.md)

> Stops simulating hammering a key.

#### [unlock](tes3/unlock.md)

> Unlocks an object. Returns true if the object can be and wasn't already unlocked.

#### [updateJournal](tes3/updateJournal.md)

> Updates the journal index in a way similar to the mwscript function Journal.
