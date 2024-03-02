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
---@field filePath string the relative path to the file this logger was defined in.
---@field modDir string
---@field moduleName string? the module this logger belongs to, or `nil` if it's a general purpose logger
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
            self:setLevel(v)
        else
            rawset(self, k, v)
        end
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


---@class Logger.newParams
---@field modName string? the name of the mod this logger is for
---@field modDir string? the name of the mod this logger is for
---@field level Logger.LEVEL|Logger.LEVEL_STRING|nil the log level to set this object to. Default: "INFO"
---@field moduleName string? the module this logger belongs to, or `nil` if it's a general purpose logger
---@field includeLineNumber boolean? should the current line be printed when writing log messages? Default: `true`
---@field includeTimestamp boolean? should the current time be printed when writing log messages? Default: `false`
---@field writeToFile string|boolean|nil whether to write the log messages to a file, or the name of the file to write to. if `false` or `nil`, messages will be written to `MWSE.log`


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
function Logger.new(params, params2)
    -- if it's just a string, treat it as the `modName`
    if not params then
        params = {}
    elseif type(params) == "string" then
        params = {modName=params} 
    end

    local modName, moduleName = params.modName, params.moduleName
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
    -- this will update the logging level of all other registered loggers, but only if `params.level` exists and is valid 
    log:setLevel(params.level)

    if params.writeToFile ~= nil then
        -- pave the way forward for our logging brethren
        log:setWriteToFile(params.writeToFile)
    else
        -- no behavior specified, so do whatever everybody else is doing
        for _, logger in ipairs(loggerTbl) do 
            if logger.file then
                log:setWriteToFile(true, false)
                break
            end
        end
        
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
---@param updateChildren boolean? should we update the child loggers? default: true
function Logger:setWriteToFile(writeToFile, updateChildren)
    if writeToFile == nil then return end

    if updateChildren == nil then updateChildren = true end

    local relevantLoggers = updateChildren and loggers[self.modName] or {self}

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
---@param filePath string the relative filepath of this logger
---@return Logger? logger
function Logger.getByDir(modDir, filePath)
    local loggerTbl

    for _, loggersByModName in pairs(loggers) do
        if loggersByModName[1].modDir == modDir then
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

function Logger:makeChild(moduleName)
    return self.new{
        modName=self.modName,
        level=self.level,
        moduleName=moduleName,
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
---@field msg string|any|fun(...):... arguments passed to Logger:debug, Logger:info, etc
---@field args any[] arguments passed to Logger:debug, Logger:info, etc
---@field level Logger.LEVEL logging level
---@field lineNumber integer? the line number, if enabled for this logger
---@field timestamp number the timestamp of this message


---@param args any[] arguments passed to Logger:debug, Logger:info, etc
---@param level Logger.LEVEL
---@param offset integer? for the line number to be accurate, this method assumes it's getting called 2 levels deep (i.e.). the offset adjusts this
---@return Logger.Record record
function Logger:makeRecord(msg, args, level, offset)
    return {
        msg = msg,
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
    local name
    if self.moduleName then
        name = sf("%s (%s)", self.modName, self.moduleName)
    else
        name = self.modName
    end
    if record.lineNumber then
        if self.filePath then
            headerT = {name, sf("%s:%i", self.filePath, record.lineNumber)}
        else
            headerT = {sf("%s:%i", name, record.lineNumber)}
        end
    else
        headerT = {name, self.filePath}

    end
    local levelStr = LEVEL_STRINGS[record.level]

    if mwse.getConfig("EnableLogColors") then
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

    local formattedMsg
    local msg = record.msg
    local args = record.args
    local n = #args
    if n == 0 then
        formattedMsg = msg
    else
        if type(msg) == "function" then
            if n == 1 then
                formattedMsg = sf(msg(args[1]))
            else
                formattedMsg = sf(msg(table.unpack(args)))
            end

        elseif type(args[1]) == "function" then
            if n == 1 then
                formattedMsg = sf(msg, args[1]())
            else
                formattedMsg =  sf(msg, args[1](table.unpack(args, 2)))

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
            formattedMsg = sf(msg, table.unpack(args))
        end
    end
    return sf("[%s] %s", header, formattedMsg)

end




-- make the logging functions
for levelStr, level in pairs(LOG_LEVEL) do
    -- e.g., "DEBUG" -> "debug"
    Logger[levelStr:lower()] = function(self, msg, ...)
        if self.level < level then return end

        if self.file then
            self.file:write(self:format(self:makeRecord(msg, {...}, level)), "\n")
            self.file:flush()
        else
            print(self:format(self:makeRecord(msg, {...}, level)))
        end
    end
end

-- update `call` to be the same as `debug`. this is so that the line numbers are pulled correctly when using the metamethod.
logMetatable.__call = Logger.debug


--[[ here's an example of how the `for` loop above will generate the `debug` method:
function Logger:debug(...)
    if self.level < LOG_LEVEL.DEBUG then return end
    
    if self.file then
        self.file:write(self:format(self:makeRecord({...}, LOG_LEVEL.DEBUG)), "\n")
        self.file:flush()
    else
        print(self:format(self:makeRecord({...}, LOG_LEVEL.DEBUG)))
    end
end
]]




function Logger:writeInitializedMessage(version)
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
        record = self:makeRecord("Initialized version %s.", {version}, LOG_LEVEL.INFO)
    else
        record = self:makeRecord("Mod initialized.", {}, LOG_LEVEL.INFO)
    end
    print(self:format(record))
end



-- =============================================================================
-- BACKWARDS COMPATIBILITY
-- =============================================================================


-- support the old way
---@deprecated 
Logger.setLogLevel = Logger.setLevel


-- support the old way
---@deprecated 
Logger.getLogger = Logger.get

---@deprecated
function Logger:doLog(levelStr)
    -- make sure they gave us a valid logging level, and that we are at or below that logging level
    return LOG_LEVEL[levelStr] and LOG_LEVEL[levelStr] <= self.level
end


return Logger ---@type Logger