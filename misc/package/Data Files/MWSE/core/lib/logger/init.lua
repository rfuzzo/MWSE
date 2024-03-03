--[[ # Logger 

Based on the `mwseLogger` made by Merlord.

Current version made by herbert100.
]]

local colors = require("logger.colors")
local socket = require("socket")
local fmt = string.format

---@alias Logger.LEVEL
---|0                       NONE: Nothing will be printed
---|1                       ERROR: Error messages will be printed
---|2                       WARN: Warning messages will be printed
---|3                       INFO: Only crucial information will be printed
---|4                       DEBUG: Debug messages will be printed
---|5                       TRACE: Many debug messages will be printed
---|`Logger.LEVEL.NONE`     Nothing will be printed
---|`Logger.LEVEL.ERROR`    Error messages will be printed
---|`Logger.LEVEL.WARN`     Warning messages will be printed
---|`Logger.LEVEL.INFO`     Crucial information will be printed
---|`Logger.LEVEL.DEBUG`    Debug messages will be printed
---|`Logger.LEVEL.TRACE`    Many debug messages will be printed


---@class Logger.Record
---@field msg string|any|fun(...):... arguments passed to Logger:debug, Logger:info, etc
---@field args any[] arguments passed to Logger:debug, Logger:info, etc
---@field level Logger.LEVEL logging level
---@field lineNumber integer? the line number, if enabled for this logger
---@field timestamp number? the timestamp of this message


---@class Logger.newParams
---@field modName string? the name of the mod this logger is for
---@field modDir string? the name of the mod this logger is for
---@field level Logger.LEVEL? the log level to set this object to. Default: "LEVEL.INFO"
---@field moduleName string? the module this logger belongs to, or `nil` if it's a general purpose logger
---@field includeLineNumber boolean? should the current line be printed when writing log messages? Default: `true`
---@field includeTimestamp boolean? should the current time be printed when writing log messages? Default: `false`
---@field writeToFile string|boolean|nil whether to write the log messages to a file, or the name of the file to write to. if `false` or `nil`, messages will be written to `MWSE.log`


---@class Logger
---@operator call (Logger.newParams?): Logger
---@field modName string the name of the mod this logger is for
---@field level Logger.LEVEL
---@field filePath string the relative path to the file this logger was defined in.
---@field modDir string
---@field moduleName string? the module this logger belongs to, or `nil` if it's a general purpose logger
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
setmetatable(Logger, { __tostring = function() return "Logger" end })

local LOG_LEVEL = Logger.LEVEL
local LEVEL_STRINGS = table.invert(Logger.LEVEL)

local COLORS = {
	NONE =  "white",
	WARN =  "bright yellow",
	ERROR =  "bright red",
	INFO =  "white",
    DEBUG = "bright green",
    TRACE =  "bright white",
}

---@type table<string, Logger[]>
local loggers = {}

local communalKeys = {
    modName = true,
    modDir = true,
    includeLineNumber = true,
    writeToFile = true,
    level = true,
    includeTimestamp = true,
}

-- metatable used by log objects
local logMetatable = {
    -- gonna override this later so that it's exactly equal to `Logger.debug`. this is needed for line number stuff to work properly
    __call = function(self, ...) self:debug(...) end,
    __index = Logger,
    __newindex = function(self, k, v)
        if k == "logLevel" then
            self:setLogLevel(v)
        else
            rawset(self, k, v)
        end
    end,
    
    __tostring = function(self)
        return fmt("Logger(modName=%q, moduleName=%s, modDir=%q, level=%i (%s))",
            self.modName, self.moduleName and fmt("%q", self.moduleName), self.modDir, self.level, self:getLevelStr()
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

    -- `modName` and `filePath` don't want the author folder, but `modDir `does.
    local modName, filePath, modDir
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
            "herbert100/more quickloot/common.lua" ~> `filePath = "common.lua"`
            "herbert100/more quickloot/managers/organic.lua" ~> `filePath = "managers/organic.lua"`
    ]]
    filePath = table.concat(table.filterarray(luaParts, function(i) return i > cutoff end), "/")
    if hasAuthorName then
        -- e.g. modDir = "herbert100.more quickloot"
        modDir = luaParts[1] .. "." .. luaParts[2]
    else
        -- e.g. modDir = "Expeditious Exit"
        modDir = luaParts[1]
    end
    return modName, filePath, modDir
end


--[[##Create a new logger for a mod with the specified `modName`. 

New objects can be created in the following ways:
- `log = Logger.new("MODNAME")`
- `log = Logger.new{modName="MODNAME", level=LEVEL?, ...}`

In addition to `modName`, you may specify
- `level`: the logging level to start this logger at. This is the same as making a new logger and then calling `log:setLevel(level)`
- `writeToFile`: either a boolean saying we should write to a file, or the name of a file to write to. If false (the default), then log messages will be written to `MWSE.log`
]]
---@param params Logger.newParams|string?
---@return Logger
function Logger.new(params)
    -- if it's just a string, treat it as the `modName`
    if not params then
        params = {}
    elseif type(params) == "string" then
        params = {modName=params} 
    end

    ---@diagnostic disable-next-line: undefined-field
    local modName = params.modName or params.name -- support old constructor
    local moduleName = params.moduleName
    -- do some error checking to make sure `params` are correct
    
    
    local srcModName, filePath, srcModDir = getModInfoFromSource()

    local modDir = params.modDir or srcModDir
    
    if modName then
        if not moduleName then
            modName, moduleName = getModAndModuleNames(modName)
        end
    else
        modName = srcModName
    end

    assert(modName ~= nil, "Error: Could not create a Logger because modName was nil.")
    assert(type(modName) == "string", "Error: Could not create a Logger. modName must be a string.")

    if not modDir then
        modDir = modName
        -- who logs the logger?
        mwse.log("[Logger: ERROR] modDir for %q (module %q) was nil! this isn't supposed to happen!!", modName, moduleName)
    end

    -- first try to get it
    local log = Logger.get(modName, filePath)

    if log then return log end

    -- now we know the log doesn't exist

    log = {
        modName = modName,
        modDir = modDir,
        moduleName = moduleName,
        filePath = filePath,
        includeLineNumber = true,
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

    -- set the logging level.
    -- we're doing it here so that all the other loggers are updated as well, provided `params.level` is valid.
    ---@diagnostic disable-next-line: undefined-field
    if params.logLevel then
        -- they used the old syntax, so use the old method
        ---@diagnostic disable-next-line: undefined-field, deprecated
        log:setLogLevel(params.logLevel)
    else
        -- they used the new syntax, so use the new method
        log:setLevel(params.level)
    end

    if params.writeToFile ~= nil then
        -- pave the way forward for our logging brethren
        log:setWriteToFile(params.writeToFile)
    else
        -- no behavior specified, so do whatever the last guy was doing
        local latest = loggerTbl[#loggerTbl - 1]
        if latest and latest.file then
            log:setWriteToFile(true, false)
        end
    end


    return log
end


-- updates a key for all loggers
---@param self Logger
---@param key string|number
---@param value any
local function updateKey(self, key, value)
    for _, logger in ipairs(loggers[self.modName]) do
        logger[key] = value
    end
end

-- autogenerate methods to set communal keys. some of these will be overwritten later on.
-- the substring stuff is to to convert the first letter to uppercase, e.g. "setLevel" instead of "setlevel"
for key in pairs(communalKeys) do
    Logger["set" .. key:sub(1,1):upper() .. key:sub(2)] = function(self, value)
        updateKey(self, key, value)
    end
end

---@param includeTimestamp boolean Whether logs should use timestamps
function Logger:setIncludeTimestamp(includeTimestamp)
    -- we need to know what to do
    if includeTimestamp == nil then return end
    updateKey(self, "includeTimestamp", includeTimestamp)
end

---@param writeToFile string|boolean
---@param updateAllLoggers boolean? should we update every other logger? Default: true
function Logger:setWriteToFile(writeToFile, updateAllLoggers)
    if writeToFile == nil then return end

    if updateAllLoggers == nil then updateAllLoggers = true end

    local relevantLoggers = updateAllLoggers and loggers[self.modName] or {self}

    if not writeToFile then
        for _, log in ipairs(relevantLoggers) do
            if log.file then 
                log.file:close()
                log.file = nil
            end
        end
        return
    end
    for _, log in ipairs(relevantLoggers) do
        local filename = writeToFile
        -- if it's `true` instead of a `string`, we should generate a valid filename.
        if writeToFile == true then
            if log.moduleName then
                filename = fmt("Data Files\\MWSE\\mods\\%s\\%s.log",
                    log.modDir:gsub("%.", "\\"), 
                    log.moduleName:gsub("%.lua$", ""):gsub("%.", "\\")
                )
            else
                filename = "Data Files\\MWSE\\mods\\" .. log.modDir:gsub("%.", "\\") .. ".log"
            end
        end
        -- close old file
        if log.file then
            log.file:close()
        end
        log.file = io.open(filename, "w")
    end
end

--[[Change the current logging level. You can specify a string or number.
e.g. to set the `log.level` to "DEBUG", you can write any of the following:
1) `log:setLevel("DEBUG")`
2) `log:setLevel(4)`
3) `log:setLevel(Logger.LEVEL.DEBUG)`
]]
---@param self Logger
---@param level Logger.LEVEL
function Logger:setLevel(level)
    if not level then return end

    if type(level) ~= "number" or level < LOG_LEVEL.NONE or level > LOG_LEVEL.TRACE then
        mwse.log("[mwseLogger: ERROR] Invalid parameter (%q) was passed to setLevel. \z
            This method only accepts constants from the Logger.LEVEL table.", level)
        return
    end

    updateKey(self, "level", level)
end



--[[Get a previously registered logger with the specified `modDir`.]]
---@param modDir string name of the mod
---@param filePath string the relative filepath of this logger
---@return Logger? logger
function Logger.getByDir(modDir, filePath)
    local loggerTbl

    for _, loggersByModName in pairs(loggers) do
        if loggersByModName[1] and loggersByModName[1].modDir == modDir then
            loggerTbl = loggersByModName
            break
        end
    end

    if not loggerTbl then return end

    if not filePath then 
        return loggerTbl[1]
    end

    for _, log in ipairs(loggerTbl) do
        if log.moduleName == filePath then
            return log
        end
    end
end

-- get a specified logger. If `moduleName` evaluates to `false`, then any logger with a matching `modName` will be returned (if such a logger exists).
    -- if `moduleName` does not evaluate to `false`, then this function will only return a logger if it can find one that matches the `modName` and the `moduleName`.
---@param modName string name of the mod
---@param filePath string? the relative file path of the module
---@return Logger? logger
function Logger.get(modName, filePath)
    local loggerTbl = loggers[modName]

    if not loggerTbl then return end

    if not filePath then 
        return loggerTbl[1]
    end

    for _, log in ipairs(loggerTbl) do
        if log.filePath == filePath then
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










---@param args any[] arguments passed to Logger:debug, Logger:info, etc
---@param level Logger.LEVEL
---@param offset integer? for the line number to be accurate, this method assumes it's getting called 2 levels deep (i.e.). the offset adjusts this
---@return Logger.Record record
function Logger:makeRecord(msg, args, level, offset)
    return {
        msg = msg,
        args = args, 
        level = level,
        timestamp = self.includeTimestamp and socket.gettime() or nil,
        lineNumber = self.includeLineNumber and debug.getinfo(3 + (offset or 0), "l").currentline or nil
    }
end

---@param logger Logger
---@param record Logger.Record
---@return string
local function makeHeader(logger, record)
    -- we're going to shove various things into here, and then making the string via
    -- `table.concat(headerT, " | ")
    local headerT = {}
    local name
    if logger.moduleName then
        name = fmt("%s (%s)", logger.modName, logger.moduleName)
    else
        name = logger.modName
    end
    if record.lineNumber then
        if logger.filePath then
            headerT = {name, fmt("%s:%i", logger.filePath, record.lineNumber)}
        else
            headerT = {fmt("%s:%i", name, record.lineNumber)}
        end
    else
        headerT = {name, logger.filePath}

    end
    local levelStr = LEVEL_STRINGS[record.level]

    if mwse.getConfig("EnableLogColors") then
        -- e.g. turn "ERROR" into "ERROR" (but written in red)
        levelStr = colors(fmt("%%{%s}%s", COLORS[levelStr], levelStr))
    end
    table.insert(headerT, levelStr)

    if record.timestamp then
        local timestamp = record.timestamp ---@type number
        local milliseconds = math.floor((timestamp % 1) * 1000)
        timestamp = math.floor(timestamp)

        -- convert timestamp to a table containing time components
        local timeTable = os.date("*t", timestamp)

        -- format time components into H:M:S:MS string
        local formattedTime = fmt("%02d:%02d:%02d.%03d", timeTable.hour, timeTable.min, timeTable.sec, milliseconds)
        table.insert(headerT, formattedTime)
    end
    return table.concat(headerT, " | ")
end

-- default formatter. can be overridden by users
---@param record Logger.Record
---@return string
function Logger:format(record)

    local msg = record.msg
    local args = record.args
    local n = #args
    if n == 0 then
        -- dont change the message
    elseif type(msg) == "function" then
        -- everything was passed as a function

        if n == 1 then
            msg = fmt(msg(args[1]))
        else
            msg = fmt(msg(table.unpack(args)))
        end

    elseif type(args[1]) == "function" then
        -- formatting parameters were passed as a function

        if n == 1 then
            msg = fmt(msg, args[1]())
        else
            msg =  fmt(msg, args[1](table.unpack(args, 2)))
        end
    else
        -- nothing was passed as a function, format the message normally
        msg = fmt(msg, table.unpack(args))
    end
    return fmt("[%s] %s", makeHeader(self, record), msg)
end


-- make the logging functions
for levelStr, level in pairs(LOG_LEVEL) do
    -- e.g., "DEBUG" -> "debug"
    ---@param self Logger
    Logger[string.lower(levelStr)] = function(self, msg, ...)
        if self.level < level then return end


        local str = self:format(self:makeRecord(msg, {...}, level))

        if self.file then
            self.file:write(str, "\n")
            self.file:flush()
        else
            print(str)
        end
    end
end

-- i am a very good programmer
Logger.none = nil

-- update `call` to be the same as `debug`. this is so that the line numbers are pulled correctly when using the metamethod.
---@diagnostic disable-next-line: undefined-field
logMetatable.__call = Logger.debug


function Logger:assert(condition, msg, ...)
    if condition then return end

    -- cant call `Logger:error` because we need the call to `debug.getinfo` to produce the correct line number. super hacky :/
    local str = self:format(self:makeRecord(msg, {...}, LOG_LEVEL.ERROR))

    if self.level >= LOG_LEVEL.ERROR then
        if self.file then
            self.file:write(str, "\n")
            self.file:flush()
        else
            print(str)
        end
    end

    assert(condition, str)

end

function Logger:writeInitializedMessage(version)
    if self.level < Logger.LEVEL.INFO then return end

    if not version then
        local metadata = tes3.getLuaModMetadata(self.modDir)
        if metadata then
            version = metadata.package.version
        end
    end
    -- need to do it this way so the call to `debug.getinfo` produces the correct line number. super hacky :/
    local record
    if version then
        record = self:makeRecord("Initialized version %s.", {version}, LOG_LEVEL.INFO)
    else
        record = self:makeRecord("Mod initialized.", {}, LOG_LEVEL.INFO)
    end

    local str = self:format(record)

    if self.level >= LOG_LEVEL.ERROR then
        if self.file then
            self.file:write(str, "\n")
            self.file:flush()
        else
            print(str)
        end
    end
end



-- =============================================================================
-- BACKWARDS COMPATIBILITY
-- =============================================================================


-- support the old way
---@deprecated 
---@param levelStr string
function Logger:setLogLevel(levelStr)
    local level = LOG_LEVEL[levelStr]
    if not level then return end

    updateKey(self, "level", level)
end


-- support the old way
---@deprecated 
Logger.getLogger = Logger.get

---@deprecated
function Logger:doLog(levelStr)
    -- make sure they gave us a valid logging level, and that we are at or below that logging level
    return LOG_LEVEL[levelStr] and LOG_LEVEL[levelStr] <= self.level
end


return Logger ---@type Logger