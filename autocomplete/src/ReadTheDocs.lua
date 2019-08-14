
package.path = package.path .. ";./src/?.lua"

local json = require("dkjson")

-- Setup base module.
local common = require("common")
common.setLogFile("ReadTheDocs.log")
local data = nil

-- Setup some common directories for this project.
common.directory.docs = common.directory.root .. "/../docs/source/lua"
common.directory.docsAPI = common.directory.docs .. "/api"
common.directory.docsEvent = common.directory.docs .. "/event"
common.directory.docsType = common.directory.docs .. "/type"


--
-- Helper functions to produce the needed output.
--

local headerDividerLength = 100

local headers = {
	["h1"] = string.rep("#", 1),
	["h2"] = string.rep("#", 2),
	["h3"] = string.rep("#", 3),
	["h4"] = string.rep("#", 4),
	["h5"] = string.rep("#", 5),
}

local function getFullAccesKey(def)
	if (def.parent) then
		return getFullAccesKey(def.parent) .. "." .. def.key
	else
		return def.key
	end
end

local function definitionSorter(a, b)
	return a.key < b.key
end

local definitionWriters = {}

local function writeOutDefinition(def, path, fallback)
	local key = getFullAccesKey(def)
	local writer = definitionWriters[def.type] or fallback
	if (writer) then
		common.log("Writing definition: %s -> %s.md", key, path)
		writer(def, path)
	else
		common.log("No writer found '%s'. Type '%s' has no writer defined.", key, def.type)
	end
end

local function valueWriter(def, path)
	local file = io.open(path .. "/" .. def.key .. ".md", "w")
	file:write(headers.h1 .. " " .. def.key)

	local optionalDescriptionPath = path .. "/" .. def.key .. "/description.md"
	if (common.fileExists(optionalDescriptionPath)) then
		file:write("\n\n" .. common.getFileContents(optionalDescriptionPath))
	else
		file:write("\n\n" .. (def.description or "No description available."))
	end

	file:write("\n")
	file:close()
	file = nil
end

local function getIndentedString(description, indentLevel)
	local spacing = string.rep("&nbsp;", indentLevel or 4)
	return string.format("%s%s", spacing, description:gsub("\n", "\n" .. spacing))
end

local function getListedDescription(description)
	return string.format("> %s", description:gsub("\n", "\n >"))
end

local function getDefinitionLink(def, parent)
	return string.format("[%s](%s/%s.md)", def.key, parent.key, def.key)
end

local function getDefinitionReferenceLink(def, parent)
	return parent.key .. "/" .. def.key
end

definitionWriters["boolean"] = valueWriter
definitionWriters["string"] = valueWriter
definitionWriters["number"] = valueWriter

local function writeFunctionOrMethod(def, path, isMethod)
	local file = io.open(path .. "/" .. def.key .. ".md", "w")
	file:write(headers.h1 .. " " .. def.key)

	local optionalDescriptionPath = path .. "/" .. def.key .. "/description.md"
	if (common.fileExists(optionalDescriptionPath)) then
		file:write("\n\n" .. common.getFileContents(optionalDescriptionPath))
	else
		file:write("\n\n" .. (def.description or "No description available."))
	end

	file:write("\n")
	file:close()
	file = nil
end

definitionWriters["method"] = function(def, path) writeFunctionOrMethod(def, path, true) end
definitionWriters["function"] = function(def, path) writeFunctionOrMethod(def, path, false) end

local function writeClassOrTable(def, path, isClass)
	local file = io.open(path .. "/" .. def.key .. ".md", "w")
	file:write(headers.h1 .. " " .. def.key)

	local optionalDescriptionPath = path .. "/" .. def.key .. "/description.md"
	if (common.fileExists(optionalDescriptionPath)) then
		file:write("\n\n" .. common.getFileContents(optionalDescriptionPath))
	else
		file:write("\n\n" .. (def.description or "No description available."))
	end

	if (def.children) then
		local values = {}
		local functions = {}
		local methods = {}

		common.execute("mkdir %q", path .. "/" .. def.key)

		for _, child in pairs(common.flattenChildren(def)) do
			if (child.type ~= "function" and child.type ~= "method") then
				table.insert(values, child)
			elseif (isClass and false) then
				table.insert(methods, child)
			else
				table.insert(functions, child)
			end
		end

		table.sort(values, definitionSorter)
		if (#values > 0) then
			file:write("\n\n" .. headers.h2 .. " Values")

			-- Write out the toctree.
			file:write("\n\n```eval_rst")
			file:write("\n.. toctree::")
			file:write("\n    :hidden:")
			file:write("\n")
			for _, value in ipairs(values) do
				file:write(string.format("\n    %s", getDefinitionReferenceLink(value, def)))
			end
			file:write("\n```")

			for _, value in ipairs(values) do
				file:write(string.format("\n\n%s %s", headers.h4, getDefinitionLink(value, def)))
				file:write(string.format("\n\n%s", getListedDescription(value.brief or value.description or "No description available.")))
				writeOutDefinition(value, path .. "/" .. def.key, valueWriter)
			end
		end

		table.sort(methods, definitionSorter)
		if (#methods > 0) then
			file:write("\n\n" .. headers.h2 .. " Methods")

			-- Write out the toctree.
			file:write("\n\n```eval_rst")
			file:write("\n.. toctree::")
			file:write("\n    :hidden:")
			file:write("\n")
			for _, method in ipairs(methods) do
				file:write(string.format("\n    %s", getDefinitionReferenceLink(method, def)))
			end
			file:write("\n```")

			for _, method in ipairs(methods) do
				file:write(string.format("\n\n%s %s", headers.h4, getDefinitionLink(method, def)))
				file:write(string.format("\n\n%s", getListedDescription(method.brief or method.description or "No description available.")))
				writeOutDefinition(method, path .. "/" .. def.key)
			end
		end

		table.sort(functions, definitionSorter)
		if (#functions > 0) then
			file:write("\n\n" .. headers.h2 .. " Functions")

			-- Write out the toctree.
			file:write("\n\n```eval_rst")
			file:write("\n.. toctree::")
			file:write("\n    :hidden:")
			file:write("\n")
			for _, fn in ipairs(functions) do
				file:write(string.format("\n    %s", getDefinitionReferenceLink(fn, def)))
			end
			file:write("\n```")

			for _, fn in ipairs(functions) do
				file:write(string.format("\n\n%s %s", headers.h4, getDefinitionLink(fn, def)))
				file:write(string.format("\n\n%s", getListedDescription(fn.brief or fn.description or "No description available.")))
				writeOutDefinition(fn, path .. "/" .. def.key)
			end
		end
	end

	file:write("\n")
	file:close()
	file = nil
end

definitionWriters["class"] = function(def, path) writeClassOrTable(def, path, true) end
definitionWriters["table"] = function(def, path) writeClassOrTable(def, path, false) end


--
-- Build and write the output.
--

data = common.buildDatabase()

-- Prepare writers for all the named types.
for k, _ in pairs(data.types) do
	definitionWriters[k] = valueWriter
end

-- Clear out old folders.
common.execute("rmdir /S /Q %q", common.directory.docsAPI)
common.execute("rmdir /S /Q %q", common.directory.docsEvent)
common.execute("rmdir /S /Q %q", common.directory.docsType)

-- Write out global entries.
common.execute("mkdir %q", common.directory.docsAPI)
for _, v in pairs(data.globals) do
	writeOutDefinition(v, common.directory.docsAPI)
end

-- Write out type entries.
common.execute("mkdir %q", common.directory.docsType)
for _, v in pairs(data.types) do
	writeOutDefinition(v, common.directory.docsType)
end

-- Clean up any file handles.
common.cleanup()
