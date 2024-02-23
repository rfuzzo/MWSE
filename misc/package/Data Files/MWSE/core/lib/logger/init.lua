--[[ # Logger 

Based on the `mwseLogger` made by Merlord.

Current version made by herbert100.
]]

local colors = require("herbert100.logger.colors")

local sf = string.format

local loggerMetatable = {
    -- make new loggers by calling `Logger`
    __tostring = function(self) return "Logger" end
}



local function getActiveModInfo(offset)
    local src = debug.getinfo(3 + (offset or 0), "S").source
    if not src then return end
    
    local parts = src:split("\\/")
    table.remove(parts, 1) -- first part will be "@^"
    local luaParts = {} -- without "Data Files"/"MWSE"/"mods"/
    for i=4, #parts do
        luaParts[i-3] = parts[i]
    end
    local info = {
        parts = parts, 
        luaParts = luaParts, 
        filename = parts[#parts],
        lua_parent_name = parts[3],
        path = table.concat(parts, "\\"),
        lua_path = table.concat(luaParts, "\\"),
    }
    info.dir = info.path:sub(1, -#info.filename - 2) -- -1 because it's lua, then another -1 to kill the "\\"
    
    local metadata = tes3.getLuaModMetadata(luaParts[1] .. "." .. luaParts[2]) ---@type MWSE.Metadata?
    if metadata then
        info.dir_has_author_name = true
        -- table.remove(parts, 1)
    else
        metadata = tes3.getLuaModMetadata(parts[1])
        
    end
    if metadata then
        info.metadata = metadata
        info.dir_has_author_name = info.dir_has_author_name or false
    else
		local one_dir_up = info.dir:gsub("\\[^\\]+$", "")
        info.dir_has_author_name = not (lfs.fileexists(one_dir_up .. "\\main.lua") or lfs.fileexists(one_dir_up .. "\\init.lua"))
    end
    return info
end

---@alias mwseLogger.LEVEL
---|0                       NONE: Nothing will be printed
---|1                       ERROR: Error messages will be printed
---|2                       WARN: Warning messages will be printed
---|3                       INFO: Only crucial information will be printed
---|4                       DEBUG: Debug messages will be printed
---|5                       TRACE: Many debug messages will be printed


---@type table<string, mwseLogger[]>
local loggers = {}


--[[## Logger

### Creating a new `Logger`

To create a new logger for a mod with the specified `modName`, you can write one of the following four things:
1) `log = Logger("MODNAME")`
2) `log = Logger{modName="MODNAME", level=LEVEL?, ...}`
3) `log = Logger.new("MODNAME")`
4) `log = Logger.new{modName="MODNAME", level=LEVEL?, ...}`

tring representing a numerical code (ie "NONE", "PROBLEMS", ..., "TRACE")

### Writing log messages

- you can log things by writing `log:info`, `log:warn`, `log:error`, `log:debug`, etc.
- additionally, you can write debug messages by typing `log(str)`

**Passing multiple parameters:**
If multiple parameters are passed, then `string.format` will be called on the first parameter. You have two options for formatting strings:
1) pass the formatting options as regular arguments.
    - e.g., `log:trace("The %s today is %i %s", "weather", 20, "degrees")`
    - So, `log:trace(s, ...)` and `log:trace(string.format(s, ...))` will print the same things.
    - the only difference is that in the first case, `string.format` will be called AFTER the `log.level` is checked.
2) pass the formatting options as a `function`.
    - e.g., `log:trace("The %s today is %i, %s", function() return "weather", 20, "degrees" end)
    - So, `log:trace(s, func)` and `log:trace(string.format(s, func() )) will print the same things.
    - The key difference is that both `string.format` AND `func` will only be called after the `log.level` is checked.
    - This could be very nice for performance reasons, if you're printing complicated debugging messages.


**Passing a single parameter:**
If only a single parameter is passed, `string.format` will NOT be called. This is to avoid unexpected errors from writing strings 
that inadvertently contain formatting specifiers.



### Updating the `log.level`

Once a `log` has been created, the log level can be changed by using the `log:setLevel(Logger.LEVEL)` method.
You can specify a string or number.
e.g. to set the `log.level` to "DEBUG", you can write any of the following:
1) `log:setLevel("DEBUG")`
2) `log:setLevel(2)`
3) `log:setLevel(Logger.LEVEL.DEBUG)`

### Accessing the `log.level`

The current logging level can be accessed by writing `log.level` or `#log`.

The `log.level` is stored internally as an `integer`, so that you can easily check to see if the `log.level` is above a certain value.
The log levels are:
NONE = 0
ERROR = 1
WARN = 2
INFO = 3
DEBUG = 4
TRACE = 5

So, to check if the logging level is "DEBUG" or higher, you can write
- `#log >= 4`

Additionally, you can write
- `log >= 4`

**NOTE:** The `log` **must** be on the `>=` side of the comparison if using this syntax. Writing `log <= 4` will result in an error. 
]]
---@class mwseLogger
---@field modName string the name of the mod this logger is for
---@field level mwseLogger.LEVEL
---@field moduleName string? the module this logger belongs to, or `nil` if it's a general purpose logger
---@field useColors boolean should colors be used when writing log statements? Default: `false`
---@field writeToFile boolean if true, we will write the log contents to a file with the same name as this mod.
---@field includeTimestamp boolean should the current time be printed when writing log messages? Default: `false`
---@field file file*? the file the log is being written to, if `writeToFile == true`, otherwise its nil.
---@field LEVEL table<mwseLogger.LEVEL_STRING, mwseLogger.LEVEL>
local Logger = {
    LEVEL = {
        NONE = 0,
        ERROR = 1,
        WARN = 2,
        INFO = 3,
        DEBUG = 4,
        TRACE = 5
    }
}
setmetatable(Logger, loggerMetatable)


---|`Logger.LEVEL.NONE`     Nothing will be printed
---|`Logger.LEVEL.ERROR`    Error messages will be printed
---|`Logger.LEVEL.WARN`     Warning messages will be printed
---|`Logger.LEVEL.INFO`     Crucial information will be printed
---|`Logger.LEVEL.DEBUG`    Debug messages will be printed
---|`Logger.LEVEL.TRACE`    Many debug messages will be printed




---@alias mwseLogger.LEVEL_STRING
---|"NONE"      Nothing will be printed
---|"ERROR"     Error messages will be printed
---|"WARN"      Warning messages will be printed
---|"INFO"      Crucial information will be printed
---|"DEBUG"     Debug messages will be printed
---|"TRACE"     Many debug messages will be printed


-- metatable used by log objects
local log_metatable = {
    __call = function(self, ...) self:debug(...) end, -- redefined later 
    __index = Logger,
    __tostring = function(self)
        if self.moduleName then 
            return sf(
                "Logger(modName=\"%s\", moduleName=\"%s\", level=%i, levelStr=%s)",
                self.modName, self.moduleName, self.level, table.find(Logger.LEVEL, self.level)
            )
        else
            return sf(
                    "Logger(modName=\"%s\", level=%i, levelStr=%s)",
                    self.modName, self.level, table.find(Logger.LEVEL, self.level)
                )
        end
    end,
}

local function getModAndModuleNames(modName)
    local actualModName, moduleName
    local index = modName:find("/")
    if index then
        actualModName = modName:sub(1,index-1)
        moduleName = modName:sub(index+1)
    else
        actualModName = modName
    end
    return actualModName, moduleName
end

---@return string? modName, string? moduleName
local function getModInfoFromSource()
    local info = getActiveModInfo(1)
    if not info then return end

    local modName, moduleName
    if info.metadata then
        local package = info.metadata.package
        modName = package.name 
    end

    local s, e = 2, #info.luaParts
    if info.dir_has_author_name then
        s = 3
        modName = modName or info.luaParts[2]
    else
        modName = modName or info.luaParts[1]
    end
    local last_part = info.parts[#info.parts]
    if last_part == "main.lua" or last_part == "init.lua" then
        e = e - 1
    else
        info.luaParts[e] = last_part:sub(1,-5) -- remove the ".lua" 
    end
    local module_parts = {}
    for i=s, e do
        table.insert(module_parts, info.luaParts[i])
    end
    if next(module_parts) ~= nil then
        moduleName = table.concat(module_parts, "/")
    end
    return modName, moduleName
end


---@class mwseLogger.newParams
---@field modName string? the name of the mod this logger is for
---@field level mwseLogger.LEVEL|mwseLogger.LEVEL_STRING|nil the log level to set this object to. Default: "INFO"
---@field moduleName string? the module this logger belongs to, or `nil` if it's a general purpose logger
---@field useColors boolean? should colors be used when writing log statements? Default: `false`
---@field includeTimestamp boolean? should the current time be printed when writing log messages? Default: `false`
---@field writeToFile string|boolean|nil whether to write the log messages to a file, or the name of the file to write to. if `false` or `nil`, messages will be written to `MWSE.log`


--[[##Create a new logger for a mod with the specified `modName`. 

New objects can be created in the following ways:
- `log = Logger("MODNAME")`
- `log = Logger{modName="MODNAME", level=LEVEL?, ...}`
- `log = Logger.new("MODNAME")`
- `log = Logger.new{modName="MODNAME", level=LEVEL?, ...}`

In addition to `modName`, you may specify
- `useColors`: whether to use colors when printing log messages.
- `level`: the logging level to start this logger at. This is the same as making a new logger and then calling `log:setLevel(level)`
- `writeToFile`: either a boolean saying we should write to a file, or the name of a file to write to. If false (the default), then log messages will be written to `MWSE.log`
]]
---@param params mwseLogger.newParams|string?
---@return mwseLogger
function Logger.new(params)
    -- if it's just a string, treat it as the `modName`
    if not params then
        params = {}
    elseif type(params) == "string" then
        params = {modName=params} 
    end
    local modName, moduleName = params.modName, params.moduleName
    -- do some error checking to make sure `params` are correct
    if not modName then
        modName, moduleName = getModInfoFromSource()
    end
    assert(modName ~= nil, "Error: Could not create a Logger because modName was nil.")
    assert(type(modName) == "string", "Error: Could not create a Logger. modName must be a string.")

    if moduleName == nil then
        modName, moduleName = getModAndModuleNames(modName)
    end

    local log ---@type mwseLogger?

    -- first try to get it
    log = Logger.get(modName, moduleName)

    if log then return log end

    -- now we know the log doesn't exist

    log = {
        modName = modName,
        moduleName = moduleName,
        useColors=params.useColors or false,
        writeToFile = params.writeToFile or false,
        level = Logger.LEVEL.INFO, -- we'll set it with the dedicated function so we can do fancy stuff
        includeTimestamp = params.includeTimestamp or false,
    }

    
    -- if there are already loggers with this `modName`, get the most recent one, and then
    -- update this new loggers values to those of the most recent logger. (if those values weren't specified in `params`)
    if loggers[modName] and #loggers[modName] > 0 then
        local parent = loggers[modName][#loggers[modName]]
        for _, k in ipairs{"useColors", "writeToFile", "includeTimestamp"} do
            if params[k] == nil then
                log[k] = parent[k]
            end
        end
        -- set the default value to the parent log level, we will call `setLevel` later
        -- this will do the the following:
        -- if `params.level` was invalid, nothing will happen and `parent.level` will be used.
        -- if `params.level` was valid, then every logger registered to this mod will be updated.
        log.level = parent.level
    else
        -- this is the first logger with this `modName`, so we should intialize the array
        loggers[modName] = {}
    end

    table.insert(loggers[modName], log)

    setmetatable(log, log_metatable)
    log:setLevel(params.level)

    if params.writeToFile == nil then
        log:setWriteToFile(log.writeToFile, true)
    else
        log:setWriteToFile(params.writeToFile)
    end


    return log
end



---@param writeToFile string|boolean
---@param onlyThisLogger boolean? should we only update this logger? Default: false
function Logger:setWriteToFile(writeToFile, onlyThisLogger)
    if writeToFile == nil then return end

    local _loggers = onlyThisLogger and {self} or loggers[self.modName]

    if writeToFile == false then
        for _, log in ipairs(_loggers) do
            if log.file then
                log.file:close()
                log.file = nil
            end
            log.writeToFile = false
        end
        return
    end

    for _, log in ipairs(_loggers) do
        local filename
        if writeToFile == true then
            if log.moduleName then
                filename = sf("%s\\%s.log",log.modName,log.moduleName)
            else
                filename = log.modName .. ".log"
            end
        else
            filename = writeToFile
        end
        if log.file then
            log.file:close()
        end
        log.file = io.open(filename, "w")
        log.writeToFile = true
    end
end




local COLORS = {
	NONE =  "white",
	WARN =  "bright yellow",
	ERROR =  "bright red",
	INFO =  "white",
    DEBUG = "bright green",
    TRACE =  "bright white",
}

--[[Get a previously registered logger with the specified `modName`.

**Note:** Calling `Logger.new(modName)` will also return a previously registered logger if it exists.
The difference between `.get` and `.new` is that if a logger does not exist, `.new` will create one, while `.get` will not.
]]
---@param modName string name of the mod
---@param moduleName string the name of the module
---@return mwseLogger? logger
function Logger.get(modName, moduleName)
    if moduleName == nil then
        modName, moduleName = getModAndModuleNames(modName)
    end
    if loggers[modName] then
        for _, log in ipairs(loggers[modName]) do
            if log.moduleName == moduleName then
                return log
            end
        end
    end
end


function Logger:getLevelStr()
    return table.find(Logger.LEVEL, self.level)
end

--- returns all the loggers associated with this modName (can pass a Logger as well)
function Logger.getLoggers(modNameOrLogger) 
    return type(modNameOrLogger) == "table"  and loggers[modNameOrLogger.modName]
        or loggers[modNameOrLogger] 
        or false
end

function Logger:makeChild(moduleName)
    return self.new{
        modName=self.modName,
        level=self.level,
        moduleName=moduleName,
        useColors=self.useColors,
        writeToFile=self.writeToFile,
        includeTimestamp=self.includeTimestamp
    }
end


local LOG_LEVEL = Logger.LEVEL



--[[Change the current logging level. You can specify a string or number.
e.g. to set the `log.level` to "DEBUG", you can write any of the following:
1) `log:setLevel("DEBUG")`
2) `log:setLevel(4)`
3) `log:setLevel(Logger.LEVEL.DEBUG)`
]]
---@param self mwseLogger
---@param level mwseLogger.LEVEL|mwseLogger.LEVEL_STRING
function Logger:setLevel(level)
    

    local lvl -- the actual level we should use, instead of a string or something
    if LOG_LEVEL[level] then
        lvl = LOG_LEVEL[level]

    elseif type(level) == "number" then 
        if LOG_LEVEL.NONE <= level and level <= LOG_LEVEL.TRACE then
            ---@diagnostic disable-next-line: assign-type-mismatch
            lvl = level
        end

    elseif type(level) == "string" then
        lvl = LOG_LEVEL[level:upper()]
    end

    if not lvl then return end

    for _, log in ipairs(loggers[self.modName]) do
        log.level = lvl
    end
end


---@param includeTimestamp boolean Whether logs should use timestamps
function Logger:setIncludeTimestamp(includeTimestamp)
    -- we need to know what to do
    if includeTimestamp then
        for _, log in ipairs(loggers[self.modName]) do
            log.includeTimestamp = includeTimestamp
        end
    end
end

--- for internal use only. it generates the header message that will be enclosed in square brackets when printing log messages.
function Logger:_makeHeader(logStr)
    local headerTbl = {}
    local lineno = debug.getinfo(4,"l").currentline
    if self.moduleName ~= nil then
        headerTbl[1] = sf("%s (%s): %i", self.modName, self.moduleName, lineno)
    else
        headerTbl[1] = sf("%s: %i", self.modName, lineno)
    end
    if self.useColors then
        -- e.g. turn "ERROR" into "ERROR" (but written in red)
        logStr = colors(sf("%%{%s}%s", COLORS[logStr], logStr))
    end
    headerTbl[#headerTbl+1] = logStr
    if self.includeTimestamp then
        local socket = require("socket")
        local timestamp = socket.gettime()
        local milliseconds = math.floor((timestamp % 1) * 1000)
        timestamp = math.floor(timestamp)

        -- convert timestamp to a table containing time components
        local timeTable = os.date("*t", timestamp)

        -- format time components into H:M:S:MS string
        local formattedTime = sf(": %02d:%02d:%02d.%03d", timeTable.hour, timeTable.min, timeTable.sec, milliseconds)
        headerTbl[#headerTbl+1] = formattedTime
    end
    return table.concat(headerTbl," ")
end

--- write to log. only used internally
---@param logStr mwseLogger.LEVEL_STRING
function Logger:write(logStr, ...)
    local s
    local n, header = select("#",...), self:_makeHeader(logStr)
    if n == 1 then
        s = sf("[%s] %s", header, ...)
    else
        local s1, s2 = ...
        if type(s1) == "function" then
            if n == 2 then
                s = sf( "[%s] %s", header, sf( s1(s2) ) )
            else
                s = sf( "[%s] %s", header, sf( s1(select(2, ...)) ) )
            end

        elseif type(s2) == "function" then
            if n == 2 then
                s = sf("[%s] %s", header, sf( s1, s2() ) )
            else
                s = sf( "[%s] %s", header, sf(s1, s2(select(3, ...))))
            end
        else
            s = sf("[%s] %s", header, sf(...) )
        end
    end

    
    if self.writeToFile ~= false then
        self.file:write(s .. "\n"); self.file:flush()
    else
       print(s)
    end
end





--[[ Write an error message, if the current `log.level` permits it. 

If one parameter is passed, that paramter will be printed normally.

**Passing multiple parameters:**
1) If you type `log:debug(str, ...)`, then the output will be the same as
```log:debug(string.format(str,...))```
2) If you type `log:debug(func, ...)`, then the output will be the same as 
```log:debug(func, ...) == log:debug(string.format(func(...)))```
3) If you type `log:debug(str, func, ...)` then the output will be the same as 
```log:debug(string.format(str, func(...) ))```

**Note:** there is an advantage to using this syntax: functions will be called _only_ if you're at the appropriate logging level. 
So, it's fine to pass functions that take a long time to compute. they will only be evaluated if the logging level is high enough.
]]
---@param ... any the strings to write the log
function Logger:error(...)
    if self.level >= LOG_LEVEL.ERROR then self:write("ERROR", ...) end
end


--[[ Write a warning message, if the current `log.level` permits it. 

If one parameter is passed, that paramter will be printed normally.

**Passing multiple parameters:**
1) If you type `log:debug(str, ...)`, then the output will be the same as
```log:debug(string.format(str,...))```
2) If you type `log:debug(func, ...)`, then the output will be the same as 
```log:debug(func, ...) == log:debug(string.format(func(...)))```
3) If you type `log:debug(str, func, ...)` then the output will be the same as 
```log:debug(string.format(str, func(...) ))```

**Note:** there is an advantage to using this syntax: functions will be called _only_ if you're at the appropriate logging level. 
So, it's fine to pass functions that take a long time to compute. they will only be evaluated if the logging level is high enough.
]]
---@param ... any the strings to write the log
function Logger:warn(...)
    if self.level >= LOG_LEVEL.WARN then self:write("WARN", ...) end
end

--[[ Write an info message, if the current `log.level` permits it. 

If one parameter is passed, that paramter will be printed normally.

**Passing multiple parameters:**
1) If you type `log:debug(str, ...)`, then the output will be the same as
```log:debug(string.format(str,...))```
2) If you type `log:debug(func, ...)`, then the output will be the same as 
```log:debug(func, ...) == log:debug(string.format(func(...)))```
3) If you type `log:debug(str, func, ...)` then the output will be the same as 
```log:debug(string.format(str, func(...) ))```

**Note:** there is an advantage to using this syntax: functions will be called _only_ if you're at the appropriate logging level. 
So, it's fine to pass functions that take a long time to compute. they will only be evaluated if the logging level is high enough.
]]
---@param ... any the strings to write the log
function Logger:info(...)
    if self.level >= LOG_LEVEL.INFO then self:write("INFO", ...) end
end


--[[ Write a debug message, if the current `log.level` permits it. 

If one parameter is passed, that paramter will be printed normally.

**Passing multiple parameters:**
1) If you type `log:debug(str, ...)`, then the output will be the same as
```log:debug(string.format(str,...))```
2) If you type `log:debug(func, ...)`, then the output will be the same as 
```log:debug(func, ...) == log:debug(string.format(func(...)))```
3) If you type `log:debug(str, func, ...)` then the output will be the same as 
```log:debug(string.format(str, func(...) ))```

**Note:** there is an advantage to using this syntax: functions will be called _only_ if you're at the appropriate logging level. 
So, it's fine to pass functions that take a long time to compute. they will only be evaluated if the logging level is high enough.
]]
---@param ... any the strings to write the log
function Logger:debug(...)
    if self.level >= LOG_LEVEL.DEBUG then self:write("DEBUG", ...) end
end

-- redefine it to make it behave consistently with `debug.getinfo`
log_metatable.__call = Logger.debug

--[[ Write a trace message, if the current `log.level` permits it. 

If one parameter is passed, that paramter will be printed normally.

**Passing multiple parameters:**
1) If you type `log:debug(str, ...)`, then the output will be the same as
```log:debug(string.format(str,...))```
2) If you type `log:debug(func, ...)`, then the output will be the same as 
```log:debug(func, ...) == log:debug(string.format(func(...)))```
3) If you type `log:debug(str, func, ...)` then the output will be the same as 
```log:debug(string.format(str, func(...) ))```

**Note:** there is an advantage to using this syntax: functions will be called _only_ if you're at the appropriate logging level. 
So, it's fine to pass functions that take a long time to compute. they will only be evaluated if the logging level is high enough.
]]
---@param ... any the strings to write the log
function Logger:trace(...)
    if self.level >= LOG_LEVEL.TRACE then self:write("TRACE", ...) end
end



return Logger ---@type mwseLogger