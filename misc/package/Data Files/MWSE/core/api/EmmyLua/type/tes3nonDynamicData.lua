
--- A child container from tes3dataHandler, where game data is stored.
---@class tes3nonDynamicData
tes3nonDynamicData = {}

--- Removes an object from the proper collections.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3nonDynamicData/deleteObject.html).
---@type method
---@param object tes3baseObject
function tes3nonDynamicData:deleteObject(object) end

--- A collection of all dialogue objects.
---@type tes3iterator
tes3nonDynamicData.dialogues = nil

--- Locates the first reference for a given object ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3nonDynamicData/findFirstCloneOfActor.html).
---@type method
---@param id string
---@return tes3reference
function tes3nonDynamicData:findFirstCloneOfActor(id) end

--- A collection of all sound objects.
---@type tes3iterator
tes3nonDynamicData.sounds = nil

--- Locates a global variable for a given ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3nonDynamicData/findGlobalVariable.html).
---@type method
---@param id string
---@return tes3globalVariable
function tes3nonDynamicData:findGlobalVariable(id) end

--- A collection of all race objects.
---@type tes3iterator
tes3nonDynamicData.races = nil

--- A collection of all global variable objects.
---@type tes3iterator
tes3nonDynamicData.globals = nil

--- A collection of all cell objects.
---@type tes3stlList
tes3nonDynamicData.cells = nil

--- Inserts a newly created object into the proper collections.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3nonDynamicData/addNewObject.html).
---@type method
---@param object tes3baseObject
---@return boolean
function tes3nonDynamicData:addNewObject(object) end

--- A collection of all sound generator objects.
---@type tes3iterator
tes3nonDynamicData.soundGenerators = nil

--- A collection of all region objects.
---@type tes3iterator
tes3nonDynamicData.regions = nil

--- Locates a dialogue for a given ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3nonDynamicData/findDialogue.html).
---@type method
---@param id string
---@return tes3dialogue
function tes3nonDynamicData:findDialogue(id) end

--- A collection of all tes3startScript objects.
---@type tes3iterator
tes3nonDynamicData.startScripts = nil

--- Locates a sound for a given ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3nonDynamicData/findSound.html).
---@type method
---@param id string
---@return tes3sound
function tes3nonDynamicData:findSound(id) end

--- Locates a general object for a given ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3nonDynamicData/resolveObject.html).
---@type method
---@param id string
---@return tes3baseObject
function tes3nonDynamicData:resolveObject(id) end

--- A collection of all class objects.
---@type tes3iterator
tes3nonDynamicData.classes = nil

--- A collection of all script objects.
---@type tes3iterator
tes3nonDynamicData.scripts = nil

--- A collection of all other game objects.
---@type tes3linkedList
tes3nonDynamicData.objects = nil

--- Locates a script for a given ID.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/tes3nonDynamicData/findScript.html).
---@type method
---@param id string
---@return tes3script
function tes3nonDynamicData:findScript(id) end

--- A collection of all spell objects.
---@type tes3linkedList
tes3nonDynamicData.spells = nil

--- A collection of all faction objects.
---@type tes3iterator
tes3nonDynamicData.factions = nil


