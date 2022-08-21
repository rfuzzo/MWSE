--
-- Find missing MWSE-lua definitions.
--

-- Use instructions:
-- Run the "Check for missing definitions" task. The missing definitions will
-- be printed out at the terminal.
--
-- Settings
--
-- Check for definition files without a description
local FIND_MISSING_DESCRIPTIONS = false
-- Check for missing descriptions in arguments of functions or methods
-- This is set to false by default since it doesn't always make sense
-- to add a description for each argument.
local CHECK_ARGUMENT_DESCRIPTION = false

local function log(fmt, ...)
	print (fmt:format(...))
end

local lfs = require("lfs")
local json = require("dkjson")

local definitionsFolder = lfs.currentdir() .. "\\definitions"
local sourceFolder = lfs.currentdir() .. "\\..\\MWSE"
log("Definitions folder: %s", definitionsFolder)
log("Source folder: %s", sourceFolder)
log("\n\n")

function json.loadfile(fileName)
	-- Load the contents of the file.
	local f = io.open(fileName, "r")
	if (f == nil) then
		return nil
	end
	local fileContents = f:read("*all")
	f:close()

	-- Return decoded json.
	return json.decode(fileContents)
end

function json.savefile(fileName, object, config)
	local f = assert(io.open(fileName, "w"))
	f:write(json.encode(object, config))
	f:close()
end

local function isTableEmpty(t)
	for _, _ in pairs(t) do
		return false
	end
	return true
end

local function getSortedKeys(t, sortFn)
	local keys = {}
	for k, _ in pairs(t) do
		table.insert(keys, k)
	end
	table.sort(keys, sortFn)
	return keys
end

function table.copy(t, d)
	if (d == nil) then
		d = {}
	elseif (type(t) ~= "table" or type(d) ~= "table") then
		error("Arguments for table.copy must be tables.")
	end

	for k, v in pairs(t) do
		d[k] = v
	end

	return d
end

function table.deepcopy(t)
	local copy = nil
	if type(t) == "table" then
		copy = {}
		for k, v in next, t, nil do
			copy[table.deepcopy(k)] = table.deepcopy(v)
		end
		setmetatable(copy, table.deepcopy(getmetatable(t)))
	else
		copy = t
	end
	return copy
end

local match = string.match
local function trimString(s)
   return match(s,'^()%s*$') and '' or match(s,'^%s*(.*%S)')
end

local function splitString(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

local function isDirectory(path)
	if (type(path) ~= "string") then
		return false
	end

	local attributes = lfs.attributes(path)
	return (attributes and attributes.mode == "directory")
end

local function copyFile(src, dst)
	local source = io.open(src, "r")
	local destination = io.open(dst, "w")

	destination:write(source:read("*a"))

	source:close()
	destination:close()
end

local standardTypes = {
	["function"] = true,
	["table"] = true,
	["number"] = true,
	["boolean"] = true,
	["string"] = true,
	["unknown"] = true,
	["ref"] = true,
}

local rstHeaders = {
	"====================================================================================================",
	"----------------------------------------------------------------------------------------------------",
	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
}

local typeLinks = {
	["bool"] = "lua/type/boolean",
	["boolean"] = "lua/type/boolean",
	["function"] = "lua/type/function",
	["nil"] = "lua/type/nil",
	["number"] = "lua/type/number",
	["string"] = "lua/type/string",
	["table"] = "lua/type/table",
}

for entry in lfs.dir(definitionsFolder .. "\\namedTypes") do
	local extension = entry:match("[^.]+$")
	if (extension == "lua") then
		local name = entry:match("[^/]+$"):sub(1, -1 * (#extension + 2))
		typeLinks[name] = "lua/type/" .. name
	end
end


local function breakoutMultipleTypes(str)
	return "`" .. table.concat(splitString(str, "|"), "`_, `") .. "`_"
end


--
-- Events
--

-- TODO: Find missing events.

--
-- API
--

local function checkSourceFileAPI(namespace, sourcePath)
	--log("Checking file: " .. sourcePath .. " ...")
	local properties = {}

	for line in io.lines(sourcePath) do
		for def in line:gmatch(namespace .. "%[\"(%w+)\"%] =") do
			properties[def] = true
		end
	end

	local path = definitionsFolder .. "\\global\\" .. namespace

	for p in pairs(properties) do
		local f = lfs.attributes(path .. "\\" .. p .. ".lua")
		if (not f) then
			print("Missing type entry: " .. namespace .. "." .. p)
		end
	end
end

local utilSourceFiles = {
	["tes3"] = "TES3Util.cpp",
	["tes3ui"] = "TES3UIManagerLua.cpp",
	["mwscript"] = "ScriptUtilLua.cpp",
}

for namespace, filename in pairs(utilSourceFiles) do
	checkSourceFileAPI(namespace, sourceFolder .. "\\" .. filename)
end

--
-- Named Types
--

local ignoreSolDefs = { ["new"] = true }
local allTypes = {}

local function reportNamedType(properties, typeName)
	local path = definitionsFolder .. "\\namedTypes\\" .. typeName
	if (not isDirectory(path)) then
		print("Missing type directory: " .. typeName)
		return
	end

	for p in pairs(properties) do
		local f = lfs.attributes(path .. "\\" .. p .. ".lua")
		if (not f) then
			print("Missing type entry: " .. typeName .. "." .. p)
		end
	end
end

local function checkSourceFileTypes(sourcePath)
	--log("Checking file: " .. sourcePath .. " ...")

	-- Read all types within the file
	local currentType = nil
	local currentTypeName = nil

	for line in io.lines(sourcePath) do
		for newTypename in line:gmatch("[.]new_usertype[^(]+%(\"(%w+)") do
			if (currentType) then
				reportNamedType(currentType, currentTypeName)
			end

			if (allTypes[newTypename] == nil) then
				allTypes[newTypename] = {}
			end
			currentType, currentTypeName = allTypes[newTypename], newTypename
			--log("  + " .. newTypename)
		end
		if (currentType) then
			-- Skip legacy properties.
			if (line:match("//.+[Ll]egacy") or line:match("//.+[Dd]eprecated")) then
				currentType, currentTypeName = nil, nil
			end

			-- Match usertype properties.
			for def in line:gmatch("usertypeDefinition%[\"(%w+)\"%] =") do
				if (not ignoreSolDefs[def]) then
					currentType[def] = true
				end
			end
		end
	end
	if (currentType) then
		reportNamedType(currentType, currentTypeName)
	end
end

for entry in lfs.dir(sourceFolder) do
	local extension = entry:match("[^.]+$")
	if (extension == "cpp" or extension == "h") then
		local name = entry:match("[^/]+$"):sub(1, -1 * (#extension + 2))
		if (name:match(".+Lua$")) then
			checkSourceFileTypes(sourceFolder .. "\\" .. entry)
		end
	end
end

--
-- Missing descriptions in existing definitions
--

-- Don't report missing description for operator overload definitions.
local ignoredOperatorDefinitions = {
	["add"] = true,
	["sub"] = true,
	["mul"] = true,
	["div"] = true,
	["idiv"] = true,
	["mod"] = true,
	["pow"] = true,
	["concat"] = true,
	["len"] = true,
	["unm"] = true
}

local function noDescription(package)
	if (package.description == nil) or
	(package.description == "") or
	-- Don't count two characters as proper description.
	(package.description:len() < 3) then
	 	return true
 	end

	return false
end

local function checkDesc(package, path)
	local messages = {}

	if CHECK_ARGUMENT_DESCRIPTION then
		for _, argumentTable in ipairs(package.arguments or {}) do
			if (argumentTable.tableParams) then
				for _, argument in ipairs(argumentTable.tableParams) do
					if noDescription(argument) then
						assert(argument.name ~= nil, ("checkDesc: Argument without name, %s"):format(path))
						table.insert(messages, ("\t%s"):format(argument.name))
					end
				end
			else
				if noDescription(argumentTable) then
					assert(argumentTable.name ~= nil, ("checkDesc: Argument without name %s"):format(path))
					table.insert(messages, ("\t%s"):format(argumentTable.name))
				end
			end
		end
	end

	local file = path:gsub(definitionsFolder .. "\\", "")
	local name, extension = file:match("(%a+)%.(%a+)$")
	if #messages > 0 then
		table.insert(messages, 1, ("Function \"%s\" has arguments without description:"):format(file))
	end

	if noDescription(package) and (not ignoredOperatorDefinitions[name]) then
		table.insert(messages, 1, ("Definition without description: \"%s\""):format(file))
	end

	return table.concat(messages, "\n")
end

local function scan(folder)
	for entry in lfs.dir(folder) do
		-- Filter out this folder and parent folder (".", and "..")
		if not entry:find("%.$") then
			local path = folder .. "\\" .. entry
			local mode = lfs.attributes(path, "mode")

			if mode == "file" then
				local extension = entry:match("[^.]+$")
				if extension == "lua" then
					-- Filter out the example files. Those will always error out, so
					-- use that as a criterion to filter only the definition files.
					local definitionFile, file = pcall(dofile, path)

					if definitionFile and file then
						local msg = checkDesc(file, path)
						-- table.concat returns empty string "" when concatenating an
						-- empty table, so don't log the "" strings that result from
						-- definition files that are ok. Each logged "" string will
						-- add a newline to the log which makes it less readable.
						if msg ~= "" then
							log(msg)
						end
					end
				end
			elseif mode == "directory" then
				scan(path)
			end
		end
	end
end

if FIND_MISSING_DESCRIPTIONS then
	scan(definitionsFolder)
end
