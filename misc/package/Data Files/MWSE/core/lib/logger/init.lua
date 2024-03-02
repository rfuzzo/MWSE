--[[ # Logger 

Based on the `mwseLogger` made by Merlord.

Current version made by herbert100.
]]

local colors = require("logger.colors")
local sf = string.format

local LoggerMetatable = {
    -- make new loggers by calling `Logger`
    __call=function (cls, ...) return cls.new(...) end, -- gonna override this later
    __tostring = function() return "Logger" end
}



---@alias Logger.LEVEL
---|0                       NONE: Nothing will be printed
---|1                       ERROR: Error messages will be printed
---|2                       WARN: Warning messages will be printed
---|3                       INFO: Only crucial information will be printed
---|4                       DEBUG: Debug messages will be printed
---|5                       TRACE: Many debug messages will be printed


---@type table<string, Logger[]>
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
---@class Logger
---@operator call (Logger.newParams?): Logger
---@field modName string the name of the mod this logger is for
---@field level Logger.LEVEL
---@field modDir string
---@field moduleName string? the module this logger belongs to, or `nil` if it's a general purpose logger
---@field useColors boolean should colors be used when writing log statements? Default: `false`
---@field writeToFile boolean if true, we will write the log contents to a file with the same name as this mod.
---@field includeTimestamp boolean? should the current time be printed when writing log messages? Default: `false`
---@field includeLineNumber boolean should the current time be printed when writing log messages? Default: `false`
---@field file file*? the file the log is being written to, if `writeToFile == true`, otherwise its nil.
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
setmetatable(Logger, LoggerMetatable)


local LEVEL_STRINGS = table.invert(Logger.LEVEL)

---|`Logger.LEVEL.NONE`     Nothing will be printed
---|`Logger.LEVEL.ERROR`    Error messages will be printed
---|`Logger.LEVEL.WARN`     Warning messages will be printed
---|`Logger.LEVEL.INFO`     Crucial information will be printed
---|`Logger.LEVEL.DEBUG`    Debug messages will be printed
---|`Logger.LEVEL.TRACE`    Many debug messages will be printed




---@alias Logger.LEVEL_STRING
---|"NONE"      Nothing will be printed
---|"ERROR"     Error messages will be printed
---|"WARN"      Warning messages will be printed
---|"INFO"      Crucial information will be printed
---|"DEBUG"     Debug messages will be printed
---|"TRACE"     Many debug messages will be printed


local communalKeys = {
    modName = true,
    modDir = true,
    -- moduleName = false,
    includeLineNumber = true,
    useColors = true,
    writeToFile = true,
    level = true,
    includeTimestamp = true,
}
-- metatable used by log objects
local logMetatable = {
    __call = function(self, ...) self:debug(...) end,
    __lt = function(num, self) return num < self.level end,
    __le = function(num, self) return num <= self.level end,
    __len = function(self) return self.level end,
    __index = Logger,
    ---@param self Logger
    ---@param str string
    __concat = function(self, str)
        return self:makeChild(str)
    end,
    __tostring = function(self)
        return sf("Logger(modName=%q, moduleName=%s, modDir=%q, level=%i (%s))",
            self.modName, self.moduleName and sf("%q", self.moduleName), self.modDir, self.level, self:getLevelStr()
        )
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


---@return string? modName, string? moduleName, string? modDir
local function getModInfoFromSource()

    -- =========================================================================
    -- generate relevant mod information
    -- =========================================================================

    local src = debug.getinfo(3, "S").source
    if not src then return end
    -- parts of the path without "@^\Data Files\MWSE\mods\"
    local luaParts = table.filterarray(src:split("\\/"), function (i) return i >= 5 end)
    
    local hasAuthorName = false

    ---@type MWSE.Metadata?
    local metadata = tes3.getLuaModMetadata(luaParts[1] .. "." .. luaParts[2])
    if metadata then
        hasAuthorName = true
    else
        metadata = tes3.getLuaModMetadata(luaParts[1])
    end
    if metadata then
        hasAuthorName = hasAuthorName or false
    else
        local oneDirUp = table.concat({"Data Files", "MWSE", "mods", luaParts[1]}, "\\")
        hasAuthorName = not (lfs.fileexists(oneDirUp .. "\\main.lua") or lfs.fileexists(oneDirUp .. "\\init.lua"))
        
    end


    -- =========================================================================
    -- use mod information to generate logger fields
    -- =========================================================================

    -- `modName` and `moduleName` don't want the author folder, but `modDir `does.
    local modName, moduleName, modDir
    if metadata then
        local package = metadata.package ---@diagnostic disable-next-line: undefined-field
        modName = package.shortName or package.shortName or package.name 
    end

    -- actual mod information starts at index 2 if there's an author name
    local cutoff = hasAuthorName and 2 or 1

    -- if the module name doesn't exist, use the mod folder name (excluding the author name)
    modName = modName or luaParts[cutoff]
    --[[ generate module name by combining everything together, ignoring the mod root.
        examples: 
            "herbert100/more quickloot/common.lua" ~> `moduleName = "common.lua"`
            "herbert100/more quickloot/managers/organic.lua" ~> `moduleName = "managers/organic.lua"`
    ]]
    moduleName = table.concat(table.filterarray(luaParts, function(i) return i > cutoff end), "/")
    if hasAuthorName then
        -- e.g. modDir = "herbert100.more quickloot"
        modDir = luaParts[1] .. "." .. luaParts[2]
    else
        -- e.g. modDir = "Expeditious Exit"
        modDir = luaParts[1]
    end
    return modName, moduleName, modDir
end


---@class Logger.newParams
---@field modName string? the name of the mod this logger is for
---@field modDir string? the name of the mod this logger is for
---@field level Logger.LEVEL|Logger.LEVEL_STRING|nil the log level to set this object to. Default: "INFO"
---@field moduleName string? the module this logger belongs to, or `nil` if it's a general purpose logger
---@field useColors boolean? should colors be used when writing log statements? Default: `false`
---@field includeLineNumber boolean? should the current line be printed when writing log messages? Default: `true`
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
---@param params Logger.newParams|string?
---@return Logger
function Logger.new(params, params2)
    -- if it's just a string, treat it as the `modName`
    if not params then
        params = {}
    elseif type(params) == "string" then
        params = {modName=params} 

    -- check if the user typed "Logger:new" instead of "Logger.new"
    elseif params == Logger then
        params = params2 or {}
        -- mwse.log("new was called on logger. making params = %s", inspect(params))

    -- check if the user called "log:new" (i.e., if they called `new` on a logger object)
    elseif getmetatable(params) == logMetatable then
        -- so, let's combine the data from the given logger
        -- mwse.log("logger made with logmetatable!")
        params2 = params2 or {} -- make sure `params2` exists
        table.copymissing(params2, params) -- copy over the stuff
        params = params2 -- rest of the code only cares about `params`
    end

    local modName, moduleName = params.modName, params.moduleName
    -- do some error checking to make sure `params` are correct
    
    
    local srcModName, srcModuleName, srcModDir = getModInfoFromSource()

    local modDir = params.modDir or srcModDir
    
    if modName then
        if not moduleName then
            modName, moduleName = getModAndModuleNames(modName)
        end
    else
        modName = srcModName
    end
    moduleName = moduleName or srcModuleName

    assert(modName ~= nil, "Error: Could not create a Logger because modName was nil.")
    assert(type(modName) == "string", "Error: Could not create a Logger. modName must be a string.")

    if not modDir then
        modDir = modName
        -- who logs the logger?
        mwse.log("[Logger: ERROR] modDir for %q (module %q) was nil! this isn't supposed to happen!!", modName, moduleName)
    end

    -- first try to get it
    local log = Logger.get(modName, moduleName)

    if log then return log end

    -- now we know the log doesn't exist

    log = {
        modName = modName,
        modDir = modDir,
        moduleName = moduleName,
        includeLineNumber = true,
        useColors=params.useColors or false,
        writeToFile = params.writeToFile or false,
        level = Logger.LEVEL.INFO, -- we'll set it with the dedicated function so we can do fancy stuff
        includeTimestamp = params.includeTimestamp or false,
    }

    -- mwse.log("making new log = %s", inspect(log))
    
    -- if there are already loggers with this `modName`, get the most recent one, and then
    -- update this new loggers values to those of the most recent logger. (if those values weren't specified in `params`)
    local loggerTbl = loggers[modName]
    if loggerTbl and #loggerTbl > 0 then
        -- mwse.log("logger tbl for %q is %s", modName, inspect(loggerTbl, {depth=2}))
        local latest = loggerTbl[#loggerTbl]
        -- mwse.log("latest logger is %s", inspect(latest, {depth=1}))
        
        for k in pairs(communalKeys) do
            if params[k] == nil then
                -- mwse.log("setting Logger(%s (%s))[%q] = %s", modName, moduleName, k, latest[k])
                log[k] = latest[k]
            end
        end
    else
        -- this is the first logger with this `modName`, so we should intialize the array
        loggerTbl = {}
        loggers[modName] = loggerTbl
    end

    -- mwse.log("updated log. it's now %s", inspect(log))

    table.insert(loggerTbl, log)

    setmetatable(log, logMetatable)
    -- this will update the logging level of all other registered loggers, but only if `params.level` exists and is valid 
    log:setLevel(params.level)

    if params.writeToFile == nil then
        log:setWriteToFile(log.writeToFile, true)
    else
        log:setWriteToFile(params.writeToFile)
    end


    return log
end

LoggerMetatable.__call = Logger.new

-- failsafe
for k in pairs(communalKeys) do
    Logger["set_" .. k] = function(self, v)
        for _, logger in ipairs(loggers[self.modName]) do
            logger[k] = v
        end
    end
end

---@param writeToFile string|boolean
---@param onlyThisLogger boolean? should we only update this logger? Default: false
function Logger:setWriteToFile(writeToFile, onlyThisLogger)
    if writeToFile == nil then return end

    local relevantLoggers = onlyThisLogger and {self} or loggers[self.modName]

    if not writeToFile then
        for _, log in ipairs(relevantLoggers) do
            if log.file then 
                log.file:close()
                rawset(log, "file", nil)
            end
            rawset(log, "writeToFile", false)
        end
        return
    end
    for _, log in ipairs(relevantLoggers) do
        local filename
        if writeToFile == true then
            if log.moduleName then
                filename = sf("%s\\%s.log",log.modDir, log.moduleName)
            else
                filename = log.modDir .. ".log"
            end
        else
            filename = writeToFile
        end
        -- close old file
        if log.file then
            log.file:close()
        end
       rawset(log, "file", io.open(filename, "w"))
       rawset(log, "writeToFile", true)
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

--[[Get a previously registered logger with the specified `modDir`.]]
---@param modDir string name of the mod
---@param moduleName string the name of the module
---@return Logger? logger
function Logger.getByDir(modDir, moduleName)
    local loggerTbl

    for _, loggersByModName in pairs(loggers) do
        if loggersByModName[1].modDir == modDir then
            loggerTbl = loggersByModName
            break
        end
    end

    if not loggerTbl then return end

    if not moduleName then 
        return loggerTbl[1]
    end

    for _, log in ipairs(loggerTbl) do
        if log.moduleName == moduleName then
            return log
        end
    end
end

-- get a specified logger. If `moduleName` evaluates to `false`, then any logger with a matching `modName` will be returned (if such a logger exists).
    -- if `moduleName` does not evaluate to `false`, then this function will only return a logger if it can find one that matches the `modName` and the `moduleName`.
---@param modName string name of the mod
---@param moduleName string? the name of the module
---@return Logger? logger
function Logger.get(modName, moduleName)
    local loggerTbl = loggers[modName]
    if not loggerTbl then 
        return 
    end
    if not moduleName then 
        return loggerTbl[1]
    end

    for _, log in ipairs(loggerTbl) do
        if log.moduleName == moduleName then
            return log
        end
    end
end


function Logger:getLevelStr()
    return table.find(Logger.LEVEL, self.level)
end

--- returns all the loggers associated with this modName (can pass a Logger as well)
function Logger.getLoggers(modName) 
    return loggers[modName]
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


local LOGLEVEL = Logger.LEVEL



--[[Change the current logging level. You can specify a string or number.
e.g. to set the `log.level` to "DEBUG", you can write any of the following:
1) `log:setLevel("DEBUG")`
2) `log:setLevel(4)`
3) `log:setLevel(Logger.LEVEL.DEBUG)`
]]
---@param self Logger
---@param level Logger.LEVEL|Logger.LEVEL_STRING
function Logger:setLevel(level)
    

    local lvl -- the actual level we should use, instead of a string or something
    if LOGLEVEL[level] then
        lvl = LOGLEVEL[level]

    elseif type(level) == "number" then 
        if LOGLEVEL.NONE <= level and level <= LOGLEVEL.TRACE then
            ---@diagnostic disable-next-line: assign-type-mismatch
            lvl = level
        end
    elseif type(level) == "string" then
        lvl = LOGLEVEL[level:upper()]
    end
    if lvl then 
        for _, logger in ipairs(loggers[self.modName]) do
            -- mwse.log("setting Logger(%s (%s)).level = %s", logger.modName, logger.moduleName, lvl)

            logger.level = lvl
        end
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


---@class Logger.Record
---@field args any[] arguments passed to Logger:debug, Logger:info, etc
---@field level Logger.LEVEL logging level
---@field lineNumber integer? the line number, if enabled for this logger
---@field timestamp number the timestamp of this message

local socket = require("socket")

---@param args any[] arguments passed to Logger:debug, Logger:info, etc
---@param level Logger.LEVEL
---@param offset integer? for the line number to be accurate, this method assumes it's getting called 2 levels deep (i.e.). the offset adjusts this
---@return Logger.Record record
function Logger:makeRecord(args, level, offset)
    return {
        args = args, 
        level = level,
        timestamp = socket.gettime(),
        lineNumber = debug.getinfo(3 + (offset or 0), "l").currentline
    }
end


---@param record Logger.Record
---@return string
function Logger:makeHeader(record)
    -- we're going to shove various things into here, and then making the string via
    -- `table.concat(headerT, " | ")
    local headerT = {}

    if record.lineNumber then
        if self.moduleName then
            headerT = {self.modName, sf("%s:%i", self.moduleName, record.lineNumber)}
        else
            headerT = {sf("%s:%i", self.modName, record.lineNumber)}
        end
    else
        headerT = {self.modName, self.moduleName}

    end
    local levelStr = LEVEL_STRINGS[record.level]
    if self.useColors then
        -- e.g. turn "ERROR" into "ERROR" (but written in red)
        levelStr = colors(sf("%%{%s}%s", COLORS[levelStr], levelStr))
    end
    table.insert(headerT, levelStr)

    if self.includeTimestamp then
        local timestamp = record.timestamp
        local milliseconds = math.floor((timestamp % 1) * 1000)
        timestamp = math.floor(timestamp)

        -- convert timestamp to a table containing time components
        local timeTable = os.date("*t", timestamp)

        -- format time components into H:M:S:MS string
        local formattedTime = sf("%02d:%02d:%02d.%03d", timeTable.hour, timeTable.min, timeTable.sec, milliseconds)
        table.insert(headerT, formattedTime)
    end
    return table.concat(headerT, " | ")
end

-- default formatter. can be overridden by users
---@param record Logger.Record
---@return string
function Logger:format(record)
    local header = self:makeHeader(record)

    local logMsg
    local args = record.args
    local n = #args
    if n == 1 then
        logMsg = args[1]
    else
        local s1, s2 = args[1], args[2]
        if type(s1) == "function" then
            if n == 2 then
                logMsg = sf(s1(s2))
            else
                logMsg = sf(s1(table.unpack(args, 2)))
            end

        elseif type(s2) == "function" then
            if n == 2 then
                logMsg = sf( s1, s2())
            else
                logMsg =  sf(s1, s2(table.unpack(args, 3)))

                -- the commented out code works, but comes with a performance hit
                -- and (at the moment) i don't think it's worth it

                -- local params = debug.getinfo(s2, "u").nparams
                -- need to offset by 2 because `s1` and `s2` are counted in `n`
                -- if n - 2 > params then
                    -- pass arguments `3, ..., (3 + params - 1)` to `s2`
                    -- then pass the remaining arugments `(3 + params), ...` to `sf`
                    -- s = sf( "[%s] %s", header, sf( s1, s2(select(3, ...)), select(3 + params, ...) ) )
                -- else
                    -- pass all arguments to `s2`
                    -- this has to be done separately to allow `s2` to return multiple values
                    -- s = sf( "[%s] %s", header, sf(s1, s2(select(3, ...))))
                -- end
            end
        else
            logMsg = sf(table.unpack(args))
        end
    end
    return sf("[%s] %s", header, logMsg)


    
    -- if self.writeToFile ~= false then
    --     self.file:write(s .. "\n"); self.file:flush()
    -- else
    --    print(s)
    -- end
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

**Note:** there is an advantage to using this syntax: functions will be called Only_ if you're at the appropriate logging level. 
So, it's fine to pass functions that take a long time to compute. they will only be evaluated if the logging level is high enough.
]]
---@param ... any the strings to write the log
function Logger:error(...)
    if self.level < LOGLEVEL.ERROR then return end

    if self.file then
        self.file:write(self:format(self:makeRecord({...}, LOGLEVEL.ERROR)))
    else
        print(self:format(self:makeRecord({...}, LOGLEVEL.ERROR)))
    end
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

**Note:** there is an advantage to using this syntax: functions will be called Only_ if you're at the appropriate logging level. 
So, it's fine to pass functions that take a long time to compute. they will only be evaluated if the logging level is high enough.
]]
---@param ... any the strings to write the log
function Logger:warn(...)
    if self.level < LOGLEVEL.WARN then return end
    
    if self.file then
        self.file:write(self:format(self:makeRecord({...}, LOGLEVEL.WARN)))
    else
        print(self:format(self:makeRecord({...}, LOGLEVEL.WARN)))
    end
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

**Note:** there is an advantage to using this syntax: functions will be called Only_ if you're at the appropriate logging level. 
So, it's fine to pass functions that take a long time to compute. they will only be evaluated if the logging level is high enough.
]]
---@param ... any the strings to write the log
function Logger:info(...)
    if self.level <  LOGLEVEL.INFO then return end
    
    if self.file then
        self.file:write(self:format(self:makeRecord({...}, LOGLEVEL.INFO)))
    else
        print(self:format(self:makeRecord({...}, LOGLEVEL.INFO)))
    end
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

**Note:** there is an advantage to using this syntax: functions will be called Only_ if you're at the appropriate logging level. 
So, it's fine to pass functions that take a long time to compute. they will only be evaluated if the logging level is high enough.
]]
---@param ... any the strings to write the log
function Logger:debug(...)
    if self.level < LOGLEVEL.DEBUG then return end
    
    if self.file then
        self.file:write(self:format(self:makeRecord({...}, LOGLEVEL.DEBUG)))
    else
        print(self:format(self:makeRecord({...}, LOGLEVEL.DEBUG)))
    end
end

logMetatable.__call = Logger.debug

--[[ Write a trace message, if the current `log.level` permits it. 

If one parameter is passed, that paramter will be printed normally.

**Passing multiple parameters:**
1) If you type `log:debug(str, ...)`, then the output will be the same as
```log:debug(string.format(str,...))```
2) If you type `log:debug(func, ...)`, then the output will be the same as 
```log:debug(func, ...) == log:debug(string.format(func(...)))```
3) If you type `log:debug(str, func, ...)` then the output will be the same as 
```log:debug(string.format(str, func(...) ))```

**Note:** there is an advantage to using this syntax: functions will be called Only_ if you're at the appropriate logging level. 
So, it's fine to pass functions that take a long time to compute. they will only be evaluated if the logging level is high enough.
]]
---@param ... any the strings to write the log
function Logger:trace(...)
    if self.level < LOGLEVEL.TRACE then return end
    
    if self.file then
        self.file:write(self:format(self:makeRecord({...}, LOGLEVEL.TRACE)))
    else
        print(self:format(self:makeRecord({...}, LOGLEVEL.TRACE)))
    end
end


function Logger:writeInitMessage(version)
    if self.level < Logger.LEVEL.INFO then return end

    if not version then
        local metadata = tes3.getLuaModMetadata(self.modDir)
        if metadata then
            version = metadata.package.version
        end
    end
    -- need to do it this way so the call to `debug.getinfo` lines up. super hacky :/
    local record
    if version then
        record = self:makeRecord({"Initialized version %s.", version}, LOGLEVEL.INFO)
    else
        record = self:makeRecord({"Mod initialized."}, LOGLEVEL.INFO)
    end
    print(self:format(record))
end

return Logger ---@type Logger