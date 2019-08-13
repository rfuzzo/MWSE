--
-- EmmyLua/vscode generator for MWSE-Lua.
-- Meant to be used with the "Lua" vscode extension by sumneko.
-- https://github.com/sumneko/lua-language-server
--

local function log(fmt, ...)
	print (fmt:format(...))
end

local lfs = require("lfs")
local json = require("dkjson")

local definitionsFolder = lfs.currentdir() .. "\\definitions"
log("Definitions folder: %s", definitionsFolder)

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

function table.isEmpty(t)
	for _, _ in pairs(t) do
		return false
	end
	return true
end

function copyTable(t, d)
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

local function isDirectory(path)
	if (type(path) ~= "string") then
		return false
	end

	local attributes = lfs.attributes(path)
	return (attributes and attributes.mode == "directory")
end


local originalExecute = os.execute
--- Prints the contents of an `os.execute()` before calling the function.
---@param cmd string
function os.execute(cmd)
	log("Executing os.command: %s", cmd:gsub([[\\]],[[\]]))
	originalExecute(cmd)
end

local typeRemaps = {
	["lib"] = "table",
}

local function getRealTypeName(t)
	return typeRemaps[t] or t
end

--
-- Build global definitions.
--

local definitionsGlobal = {}

local function parseGlobalDefinitionFolder(folder, key, container, parent)
	-- Load our base package.
	local path = folder .. "\\" .. key .. ".lua"
	local status, raw = pcall(dofile, path)
	if (status == false or type(raw) ~= "table") then
		return
	end

	raw.key = key

	-- Create the results package.
	local package = {
		["key"] = key,
		["type"] = getRealTypeName(raw.type),
		["description"] = raw.description,
		["arguments"] = raw.arguments,
		["returns"] = raw.returns,
		["parent"] = parent,
	}

	-- Build a list of children.
	package.children = {}
	local childrenDir = folder .. "\\" .. key
	for entry in lfs.dir(childrenDir) do
		local fullPath = childrenDir .. "\\" .. entry
		local extension = entry:match("[^.]+$")
		if (extension == "lua") then
			parseGlobalDefinitionFolder(childrenDir, entry:match("[^/]+$"):sub(1, -1 * (#extension + 2)), package.children, package)
		end
	end
	if (table.isEmpty(package.children)) then
		package.children = nil
	end

	container[key] = package
end

local function getLinedDescription(description)
	return string.format("--- %s", description:gsub("\n", "\n--- "))
end

local function getReturnType(r)
	if (type(r) == "table") then
		return r.type or "wtf"
	end

	return r
end

local function getFullAccesKey(definition)
	if (definition.parent) then
		return getFullAccesKey(definition.parent) .. "." .. definition.key
	else
		return definition.key
	end
end

local function getParentedDeclaration(file, definition, declarer)
	file:write(string.format("%s = %s\n\n", getFullAccesKey(definition), declarer or "nil"))
end

local definitionWriters = {}

local function writeDefinition(file, definition, parent)
	local writer = definitionWriters[definition.type] or definitionWriters.generic
	if (writer) then
		writer(file, definition, parent)
	end
end

local function writeCommonHeader(file, definition, parent)
	if (definition.description) then
		file:write(getLinedDescription(definition.description) .. "\n")
	end

	file:write(string.format("---@type %s\n", definition.type))
end

function definitionWriters.generic(file, definition, parent)
	writeCommonHeader(file, definition, parent)
	getParentedDeclaration(file, definition)
end

function definitionWriters.table(file, definition, parent)
	writeCommonHeader(file, definition, parent)
	getParentedDeclaration(file, definition, "{}")
	if (definition.children) then
		for k, child in pairs(definition.children) do
			writeDefinition(file, child, definition)
		end
	end
end

definitionWriters["function"] = function(file, definition, parent)
	writeCommonHeader(file, definition, parent)
	
	if (definition.arguments and #definition.arguments > 0) then
		if (definition.arguments[1].tableParams ~= nil) then

		else
			for i, arg in ipairs(definition.arguments) do
				local name = arg.name or string.format("arg%d", i)
				file:write(string.format("---@param %s %s\n", name, arg.type))
			end
		end
	end

	if (definition.returns and #definition.returns > 1) then
		file:write("---@return ")
		for i, ret in ipairs(definition.returns) do
			if (i ~= 1) then
				file:write(", ")
			end
			file:write(ret.type)
		end
		file:write("\n")
	end
	
	file:write(string.format("function %s(", getFullAccesKey(definition)))
	if (definition.arguments and #definition.arguments > 0) then
		if (definition.arguments[1].tableParams ~= nil) then

		else
			for i, arg in ipairs(definition.arguments) do
				file:write(arg.name or string.format("arg%d", i))
			end
		end
	end
	file:write(") end\n\n")
end

local function writeGlobalDefinition(definition, path)
	log("Writing global definition: %s <- %s", definition.key, path)

	local file = io.open(path, "w")
	file:write("\n")

	writeDefinition(file, definition)

	file:write("\n")
	file:close()
end

for entry in lfs.dir(definitionsFolder .. "\\global") do
	local fullPath = definitionsFolder .. "\\global\\" .. entry
	local extension = entry:match("[^.]+$")
	if (extension == "lua") then
		local key = entry:match("[^/]+$"):sub(1, -1 * (#extension + 2))
		log("Building API: " .. key .. " ...")
		parseGlobalDefinitionFolder(definitionsFolder .. "\\global", key, definitionsGlobal)
	end
end

--
-- Write parsed output.
--

os.execute(string.format("rmdir /S /Q %q", lfs.currentdir() .. "\\..\\misc\\package\\Data Files\\MWSE\\core\\api\\EmmyLua"))
os.execute(string.format("mkdir %q", lfs.currentdir() .. "\\..\\misc\\package\\Data Files\\MWSE\\core\\api\\EmmyLua"))

-- Write global libraries.
os.execute(string.format("mkdir %q", lfs.currentdir() .. "\\..\\misc\\package\\Data Files\\MWSE\\core\\api\\EmmyLua\\global"))
for key, package in pairs(definitionsGlobal) do
	writeGlobalDefinition(package, lfs.currentdir() .. "\\..\\misc\\package\\Data Files\\MWSE\\core\\api\\EmmyLua\\global\\" .. key .. ".lua")
end
