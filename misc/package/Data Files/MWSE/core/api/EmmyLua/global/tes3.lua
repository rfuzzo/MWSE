
--- Similar to the vanilla FadeOut mwscript command.
---|
---|**Accepts table parameters:**
---|* `fader` (*tes3fader*): Defaults to the transition fader. Optional.
---|* `duration` (*number*): Time, in seconds, for the fade. Default: 1.0.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/fadeOut.html).
---@type function
---@param params table
function tes3.fadeOut(params) end

--- Deletes a game object from the system. This can be dangerous, use caution.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/deleteObject.html).
---@type function
---@param object tes3object
function tes3.deleteObject(object) end

--- Causes a target actor to play a voiceover.
---|
---|**Accepts table parameters:**
---|* `actor` (*tes3mobileActor|tes3reference|string*): The actor to play a voiceover.
---|* `voiceover` (*number*): Maps to tes3.voiceover constants.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/playVoiceover.html).
---@type function
---@param params table
---@return boolean { name = "played" }
function tes3.playVoiceover(params) end

--- Returns if the game is in 3rd person.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/is3rdPerson.html).
---@type function
---@return boolean { name = "state" }
function tes3.is3rdPerson() end

--- Unlocks an object. Returns true if the object can be and wasn't already unlocked.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/unlock.html).
---@type function
---@param params table
---@return boolean { name = "unlocked" }
function tes3.unlock(params) end

--- Gets the language as an ISO string (e.g. "eng"), determined by the language entry in Morrowind.ini.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getLanguage.html).
---@type function
---@return string { name = "code" }
function tes3.getLanguage() end

--- Casts a spell from a given reference to a target reference. The caster doesn't need to know the spell.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The caster reference.
---|* `target` (*tes3reference|tes3mobileActor|string*): The target reference.
---|* `spell` (*tes3spell|string*): The spell the caster uses.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/cast.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function tes3.cast(params) end

--- Stops simulating hammering a key.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/unhammerKey.html).
---@type function
---@param keyCode number
function tes3.unhammerKey(keyCode) end

--- Sets the value of a global value. If the global could not be found, the function returns false.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setGlobal.html).
---@type function
---@param id string
---@param value number
---@return boolean { name = "value" }
function tes3.setGlobal(id, value) end

--- Returns a UNIX-style timestamp based on in-world simulation time since the start of the era.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getSimulationTimestamp.html).
---@type function
---@return number { name = "timestamp" }
function tes3.getSimulationTimestamp() end

--- Removes effects from a given reference. Requires that either the effect or castType parameter be provided.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/removeEffects.html).
---@type function
---@param castType number { comment = "Maps to tes3.castType constants.", optional = "after" }
---@param chance number { comment = "The chance for the effect to be removed." }
---@param effect number { comment = "Maps to tes3.effect constants.", optional = "after" }
---@param reference tes3reference
---@param removeSpell boolean { comment = "If removing by cast type, determines if the spell should be removed from the target. Defaults to true if castType is not tes3.castType.spell.", optional = "after" }
function tes3.removeEffects(castType, chance, effect, reference, removeSpell) end

--- This function is used to see what the player is looking at. Unlike a real raycast, this does not work in all circumstances. As a general rule, it will return the reference if the information box is shown when it is looked at.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getPlayerTarget.html).
---@type function
---@return tes3reference
function tes3.getPlayerTarget() end

--- Determines if a given reference is a locked door or container.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getLocked.html).
---@type function
---@param params table
---@return boolean { name = "isLocked" }
function tes3.getLocked(params) end

--- Without a reference, this function returns true if the sound is playing unattached or on any reference. With a reference, it returns true if the sound is playing on that specific reference.
---|
---|**Accepts table parameters:**
---|* `sound` (*tes3sound|string*): The sound object, or the ID of the sound to look for.
---|* `reference` (*tes3reference|tes3mobileActor|string*): Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getSoundPlaying.html).
---@type function
---@param params table
---@return boolean { name = "soundIsPlaying" }
function tes3.getSoundPlaying(params) end

--- Gets an locked reference's lock level. If no lock data is available, it will return nil.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getLockLevel.html).
---@type function
---@param params table
---@return number { name = "level" }
function tes3.getLockLevel(params) end

--- Plays a sound on a given reference. Provides control over volume (including volume channel), pitch, and loop control.
---|
---|**Accepts table parameters:**
---|* `sound` (*tes3sound|string*): The sound object, or id of the sound to look for.
---|* `reference` (*tes3reference|tes3mobileActor|string*): The reference to attach the sound to. Optional.
---|* `loop` (*boolean*): If true, the sound will loop.
---|* `mixChannel` (*number*): The channel to base volume off of. Maps to tes3.audioMixType constants. Default: tes3.audioMixType.effects.
---|* `volume` (*number*): A value between 0.0 and 1.0 to scale the volume off of. Default: 1.0.
---|* `pitch` (*number*): The pitch-shift multiplier. For 22kHz audio (most typical) it can have the range [0.005, 4.5]; for 44kHz audio it can have the range [0.0025, 2.25]. Default: 1.0.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/playSound.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function tes3.playSound(params) end

--- Fetches the core game object for a given object ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getObject.html).
---@type function
---@param id string
---@return tes3object { name = "object" }
function tes3.getObject(id) end

--- Sets a statistic on a given actor. This should be used instead of manually setting values on the game structures, to ensure that events and GUI elements are properly handled. Either skill, attribute, or name must be provided.
---|
---|**Accepts table parameters:**
---|* `attribute` (*number*): The attribute to set. Optional.
---|* `base` (*number*): If set, the base value will be set. Optional.
---|* `current` (*number*): If set, the current value will be set. Optional.
---|* `limit` (*boolean*): If set, the attribute won't rise above 100 or fall below 0.
---|* `name` (*string*): A generic name of an attribute to set. Optional.
---|* `reference` (*tes3mobileActor|tes3reference|string*)
---|* `skill` (*number*): The skill to set. Optional.
---|* `value` (*number*): If set, both the base and current value will be set. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setStatistic.html).
---@type function
---@param params table
function tes3.setStatistic(params) end

--- Returns a sound generator by a given creature id and type.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getSoundGenerator.html).
---@type function
---@param creatureId string
---@param soundType number { comment = "Maps to tes3.soundGenType constants." }
---@return tes3soundGenerator { name = "soundGenerator" }
function tes3.getSoundGenerator(creatureId, soundType) end

--- Opens the service repair menu.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/showRepairServiceMenu.html).
---@type function
function tes3.showRepairServiceMenu() end

--- Gets the top-level UI menu.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getTopMenu.html).
---@type function
---@return tes3uiElement { name = "menu" }
function tes3.getTopMenu() end

--- Changes the volume of a sound that is playing on a given reference.
---|
---|**Accepts table parameters:**
---|* `sound` (*tes3sound|string*): The sound object, or id of the sound to look for.
---|* `reference` (*tes3reference|tes3mobileActor|string*): The reference to attach the sound to.
---|* `mixChannel` (*number*): The channel to base volume off of. Maps to tes3.audioMixType constants. Default: tes3.audioMixType.effects.
---|* `volume` (*number*): A value between 0.0 and 1.0 to scale the volume off of. Default: 1.0.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/adjustSoundVolume.html).
---@type function
---@param params table
function tes3.adjustSoundVolume(params) end

--- Retrieves the value of a global value, or nil if the global could not be found.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getGlobal.html).
---@type function
---@param id string
---@return number { name = "value" }
function tes3.getGlobal(id) end

--- Updates the journal index in a way similar to the mwscript function Journal.
---|
---|**Accepts table parameters:**
---|* `id` (*tes3dialogue|string*)
---|* `index` (*number*)
---|* `showMessage` (*boolean*): If set, a message may be shown to the player.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/updateJournal.html).
---@type function
---@param params table
---@return boolean { name = "wasSet" }
function tes3.updateJournal(params) end

--- Returns the lowercase identifying name of an attribute for a given numerical, 0-based index. E.g. "strength".
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getAttributeName.html).
---@type function
---@param attributeId number { comment = "The attribute id to get the name of, from tes3.attributeName constants." }
---@return string { name = "name" }
function tes3.getAttributeName(attributeId) end

--- Emulates the player committing a crime.
---|
---|**Accepts table parameters:**
---|* `criminal` (*tes3mobileActor|tes3reference|string*): Default: tes3.mobilePlayer.
---|* `forceDetection` (*boolean*): Can be set to true to ignore normal detection checks.
---|* `type` (*number*): Maps to tes3.crimeType constants. Default: tes3.crimeType.stealing.
---|* `value` (*number*): Penalty for the crime. Defaults to 25 for pickpocketing.
---|* `victim` (*tes3mobileActor|tes3reference|string*): Default: tes3.mobilePlayer.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/triggerCrime.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function tes3.triggerCrime(params) end

--- Returns the object's owner, or nil if the object is unowned.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getOwner.html).
---@type function
---@param reference tes3reference
---@return tes3object { name = "object" }
function tes3.getOwner(reference) end

--- Preforms a ray test and returns various information related to the result(s). If findAll is set, the result will be a table of results, otherwise only the first result is returned.
---|
---|**Accepts table parameters:**
---|* `position` (*tes3vector3|table*): Position of the ray origin.
---|* `direction` (*tes3vector3|table*): Direction of the ray. Does not have to be unit length.
---|* `findAll` (*boolean*): If true, the ray test won't stop after the first result.
---|* `maxDistance` (*number*): The maximum distance that the test will run. Optional.
---|* `sort` (*boolean*): If true, the results will be sorted by distance from the origin position. Default: true.
---|* `useModelBounds` (*boolean*): If true, model bounds will be tested for intersection. Otherwise triangles will be used.
---|* `useModelCoordinates` (*boolean*): If true, model coordinates will be used instead of world coordinates.
---|* `useBackTriangles` (*boolean*): Include intersections with back-facing triangles.
---|* `observeAppCullFlag` (*boolean*): Ignore intersections with culled (hidden) models. Default: true.
---|* `returnColor` (*boolean*): Calculate and return the vertex color at intersections.
---|* `returnNormal` (*boolean*): Calculate and return the vertex normal at intersections. Default: true.
---|* `returnSmoothNormal` (*boolean*): Use normal interpolation for calculating vertex normals.
---|* `returnTexture` (*boolean*): Calculate and return the texture coordinate at intersections.
---|* `ignore` (*table*): An array of references and/or scene graph nodes to cull from the result(s). Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/rayTest.html).
---@type function
---@param params table
---@return niPickRecord|table { name = "result" }
function tes3.rayTest(params) end

--- Plays a sound file, with an optional alteration and subtitle.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The reference to make say something.
---|* `path` (*string*): A path to a valid sound file.
---|* `pitch` (*number*): A pitch shift to adjust the sound with. Default: 1.
---|* `volume` (*number*): The volume to play the sound at, relative to the voice mix channel. Default: 1.
---|* `forceSubtitle` (*boolean*): If true a subtitle will be shown, even if subtitles are disabled.
---|* `subtitle` (*string*): The subtitle to show if subtitles are enabled, or if forceSubtitle is set. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/say.html).
---@type function
---@param params table
function tes3.say(params) end

--- Skips a given reference's animation for a single frame.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3mobileActor|tes3reference|string*): The reference whose animation frame will be skipped.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/skipAnimationFrame.html).
---@type function
---@param params table
function tes3.skipAnimationFrame(params) end

--- Similar to the vanilla FadeTo mwscript command.
---|
---|**Accepts table parameters:**
---|* `fader` (*tes3fader*): Defaults to the transition fader. Optional.
---|* `duration` (*number*): Time, in seconds, for the fade. Default: 1.0.
---|* `value` (*number*): Default: 1.0.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/fadeTo.html).
---@type function
---@param params table
function tes3.fadeTo(params) end

--- Returns the camera look vector.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getCameraVector.html).
---@type function
---@return tes3vector3 { name = "vector3" }
function tes3.getCameraVector() end

--- Returns the lowercase identifying name of a specialization type for a given numerical, 0-based index. E.g. "magic".
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getSpecializationName.html).
---@type function
---@return string { name = "name" }
function tes3.getSpecializationName() end

--- This function interrupts the current music to play the specified music track.
---|
---|**Accepts table parameters:**
---|* `path` (*string*): Path to the music file, relative to Data Files/music/.
---|* `situation` (*number*): Determines what kind of gameplay situation the music should stay active for. Explore music plays during non-combat, and ends when combat starts. Combat music starts during combat, and ends when combat ends. Uninterruptible music always plays, ending only when the track does. Default: tes3.musicSituation.uninterruptible.
---|* `crossfade` (*number*): The duration in seconds of the crossfade from the old to the new track. The default is 1.0. Default: 1.0.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/streamMusic.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function tes3.streamMusic(params) end

--- Saves the game.
---|
---|**Accepts table parameters:**
---|* `file` (*string*): The filename of the save that will be created, without extension. Default: "quiksave".
---|* `name` (*string*): The display name of the save. Default: "Quicksave".
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/saveGame.html).
---@type function
---@param params table
---@return boolean { name = "saved" }
function tes3.saveGame(params) end

--- Fetches the core game faction object for a given faction ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getFaction.html).
---@type function
---@param id string
---@return tes3faction { name = "faction" }
function tes3.getFaction(id) end

--- Sets the trap on a given reference.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*)
---|* `spell` (*tes3spell|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setTrap.html).
---@type function
---@param params table
---@return boolean { name = "trapped" }
function tes3.setTrap(params) end

--- Returns the number of days in a given month. This may be altered if a Morrowind Code Patch feature was installed.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getDaysInMonth.html).
---@type function
---@param month number
---@return number { name = "dayCount" }
function tes3.getDaysInMonth(month) end

--- Locates a root dialogue that can then be filtered down for a specific actor to return a specific dialogue info For example, a type of 2 and a page of 1 will return the "Greeting 0" topic.
---|
---|**Accepts table parameters:**
---|* `type` (*number*): The type of dialogue to look for: 1 for voice, 2 for greeting, 3 for service.
---|* `page` (*number*): The page of dialogue to fetch.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/findDialogue.html).
---@type function
---@param params table
---@return tes3dialogue { name = "dialogue" }
function tes3.findDialogue(params) end

--- Sets a locked reference's lock level. This does not lock the object.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*)
---|* `level` (*number*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setLockLevel.html).
---@type function
---@param params table
---@return boolean { name = "set" }
function tes3.setLockLevel(params) end

--- Returns true if the player is currently in menu mode.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/menuMode.html).
---@type function
---@return boolean { name = "inMenuMode" }
function tes3.menuMode() end

--- The player's mobile actor.
---@type tes3mobilePlayer
tes3.mobilePlayer = nil

--- Causes a misc item to be recognized as a soul gem, so that it can be used for soul trapping.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/addSoulGem.html).
---@type function
---@param params table
---@return number { name = "wasAdded" }
function tes3.addSoulGem(params) end

--- Gets the current region the player is in. This checks the player's current cell first, but will fall back to the last exterior cell.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getRegion.html).
---@type function
---@return tes3region { name = "region" }
function tes3.getRegion() end

--- Enables or disables a reference.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The reference to enable/disable.
---|* `toggle` (*boolean*): If true, the enabled state will be toggled.
---|* `enabled` (*boolean*): If not toggling, will set true to enable or false to disable. Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setEnabled.html).
---@type function
---@param params table
---@return boolean { name = "success" }
function tes3.setEnabled(params) end

--- Sets or changes the destination of a door to a new location.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference*): The door reference that will be updated.
---|* `position` (*tes3vector|table*): The new coordinates of the transition.
---|* `orientation` (*tes3vector|table*): The new rotation to use after transition.
---|* `cell` (*tes3cell|string*): The cell to transition to, if transitioning to an interior. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setDestination.html).
---@type function
---@param params table
function tes3.setDestination(params) end

--- Configures a mobile actor to wander around a cell.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3mobileActor|tes3reference*)
---|* `idles` (*table*)
---|* `range` (*number*): Optional.
---|* `duration` (*number*): Optional.
---|* `time` (*number*): Optional.
---|* `reset` (*boolean*): Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setAIWander.html).
---@type function
---@param params table
function tes3.setAIWander(params) end

--- Configures a mobile actor to escort another actor to a destination.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3mobileActor|tes3reference*)
---|* `target` (*tes3reference|tes3mobileActor*)
---|* `destination` (*tes3vector3|table*)
---|* `duration` (*number*): Optional.
---|* `cell` (*tes3cell|string*): Optional.
---|* `reset` (*boolean*): Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setAIEscort.html).
---@type function
---@param params table
function tes3.setAIEscort(params) end

--- Drops one or more items from a reference's inventory onto the ground at their feet.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3mobileActor|tes3reference|string*): The reference whose inventory will be modified.
---|* `item` (*tes3item|string*): The item to drop.
---|* `itemData` (*tes3itemData*): The item data to match. Optional.
---|* `count` (*number*): The number of items to drop. Default: 1.
---|* `matchExact` (*boolean*): If true, the exact item will be matched. This is important if you want to drop an item without item data. Default: true.
---|* `updateGUI` (*boolean*): If false, the player or contents menu won't be updated. Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/dropItem.html).
---@type function
---@param params table
---@return tes3reference { name = "createdReference" }
function tes3.dropItem(params) end

--- Fetches the first reference for a given base object ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getReference.html).
---@type function
---@param id string
---@return tes3reference { name = "reference" }
function tes3.getReference(id) end

--- Configures a mobile actor to travel to a destination.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3mobileActor|tes3reference*)
---|* `destination` (*tes3vector3|table*)
---|* `reset` (*boolean*): Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setAITravel.html).
---@type function
---@param params table
function tes3.setAITravel(params) end

--- Configures a mobile actor to activate an object.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3mobileActor|tes3reference*)
---|* `target` (*tes3reference*)
---|* `reset` (*boolean*): Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setAIActivate.html).
---@type function
---@param params table
function tes3.setAIActivate(params) end

--- Returns a table with values x and y that contain the current cursor position.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getCursorPosition.html).
---@type function
---@return table { name = "table" }
function tes3.getCursorPosition() end

--- Stops a sound playing. Without a reference, it will match unattached sounds. With a reference, it will only match a sound playing on that specific reference.
---|
---|**Accepts table parameters:**
---|* `sound` (*tes3sound|string*): The sound object, or id of the sound to look for.
---|* `reference` (*tes3reference|tes3mobileActor|string*): The reference the sound is attached to. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/removeSound.html).
---@type function
---@param params table
function tes3.removeSound(params) end

--- Fetches the core game Magic Effect object for a given ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getMagicEffect.html).
---@type function
---@param id number
---@return tes3magicEffect { name = "magicEffect" }
function tes3.getMagicEffect(id) end

--- Simulates tapping a key.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/tapKey.html).
---@type function
---@param keyCode number
function tes3.tapKey(keyCode) end

--- This function will compile and run a mwscript chunk of code. This is not ideal to use, but can be used for features not yet exposed to lua.
---|
---|**Accepts table parameters:**
---|* `script` (*tes3script*): The base script to base the execution from. Default: tes3.worldController.scriptGlobals.
---|* `source` (*number*): The compilation source to use. Defaults to tes3.scriptSource.default
---|* `command` (*string*): The script text to compile and run.
---|* `variables` (*tes3scriptVariables*): If a reference is provided, the reference's variables will be used. Optional.
---|* `reference` (*tes3reference|tes3mobileActor|string*): The reference to target for execution.
---|* `dialogue` (*tes3dialogue|string*): If compiling for dialogue context, the dialogue associated with the script. Optional.
---|* `info` (*tes3dialogueInfo*): The info associated with the dialogue. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/runLegacyScript.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function tes3.runLegacyScript(params) end

--- Disables the use of a key.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/disableKey.html).
---@type function
---@param keyCode number
function tes3.disableKey(keyCode) end

--- Removes an item to a given reference's inventory.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): Who to give items to.
---|* `item` (*tes3item|string*): The item to remove.
---|* `count` (*number*): The maximum number of items to remove. Default: 1.
---|* `playSound` (*boolean*): If false, the up/down sound for the item won't be played. Default: true.
---|* `updateGUI` (*boolean*): If false, the function won't manually resync the player's GUI state. This can result in some optimizations, though `tes3ui.forcePlayerInventoryUpdate()` must manually be called after all inventory updates are finished. Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/removeItem.html).
---@type function
---@param params table
---@return number { name = "removedCount" }
function tes3.removeItem(params) end

--- This function returns a function that iterates over a tes3iterator object. This is useful for for loops.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/iterate.html).
---@type function
---@param iterator tes3iterator
---@return function { name = "function" }
function tes3.iterate(iterator) end

--- This function returns a function that iterates over a tes3tarray object. This is useful for for loops.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/loopTArray.html).
---@type function
---@param tarray tes3tarray
---@return function { name = "iterationFunction" }
function tes3.loopTArray(tarray) end

--- Simulates releasing a key.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/releaseKey.html).
---@type function
---@param keyCode number
function tes3.releaseKey(keyCode) end

--- Fetches the list of the active ESM and ESP files.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getModList.html).
---@type function
---@return table { name = "modList" }
function tes3.getModList() end

--- Moves one or more items from one reference to another. Returns the actual amount of items successfully transferred.
---|
---|**Accepts table parameters:**
---|* `from` (*tes3reference|tes3mobileActor|string*): Who to take items from.
---|* `to` (*tes3reference|tes3mobileActor|string*): Who to give items to.
---|* `item` (*tes3item|string*): The item to transfer.
---|* `itemData` (*tes3itemData*): The specific item data to transfer if, for example, you want to transfer a specific player item. Optional.
---|* `count` (*number*): The maximum number of items to transfer. Default: 1.
---|* `playSound` (*boolean*): If false, the up/down sound for the item won't be played. Default: true.
---|* `limitCapacity` (*boolean*): If false, items can be placed into containers that shouldn't normally be allowed. This includes organic containers, and containers that are full. Default: true.
---|* `updateGUI` (*boolean*): If false, the function won't manually resync the player's GUI state. This can result in some optimizations, though `tes3ui.forcePlayerInventoryUpdate()` must manually be called after all inventory updates are finished. Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/transferItem.html).
---@type function
---@param params table
---@return number { name = "transferredCount" }
function tes3.transferItem(params) end

--- Determines if a file exists in the user's Data Files.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getFileExists.html).
---@type function
---@param path string
---@return boolean { name = "exists" }
function tes3.getFileExists(path) end

--- Creates an item data if there is room for a new stack in a given inventory. This can be then used to add custom user data or adjust an item's condition. This will return nil if no item data could be allocated for the item -- for example if the reference doesn't have the item in their inventory or each item of that type already has item data.
---|
---|**Accepts table parameters:**
---|* `to` (*tes3reference|tes3mobileActor|string*): The reference whose inventory will be modified.
---|* `item` (*tes3item|string*): The item to create item data for.
---|* `updateGUI` (*boolean*): If false, the player or contents menu won't be updated. Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/addItemData.html).
---@type function
---@param params table
---@return tes3itemData { name = "createdData" }
function tes3.addItemData(params) end

--- Locks an object, and optionally sets a locked reference's lock level. Returns true if the object can be and wasn't already locked.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*)
---|* `level` (*number*): Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/lock.html).
---@type function
---@param params table
---@return boolean { name = "locked" }
function tes3.lock(params) end

--- Simulates pushing a key.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/pushKey.html).
---@type function
---@param keyCode number
function tes3.pushKey(keyCode) end

--- Positions a reference to another place.
---|
---|**Accepts table parameters:**
---|* `cell` (*tes3cell*)
---|* `orientation` (*tes3vector3|table*)
---|* `position` (*tes3vector3|table*)
---|* `reference` (*tes3reference|tes3mobileActor|string*): The reference to attach the sound to. Default: tes3.mobilePlayer.
---|* `teleportCompanions` (*boolean*): If used on the player, determines if companions should also be teleported. Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/positionCell.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function tes3.positionCell(params) end

--- Gets the index of a given journal, or nil if no valid journal could be found.
---|
---|**Accepts table parameters:**
---|* `id` (*tes3dialogue|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getJournalIndex.html).
---@type function
---@param params table
---@return number { name = "index" }
function tes3.getJournalIndex(params) end

--- Plays the sound responsible for picking up or putting down an item.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The reference to attach the sound to. Optional.
---|* `item` (*tes3item*)
---|* `pickup` (*boolean*): If false, the place down item will be used. Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/playItemPickupSound.html).
---@type function
---@param params table
---@return boolean { name = "executed" }
function tes3.playItemPickupSound(params) end

--- A reference to the player.
---@type tes3reference
tes3.player = nil

--- Plays a given animation group. Optional flags can be used to define how the group starts.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3mobileActor|tes3reference|string*): The reference that will play the animation.
---|* `group` (*number*): The group id -- a value from 0 to 149. Maps to tes3.animationGroup.* constants. Default: 0.
---|* `startFlag` (*number*): A flag for starting the group with, matching tes3.animationStartFlag.* constants. Default: 0.
---|* `loopCount` (*number*): If provided, the animation will loop a given number of times. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/playAnimation.html).
---@type function
---@param params table
function tes3.playAnimation(params) end

--- Gets the currently active weather, from the player's current region.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getCurrentWeather.html).
---@type function
---@return tes3weather { name = "weather" }
function tes3.getCurrentWeather() end

--- Gets the input configuration for a given keybind.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getInputBinding.html).
---@type function
---@param keybind number { comment = "Maps to tes3.keybind constants." }
---@return tes3inputConfig { name = "inputConfig" }
function tes3.getInputBinding(keybind) end

--- Attempts a persuasion attempt on an actor, potentially adjusting their disposition. Returns true if the attempt was a success.
---|
---|**Accepts table parameters:**
---|* `actor` (*tes3mobileActor|tes3reference|string*): The actor to try to persuade.
---|* `index` (*number*): If an index is provided, 0-indexed with the following results: admire, intimidate, taunt, bribe (10), bribe (100), bribe (1000). Optional.
---|* `modifier` (*number*): If no index is provided, this is the direct modifier to try. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/persuade.html).
---@type function
---@param params table
---@return boolean { name = "success" }
function tes3.persuade(params) end

--- Locates and returns a Dialogue Info by a given id. This involves file IO and is an expensive call. Results should be cached.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getDialogueInfo.html).
---@type function
---@param dialogue tes3dialogue|string { comment = "The dialogue that the info belongs to." }
---@param id string { comment = "The numerical, unique id for the info object." }
---@return tes3dialogueInfo { name = "dialogueInfo" }
function tes3.getDialogueInfo(dialogue, id) end

--- Similar to mwscript's PlaceAtPC or PlaceAtMe, this creates a new reference in the game world.
---|
---|**Accepts table parameters:**
---|* `object` (*tes3physicalObject|string*): The object to create a reference of.
---|* `position` (*tes3vector3|table*): The location to create the reference at.
---|* `orientation` (*tes3vector3|table*): The new orientation for the created reference.
---|* `cell` (*tes3cell|string|table*): The cell to create the reference in. This is only needed for interior cells. Optional.
---|* `scale` (*number*): A scale for the reference. Default: 1.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/createReference.html).
---@type function
---@param params table
---@return tes3reference { name = "newReference" }
function tes3.createReference(params) end

--- Modifies a statistic on a given actor. This should be used instead of manually setting values on the game structures, to ensure that events and GUI elements are properly handled. Either skill, attribute, or name must be provided.
---|
---|**Accepts table parameters:**
---|* `attribute` (*number*): The attribute to set. Optional.
---|* `base` (*number*): If set, the base value will be modified. Optional.
---|* `current` (*number*): If set, the current value will be modified. Optional.
---|* `limit` (*boolean*): If set, the attribute won't rise above 100 or fall below 0.
---|* `name` (*string*): A generic name of an attribute to set. Optional.
---|* `reference` (*tes3mobileActor|tes3reference|string*)
---|* `skill` (*number*): The skill to set. Optional.
---|* `value` (*number*): If set, both the base and current value will be modified. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/modStatistic.html).
---@type function
---@param params table
function tes3.modStatistic(params) end

--- Adds an item to a given reference's inventory.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): Who to give items to.
---|* `item` (*tes3item|string*): The item to add.
---|* `count` (*number*): The maximum number of items to add. Default: 1.
---|* `playSound` (*boolean*): If false, the up/down sound for the item won't be played. Default: true.
---|* `limit` (*boolean*): If false, items can be placed into containers that shouldn't normally be allowed. This includes organic containers, and containers that are full.
---|* `updateGUI` (*boolean*): If false, the function won't manually resync the player's GUI state. This can result in some optimizations, though `tes3ui.forcePlayerInventoryUpdate()` must manually be called after all inventory updates are finished. Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/addItem.html).
---@type function
---@param params table
---@return number { name = "addedCount" }
function tes3.addItem(params) end

--- Enables the use of a key.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/enableKey.html).
---@type function
---@param keyCode number
function tes3.enableKey(keyCode) end

--- Sets the index of a given journal in a way similar to the mwscript function SetJournalIndex.
---|
---|**Accepts table parameters:**
---|* `id` (*tes3dialogue|string*)
---|* `index` (*number*)
---|* `speaker` (*tes3mobileActor|tes3reference|string*)
---|* `showMessage` (*boolean*): If set, a message may be shown to the player.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setJournalIndex.html).
---@type function
---@param params table
---@return boolean { name = "wasSet" }
function tes3.setJournalIndex(params) end

--- Gets the number of days that have passed leading up to the start of a given month.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getCumulativeDaysForMonth.html).
---@type function
---@param month number { comment = "The 0-based month index." }
---@return number { name = "days" }
function tes3.getCumulativeDaysForMonth(month) end

--- Returns the camera's position.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getCameraPosition.html).
---@type function
---@return tes3vector3 { name = "vector3" }
function tes3.getCameraPosition() end

--- One of the core game objects.
---@type tes3game
tes3.game = nil

--- Fetches the core game object for a given skill ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getSkill.html).
---@type function
---@param id number { comment = "Maps to tes3.skill constants." }
---@return tes3skill { name = "skill" }
function tes3.getSkill(id) end

--- Returns a table of active cells. If indoors, the table will have only one entry. If outdoors, the 9 surrounding cells will be provided.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getActiveCells.html).
---@type function
---@return table { name = "cells" }
function tes3.getActiveCells() end

--- Returns an actor's equipped item stack, provided a given filter
---|
---|**Accepts table parameters:**
---|* `actor` (*tes3reference|tes3mobileActor|tes3actor*)
---|* `enchanted` (*boolean*): If true, filters to enchanted items. Optional.
---|* `objectType` (*number*): Maps to tes3.objectType constants. Used to filter equipment by type. Optional.
---|* `slot` (*number*): Maps to tes3.armorSlot or tes3.clothingSlot. Used to filter equipment by slot. Optional.
---|* `type` (*number*): Maps to tes3.weaponType. Used to filter equipment by type. Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getEquippedItem.html).
---@type function
---@param params table
---@return tes3equipmentStack { name = "stack" }
function tes3.getEquippedItem(params) end

--- Loads a game.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/loadGame.html).
---@type function
---@param filename string { comment = "The full filename of the save that we want to load, including extension." }
function tes3.loadGame(filename) end

--- Iteration function used for looping over game options.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/iterateObjects.html).
---@type function
---@param filter number { comment = "Maps to tes3.objectType constants." }
---@return tes3object { name = "object" }
function tes3.iterateObjects(filter) end

--- Determines if the player has a given ESP or ESM file active.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/isModActive.html).
---@type function
---@param filename string { comment = "The filename of the mod to find, including the extension." }
---@return boolean
function tes3.isModActive(filename) end

--- Determines if a merchant trades in a given item.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/checkMerchantTradesItem.html).
---@type function
---@param item tes3item|string
---@param reference tes3reference|tes3mobileActor|string
---@return boolean { name = "trades" }
function tes3.checkMerchantTradesItem(item, reference) end

--- Determines if a reference has access to another object, including its inventory.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*): The actor to check permissions for. Default: tes3.player.
---|* `target` (*tes3reference|tes3mobileActor|string*): The reference to check access of.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/hasOwnershipAccess.html).
---@type function
---@param params table
---@return boolean { name = "hasAccess" }
function tes3.hasOwnershipAccess(params) end

--- Returns an actor's current AI package ID, just as the mwscript function `GetCurrentAIPackage` would.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getCurrentAIPackageId.html).
---@type function
---@param reference tes3mobileActor|tes3reference
---@return number { name = "packageID" }
function tes3.getCurrentAIPackageId(reference) end

--- Fetches the cell that the player is currently in.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getPlayerCell.html).
---@type function
---@return tes3cell
function tes3.getPlayerCell() end

--- Locates and returns a sound by a given id.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getSound.html).
---@type function
---@param id string
---@return tes3sound { name = "sound" }
function tes3.getSound(id) end

--- Simulates hammering a key.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/hammerKey.html).
---@type function
---@param keyCode number
function tes3.hammerKey(keyCode) end

--- Fetches an attachment with a given type.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getAttachment.html).
---@type function
---@param reference tes3reference
---@param attachment string
function tes3.getAttachment(reference, attachment) end

--- Displays a message box. This may be a simple toast-style message, or a box with choice buttons.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/messageBox.html).
---@type function
---@param messageOrParams string|table
---@param formatAdditions variadic { comment = "Only used if messageOrParams is a string.", optional = "after" }
---@return boolean { name = "soundIsPlaying" }
function tes3.messageBox(messageOrParams, formatAdditions) end

--- One of the core game objects.
---@type tes3worldController
tes3.worldController = nil

--- Determines if a file exists on the filesystem or inside of a bsa. The returned string will be "file" or "bsa".
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getFileSource.html).
---@type function
---@param path string
---@return string { name = "exists" }
function tes3.getFileSource(path) end

--- Fetches the core game object that represents a global variable.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/findGlobal.html).
---@type function
---@param id string
---@return tes3globalVariable { name = "globalVariable" }
function tes3.findGlobal(id) end

--- Locates and returns a script by a given id.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getScript.html).
---@type function
---@param id string
---@return tes3script { name = "script" }
function tes3.getScript(id) end

--- Returns true if the player is on the main menu, and hasn't loaded a game yet.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/onMainMenu.html).
---@type function
---@return boolean { name = "onMainMenu" }
function tes3.onMainMenu() end

--- One of the core game objects.
---@type tes3dataHandler
tes3.dataHandler = nil

--- Starts a new game.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/newGame.html).
---@type function
function tes3.newGame() end

--- Configures a mobile actor to follow another actor to a destination.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3mobileActor|tes3reference*)
---|* `target` (*tes3reference|tes3mobileActor*)
---|* `destination` (*tes3vector3|table*): Optional.
---|* `duration` (*number*): Optional.
---|* `cell` (*tes3cell|string*): Optional.
---|* `reset` (*boolean*): Default: true.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/setAIFollow.html).
---@type function
---@param params table
function tes3.setAIFollow(params) end

--- Returns the identifying name of a skill for a given numerical, 0-based index. E.g. "Enchant".
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getSkillName.html).
---@type function
---@return string { name = "name" }
function tes3.getSkillName() end

--- Gets the gold count carried by the player.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getPlayerGold.html).
---@type function
---@return number { name = "goldCount" }
function tes3.getPlayerGold() end

--- Returns the look direction of the player's eyes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getPlayerEyeVector.html).
---@type function
---@return tes3vector3 { name = "position" }
function tes3.getPlayerEyeVector() end

--- Returns the position of the player's eyes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getPlayerEyePosition.html).
---@type function
---@return tes3vector3 { name = "position" }
function tes3.getPlayerEyePosition() end

--- Gets the language code, determined by the language entry in Morrowind.ini.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getLanguageCode.html).
---@type function
---@return number { name = "code" }
function tes3.getLanguageCode() end

--- Finds a cell, either by an id or an X/Y grid position.
---|
---|**Accepts table parameters:**
---|* `id` (*string*): The cell's ID. If not provided, x and y must be.
---|* `x` (*number*)
---|* `y` (*number*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getCell.html).
---@type function
---@param params table
---@return tes3cell { name = "cell" }
function tes3.getCell(params) end

--- Gets the trap on a given reference.
---|
---|**Accepts table parameters:**
---|* `reference` (*tes3reference|tes3mobileActor|string*)
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/getTrap.html).
---@type function
---@param params table
---@return tes3spell { name = "spell" }
function tes3.getTrap(params) end

--- Fetches the core game object that represents a game setting. While this function accepts a name, it is recommended to use the tes3.GMST constants.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/findGMST.html).
---@type function
---@param id number|string
---@return tes3gameSetting { name = "gameSetting" }
function tes3.findGMST(id) end

--- Attempts to determine if a given Morrowind Code Patch feature is enabled. This may not be possible, in which case nil will be returned.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/hasCodePatchFeature.html).
---@type function
---@param id number
---@return boolean|nil { name = "state" }
function tes3.hasCodePatchFeature(id) end

--- Similar to the vanilla FadeIn mwscript command.
---|
---|**Accepts table parameters:**
---|* `fader` (*tes3fader*): Defaults to the transition fader. Optional.
---|* `duration` (*number*): Time, in seconds, for the fade. Default: 1.0.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/fadeIn.html).
---@type function
---@param params table
function tes3.fadeIn(params) end

--- Loads a mesh file and provides a scene graph object.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3/loadMesh.html).
---@type function
---@param path string { comment = "Path, relative to Data Files/Meshes." }
---@return niNode { name = "model" }
function tes3.loadMesh(path) end


