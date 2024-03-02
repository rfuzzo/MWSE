--[[ # Logger 

Based on the `mwseLogger` made by Merlord.

Current version made by herbert100.
]]

local colors = require("logger.colors")
local socket = require("socket")

local sf = string.format

local LoggerMetatable = {
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

local LOG_LEVEL = Logger.LEVEL
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
    -- gonna override this later so that it's exactly equal to `Logger.debug`. this is needed for line number stuff to work properly
    __call = function(self, ...) self:debug(...) end,
    __index = Logger,
    
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

    -- check if the user called "log:new" (i.e., if they called `new` on a logger object)
    elseif getmetatable(params) == logMetatable then
        -- so, let's combine the data from the given logger
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

    
    -- if there are already loggers with this `modName`, get the most recent one, and then
    -- update this new loggers values to those of the most recent logger. (if those values weren't specified in `params`)
    local loggerTbl = loggers[modName]
    if loggerTbl and #loggerTbl > 0 then
        local latest = loggerTbl[#loggerTbl]
        
        for k in pairs(communalKeys) do
            if params[k] == nil then
                log[k] = latest[k]
            end
        end
    else
        -- this is the first logger with this `modName`, so we should intialize the array
        loggerTbl = {}
        loggers[modName] = loggerTbl
    end


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


-- autogenerate methods to set communal keys. some of these will be overwritten later on.
-- the substring stuff is to to convert the first letter to uppercase, e.g. "level" -> "Level"
for k in pairs(communalKeys) do
    Logger["set" .. k:sub(1,1):upper() .. k:sub(2)] = function(self, v)
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
                log.file = nil
            end
            log.writeToFile = false
        end
        return
    end
    for _, log in ipairs(relevantLoggers) do
        local filename
        if writeToFile == true then
            if log.moduleName then
                filename = sf("Data Files\\MWSE\\mods\\%s\\%s.log",
                    log.modDir:gsub("%.", "\\"), 
                    log.moduleName:gsub("%.lua$", ""):gsub("%.", "\\")
                )
            else
                filename = "Data Files\\MWSE\\mods\\" .. log.modDir:gsub("%.", "\\") .. ".log"
            end
        else
            filename = writeToFile
        end
        -- close old file
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
    return LEVEL_STRINGS[self.level]
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

    if lvl then
        for _, logger in ipairs(loggers[self.modName]) do

            logger.level = lvl
        end
    end

end


---@param includeTimestamp boolean Whether logs should use timestamps
function Logger:setIncludeTimestamp(includeTimestamp)
    -- we need to know what to do
    if includeTimestamp ~= nil then
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


---@param args any[] arguments passed to Logger:debug, Logger:info, etc
---@param level Logger.LEVEL
---@param offset integer? for the line number to be accurate, this method assumes it's getting called 2 levels deep (i.e.). the offset adjusts this
---@return Logger.Record record
function Logger:makeRecord(args, level, offset)
    return {
        args = args, 
        level = level,
        timestamp = socket.gettime(),
        lineNumber = self.includeLineNumber and debug.getinfo(3 + (offset or 0), "l").currentline or nil
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
    if self.level < LOG_LEVEL.ERROR then return end

    if self.writeToFile and self.file then
        self.file:write(self:format(self:makeRecord({...}, LOG_LEVEL.ERROR)), "\n")
        self.file:flush()
    else
        print(self:format(self:makeRecord({...}, LOG_LEVEL.ERROR)))
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
    if self.level < LOG_LEVEL.WARN then return end
    
    if self.writeToFile and self.file then
        self.file:write(self:format(self:makeRecord({...}, LOG_LEVEL.WARN)), "\n")
        self.file:flush()

    else
        print(self:format(self:makeRecord({...}, LOG_LEVEL.WARN)))
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
    if self.level <  LOG_LEVEL.INFO then return end
    
    if self.writeToFile and self.file then
        self.file:write(self:format(self:makeRecord({...}, LOG_LEVEL.INFO)), "\n")
        self.file:flush()

    else
        print(self:format(self:makeRecord({...}, LOG_LEVEL.INFO)))
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
    if self.level < LOG_LEVEL.DEBUG then return end
    
    if self.writeToFile and self.file then

        self.file:write(self:format(self:makeRecord({...}, LOG_LEVEL.DEBUG)), "\n")
        self.file:flush()

    else

        print(self:format(self:makeRecord({...}, LOG_LEVEL.DEBUG)))
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
    if self.level < LOG_LEVEL.TRACE then return end
    
    if self.writeToFile and self.file then
        self.file:write(self:format(self:makeRecord({...}, LOG_LEVEL.TRACE)), "\n")
        self.file:flush()
    else

        print(self:format(self:makeRecord({...}, LOG_LEVEL.TRACE)))
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
        record = self:makeRecord({"Initialized version %s.", version}, LOG_LEVEL.INFO)
    else
        record = self:makeRecord({"Mod initialized."}, LOG_LEVEL.INFO)
    end
    print(self:format(record))
end

return Logger ---@type Logger