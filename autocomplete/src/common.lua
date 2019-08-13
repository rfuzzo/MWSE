
local lfs = require("lfs")

local common = {}

--- A dictionary of relevant directories.
common.directory = {}

-- Setup common directories.
common.directory.root = lfs.currentdir():gsub([[\]], [[/]])
common.directory.definitions = common.directory.root .. "/definitions"
common.directory.globalDefinitions = common.directory.definitions .. "/global"
common.directory.typeDefinitions = common.directory.definitions .. "/type"
common.directory.logs = common.directory.root .. "/logs"
common.directory.api = common.directory.root .. "/../misc/package/Data Files/MWSE/core/api"

common.url = {}
common.url.docs = "https://mwse.readthedocs.io/en/latest"

--- A list of pre-existing libraries that lua provides.
common.defaultLibraries = {
	["json"] = true,
	["math"] = true,
	["string"] = true,
	["table"] = true,
}

local logFile = nil

function common.getDocumentationUrl(t, def)
	local path = def.key
	local parent = def.parent
	while (parent) do
		path = parent.key .. "/" .. path
		parent = parent.parent
	end
	return string.format("%s/lua/%s/%s.html", common.url.docs, t, path)
end

--- Prints a command to the log file if one is specified, as well as printing to the string.
---@param fmt string
---@vararg
function common.log(fmt, ...)
	local output = tostring(fmt):format(...)
	print(output)

	if (logFile) then
		logFile:write(output)
		logFile:write("\n")
	end
end

--- Creates a log file. All calls to the `log` function will additionally write to this file.
function common.setLogFile(filename)
	if (logFile) then
		logFile:close()
		logFile = nil
	end

	logFile = io.open(common.directory.logs .. "/" .. filename, "w")
end

function common.isTableEmpty(t)
	for _, _ in pairs(t) do
		return false
	end
	return true
end

function common.getDefinitionCompleteKey(def)
	if (def.parent) then
		return common.getDefinitionCompleteKey(def.parent) .. "." .. def.key
	else
		return def.key
	end
end

--- Wrapper around `os.execute` that helps provide compatibility.
---@param command string
---@vararg
function common.execute(command, ...)
	local cmd = tostring(command):format(...)
	common.log("Executing command: %s", cmd)
	-- os.execute(cmd .. " >nul 2>nul")
end

local function buildGlobal(key, folder, parent)
	-- Load our base package.
	local path = folder .. "/" .. key .. ".lua"
	local status, package = pcall(dofile, path)
	if (status == false or type(package) ~= "table") then
		return
	end

	-- Setup some important information.
	package.key = key
	if (parent) then
		package.parent = parent
	end

	assert(package.valuetype == nil, path .. " has a valuetype field!")
	assert(package.returns == nil or type(package.returns) == "table", path .. " has an invalid returns field!")

	-- Build a list of children.
	package.children = {}
	local childrenDir = folder .. "/" .. key
	for entry in lfs.dir(childrenDir) do
		local extension = entry:match("[^.]+$")
		if (extension == "lua") then
			local childKey = entry:match("[^/]+$"):sub(1, -1 * (#extension + 2))
			package.children[childKey] = buildGlobal(childKey, childrenDir, package)
		end
	end
	if (common.isTableEmpty(package.children)) then
		package.children = nil
	end

	return package
end

--- Build the databse using any configuration.
function common.buildDatabase()
	local database = {}

	-- Load global definitionts.
	database.globals = {}
	for entry in lfs.dir(common.directory.globalDefinitions) do
		local extension = entry:match("[^.]+$")
		if (extension == "lua") then
			local key = entry:match("[^/]+$"):sub(1, -1 * (#extension + 2))
			common.log("Building global: " .. key .. " ...")
			database.globals[key] = buildGlobal(key, common.directory.globalDefinitions)
		end
	end

	database.types = {}
	for entry in lfs.dir(common.directory.typeDefinitions) do
		local extension = entry:match("[^.]+$")
		if (extension == "lua") then
			local key = entry:match("[^/]+$"):sub(1, -1 * (#extension + 2))
			common.log("Building type: " .. key .. " ...")
			database.types[key] = buildGlobal(key, common.directory.typeDefinitions)
		end
	end

	return database
end

function common.copyTable(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

--- Cleans up any open file handles.
function common.cleanup()
	if (logFile) then
		logFile:close()
		logFile = nil
	end
end

return common
