
package.path = package.path .. ";./src/?.lua"

local json = require("dkjson")

-- Setup base module.
local common = require("common")
common.setLogFile("EmmyLua.log")
local data = nil

-- Setup some common directories for this project.
common.directory.apiEmmyLua = common.directory.api .. "/EmmyLua"
common.directory.apiEmmyLuaGlobals = common.directory.apiEmmyLua .. "/global"
common.directory.apiEmmyLuaTypes = common.directory.apiEmmyLua .. "/type"

local currentType = nil

--
-- Helper functions to produce the needed output.
--

--- Exchanges a description that has line breaks with one that spans multiple lines.
local function getLinedDescription(description)
	return string.format("--- %s", description:gsub("\n", "\n---|"))
end

local function getFullAccesKey(def)
	if (def.parent) then
		return getFullAccesKey(def.parent) .. "." .. def.key
	else
		return def.key
	end
end

local function getParentedDeclaration(file, def, declarer)
	file:write(string.format("%s = %s\n\n", getFullAccesKey(def), declarer or "nil"))
end

local definitionWriters = {}

local function writeDefinition(file, def, parent)
	local writer = definitionWriters[def.type] or definitionWriters.generic
	if (writer) then
		writer(file, def, parent)
	end
end

local function writeCommonHeader(file, def, parent)
	if (def.description) then
		file:write(getLinedDescription(def.description) .. "\n")
	end

	file:write(string.format("---@type %s\n", def.type))
end

function definitionWriters.generic(file, def, parent)
	writeCommonHeader(file, def, parent)
	getParentedDeclaration(file, def, def.value)
end

function definitionWriters.string(file, def, parent)
	writeCommonHeader(file, def, parent)
	getParentedDeclaration(file, def, def.value and string.format("%q", def.value))
end

function definitionWriters.table(file, def, parent)
	if (def.children) then
		for k, child in pairs(def.children) do
			writeDefinition(file, child, def)
		end
	end
end

function definitionWriters.class(file, def, parent)
	if (def.description) then
		file:write(getLinedDescription(def.description) .. "\n")
	end

	file:write(string.format("---@class %s", def.key))
	if (def.inherits) then
		file:write(" : " .. def.inherits)
	end
	file:write("\n")

	file:write(string.format("%s = {}\n\n", def.key))

	if (def.children) then
		for k, child in pairs(common.flattenChildren(def)) do
			child.parent = def
			writeDefinition(file, child, def)
		end
	end
end

function definitionWriters.metatable(file, def, parent)
	-- Do nothing. These will be shown in the description of the class.
end

function definitionWriters.method(file, def, parent)
	definitionWriters["function"](file, def, parent, true)
end

local function writeOptionsTable(file, options)
	if (not common.isTableEmpty(options)) then
		local somethingWritten = false
		file:write(" { ")

		if (options.name) then
			file:write(string.format("name = %q", options.name))
			somethingWritten = true
		end

		if (options.comment) then
			if (somethingWritten) then
				file:write(", ")
			end
			file:write(string.format("comment = %q", options.comment))
			somethingWritten = true
		end

		if (options.optional) then
			if (somethingWritten) then
				file:write(", ")
			end
			file:write(string.format("optional = %q", options.optional))
			somethingWritten = true
		end

		if (options.special) then
			if (somethingWritten) then
				file:write(", ")
			end
			file:write(string.format("special = %q", options.special))
			somethingWritten = true
		end

		file:write(" }")
	end
end

--- Does a thing.
---|
---|**Accepts table parameters:**
---|* `name` (*type*): comment
---|* `name` (*type*): comment
---|* `name` (*type*): comment
---@type function
---@param e table
local function fuckme(e)

end

local specialForDefinition = {
	["include"] = "require:1",
}

local function getDefaultValueString(value)
	return tostring(value)
end

definitionWriters["function"] = function(file, def, parent, isMethod)
	if (def.description) then
		file:write(getLinedDescription(def.description) .. "\n")
	end

	local tableParams = def.arguments and #def.arguments == 1 and def.arguments[1].tableParams
	if (tableParams) then
		if (def.description) then
			file:write("---|\n")
			file:write("---|**Accepts table parameters:**\n")
		else
			file:write("--- **Accepts table parameters:**\n")
		end

		for i, arg in ipairs(tableParams) do
			local name = arg.name or string.format("arg%d", i)

			file:write(string.format("---|* `%s` (*%s*)", name, arg.type))
			if (arg.description) then
				file:write(": " .. arg.description)
				if (arg.default) then
					file:write(string.format(" Default: %s.", getDefaultValueString(arg.default)))
				elseif (arg.optional) then
					file:write(" Optional.")
				end
			elseif (arg.default) then
				file:write(string.format(": Default: %s.", getDefaultValueString(arg.default)))
			elseif (arg.optional) then
				file:write(": Optional.")
			end
			file:write("\n")
		end
	end

	if (def.description or tableParams) then
		file:write("---|\n")
		file:write(string.format("---|[Read online documentation](%s).\n", common.getDocumentationUrl(currentType, def)))
	else
		file:write(string.format("--- [Read online documentation](%s).\n", common.getDocumentationUrl(currentType, def)))
	end

	file:write(string.format("---@type %s\n", def.type))

	if (tableParams) then
		file:write(string.format("---@param %s table\n", def.arguments[1].name))
	elseif (def.arguments) then
		for i, arg in ipairs(def.arguments) do
			local name = arg.name or string.format("arg%d", i)

			file:write(string.format("---@param %s %s", name, arg.type))

			writeOptionsTable(file, {
				comment = arg.description,
				optional = arg.optional and "after",
				special = specialForDefinition[getFullAccesKey(def)],
			})

			file:write("\n")
		end
	end

	if (def.returns and #def.returns > 0) then
		for i, ret in ipairs(def.returns) do
			file:write("---@return " .. ret.type)

			writeOptionsTable(file, {
				name = ret.name,
				optional = ret.optional and "after",
			})

			file:write("\n")
		end
	end

	if (isMethod) then
		file:write(string.format("function %s(", getFullAccesKey(def.parent) .. ":" .. def.key))
	else
		file:write(string.format("function %s(", getFullAccesKey(def)))
	end

	if (def.arguments and #def.arguments > 0) then
		for i, arg in ipairs(def.arguments) do
			if (i ~= 1) then
				file:write(", ")
			end
			file:write(arg.name or string.format("arg%d", i))
		end
	end
	file:write(") end\n\n")
end

--- Writes out a definition.
---@param def table
---@param path string
local function writeOutDefinition(def, path)
	common.log("Writing definition: %s <- %s", def.key, path)

	local file = io.open(path, "w")
	file:write("\n")

	writeDefinition(file, def)

	file:write("\n")
	file:close()
end

--
-- Build and write the output.
--

data = common.buildDatabase()

-- Clear out old EmmyLua API folder.
common.execute("rmdir /S /Q %q", common.directory.apiEmmyLua)
common.execute("mkdir %q", common.directory.apiEmmyLua)

-- Write out global entries.
currentType = "api"
common.execute("mkdir %q", common.directory.apiEmmyLuaGlobals)
for k, v in pairs(data.globals) do
	writeOutDefinition(v, common.directory.apiEmmyLuaGlobals .. "/" .. k .. ".lua")
end

-- Write out type entries.
currentType = "type"
common.execute("mkdir %q", common.directory.apiEmmyLuaTypes)
for k, v in pairs(data.types) do
	writeOutDefinition(v, common.directory.apiEmmyLuaTypes .. "/" .. k .. ".lua")
end

-- Clean up any file handles.
common.cleanup()
