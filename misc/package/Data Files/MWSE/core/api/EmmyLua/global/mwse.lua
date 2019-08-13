
--- Converts a TES3 object type (e.g. from tes3.objectType) into an uppercase, 4-character string.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/longToString.html).
---@type function
---@param type number
---@return string
function mwse.longToString(type) end

--- Loads a config table from Data Files\MWSE\config\{fileName}.json.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/loadConfig.html).
---@type function
---@param fileName string
---@return table|nil
function mwse.loadConfig(fileName) end

--- Returns the amount of memory used, in bytes.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/getVirtualMemoryUsage.html).
---@type function
---@return number
function mwse.getVirtualMemoryUsage() end

--- Configures MWSE to execute a given function instead when a script would run.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/overrideScript.html).
---@type function
---@param scriptId string
---@param callback function
---@return boolean
function mwse.overrideScript(scriptId, callback) end

--- The mwseTimerController responsible for simulate-type timers.
---@type mwseTimerController
mwse.simulateTimers = nil

--- The mwseTimerController responsible for game-type timers.
---@type mwseTimerController
mwse.gameTimers = nil

--- A numerical representation of the release version of MWSE currently being used.
---|
---|Formatted as AAABBBCCC, where A is the major version, BBB is the minor version, and CCC is the patch version. BBB and CCC are forward-padded.
---|
---|It is usually better to use mwse.buildDate instead.
---@type number
mwse.version = nil

--- Creates a string in storage, and returns the numerical key for it.
---|
---|If the string is already in storage, the previous key will be returned.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/string/create.html).
---@type function
---@param arg1 string
---@return number
function mwse.string.create(arg1) end

--- Returns the numerical key for a given string in storage, or nil if the string isn't in storage.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/string/get.html).
---@type function
---@param arg1 string
---@return number { optional = "after" }
function mwse.string.get(arg1) end

--- A numerical representation of the date that version of MWSE currently being used was built on.
---|
---|Formatted as YYYYMMDD.
---@type number
mwse.buildDate = nil

--- Converts an uppercase, 4-character string into a TES3 object type.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stringToLong.html).
---@type function
---@param tag string
---@return number
function mwse.stringToLong(tag) end

--- The mwseTimerController responsible for real-type timers.
---@type mwseTimerController
mwse.realTimers = nil

--- This function writes information to the MWSELog.txt file in the user's installation directory.
---|
---|The message accepts formatting and additional parameters matching string.format's usage.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/log.html).
---@type function
---@param message string
---@param arg2 variadic { optional = "after" }
function mwse.log(message, arg2) end

--- Pops a value of mwscript type "short" off of the stack.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/popShort.html).
---@type function
---@return number { optional = "after" }
function mwse.stack.popShort() end

--- Adds a string to mwse's string storage, and pushes a value of mwscript type "long" onto the stack that represents the string.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/pushString.html).
---@type function
---@param value string
function mwse.stack.pushString(value) end

--- Pops a value of mwscript type "float" off of the stack.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/popFloat.html).
---@type function
---@return number { optional = "after" }
function mwse.stack.popFloat() end

--- Pushes a value of mwscript type "long" onto the stack.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/pushLong.html).
---@type function
---@param value number
function mwse.stack.pushLong(value) end

--- Pops a value of mwscript type "long" off of the stack.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/popLong.html).
---@type function
---@return number { optional = "after" }
function mwse.stack.popLong() end

--- Returns the number of elements currently on the stack.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/size.html).
---@type function
---@return number
function mwse.stack.size() end

--- Pops a value of mwscript type "long" off of the stack, and tries to reinterpret as a string.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/popString.html).
---@type function
---@return string { optional = "after" }
function mwse.stack.popString() end

--- Prints all values on the stack in hex format to the log file.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/dump.html).
---@type function
function mwse.stack.dump() end

--- Pops a value of mwscript type "long" off of the stack, and tries to reinterpret as a game object.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/popObject.html).
---@type function
---@return tes3baseObject { optional = "after" }
function mwse.stack.popObject() end

--- Pushes a value of mwscript type "float" onto the stack.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/pushFloat.html).
---@type function
---@param value number
function mwse.stack.pushFloat(value) end

--- Purges all elements from the stack.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/clear.html).
---@type function
function mwse.stack.clear() end

--- Determines if the stack is empty.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/empty.html).
---@type function
---@return boolean
function mwse.stack.empty() end

--- Pushes a value of mwscript type "long" onto the stack, which matches the address of a given game object.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/pushObject.html).
---@type function
---@param value tes3baseObject
function mwse.stack.pushObject(value) end

--- Pushes a value of mwscript type "short" onto the stack.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/stack/pushShort.html).
---@type function
---@param value number
function mwse.stack.pushShort(value) end

--- Equivalent to mwse.version.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/getVersion.html).
---@type function
---@return number
function mwse.getVersion() end

--- Saves a config table to Data Files\MWSE\config\{fileName}.json.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/mwse/saveConfig.html).
---@type function
---@param fileName string
---@param object any
---@param config table { optional = "after" }
---@return table
function mwse.saveConfig(fileName, object, config) end


