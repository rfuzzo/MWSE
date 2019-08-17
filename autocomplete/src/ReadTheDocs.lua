
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


local url = {}
url.rtd = "https://mwse.readthedocs.io/en/latest"
url.rtdType = url.rtd .. "/lua/type"

--
-- Helper functions to produce the needed output.
--

local headers = {
	["h1"] = string.rep("#", 1),
	["h2"] = string.rep("#", 2),
	["h3"] = string.rep("#", 3),
	["h4"] = string.rep("#", 4),
	["h5"] = string.rep("#", 5),
}

local definitionWriters = {}

local function getFullAccesKey(def)
	if (def.parent) then
		return getFullAccesKey(def.parent) .. "." .. def.key
	else
		return def.key
	end
end

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

local function getIndentedString(description, indentLevel)
	local spacing = string.rep("&nbsp;", indentLevel or 4)
	return string.format("%s%s", spacing, description:gsub("\n", "\n" .. spacing))
end

local function getListedDescription(description)
	return string.format("> %s", description:gsub("\n", "\n> "))
end

local function getDefinitionLink(def, parent)
	return string.format("[%s](%s/%s.md)", def.key, parent.key, def.key)
end

local function getDefinitionReferenceLink(def, parent)
	return parent.key .. "/" .. def.key
end

local function writeTableOfContentsTree(file, path, def, elements, fallbackWriter)
	-- Write out the toctree.
	file:write("\n\n```eval_rst")
	file:write("\n.. toctree::")
	file:write("\n    :hidden:")
	file:write("\n")
	for _, element in ipairs(elements) do
		file:write(string.format("\n    %s", getDefinitionReferenceLink(element, def)))
		writeOutDefinition(element, path .. "/" .. def.key, fallbackWriter)
	end
	file:write("\n```")
end

local function getDetailedDescription(def, path)
	local optionalDescriptionPath = path .. "/" .. def.key .. "/description.md"
	if (common.fileExists(optionalDescriptionPath)) then
		return common.getFileContents(optionalDescriptionPath)
	else
		return def.description or "No description available."
	end
end

local function definitionSorter(a, b)
	return a.key < b.key
end

local function splitString(str, sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	str:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
 end

local function getTypeLink(def, root)
	local results = {}
	for _, i in ipairs(splitString(def.type, "\\|")) do
		if (data.types[i]) then
			table.insert(results, string.format("<a href=\"%s/lua/%s/%s.html\">%s</a>", url.rtd, root, i, i))
		else
			table.insert(results, i)
		end
	end
	return table.concat(results, "|")
end

local function getParamString(args, returns)
	if (args == nil or #args == 0) then
		return "()"
	end

	local result = ""

	local tableParams = #args == 1 and args[1].tableParams
	if (tableParams) then
		result = "({"
		for i, arg in ipairs(tableParams) do
			if (i ~= 1) then
				result = result .. ", "
			end
			result = result .. string.format("<i>%s:</i> %s", (arg.name or ("arg" .. i)), getTypeLink(arg, "type"))
		end
		result = result .. "})"
	else
		result = "("
		for i, arg in ipairs(args) do
			if (i ~= 1) then
				result = result .. ", "
			end
			result = result .. string.format("<i>%s:</i> %s", (arg.name or ("arg" .. i)), getTypeLink(arg, "type"))
		end
		result = result .. ")"
	end

	if (returns and #returns > 0) then
		result = result .. " -> "
		for i, rtn in ipairs(returns) do
			if (i ~= 1) then
				result = result .. ", "
			end
			if (rtn.name) then
				result = result .. string.format("<i>%s:</i> %s", rtn.name, getTypeLink(rtn, "type"))
			else
				result = result .. string.format("%s", getTypeLink(rtn, "type"))
			end
		end
	end

	return result
end

local function writeDictionary(file, def, elements, createLink)
	file:write("\n\n<dl class=\"describe\">")
	for _, element in ipairs(elements) do
		local title = element.name or element.key or "undefined"
		local addon = ""
		if (element.type == "function") then
			addon = getParamString(element.arguments, element.returns)
		elseif (element.type == "method") then
			addon = getParamString(element.arguments, element.returns)
		elseif (element.type == "metatable") then

		else
			addon = ": " .. string.format("<a href=\"%s/%s.html\">%s</a>", url.rtdType,  element.type, element.type)
		end

		if (createLink) then
			file:write(string.format("\n<dt><code class=\"descname\"><a href=\"%s\">%s</a>%s</code></dt>", def.key .. "/" .. element.key .. ".html", title, addon))
		else
			assert(title ~= nil)
			assert(addon ~= nil)
			file:write(string.format("\n<dt><code class=\"descname\">%s%s</code></dt>", title, addon))
		end
		file:write(string.format("\n<dd>\n\n%s\n\n</dd>", element.brief or element.description or "No description available."))
	end
	file:write("\n</dl>")
end

local function valueWriter(def, path)
	local file = io.open(path .. "/" .. def.key .. ".md", "w")
	file:write(headers.h1 .. " " .. def.key)

	file:write("\n\n" .. getDetailedDescription(def, path))

	file:write("\n")
	file:close()
	file = nil
end

definitionWriters["boolean"] = valueWriter
definitionWriters["string"] = valueWriter
definitionWriters["number"] = valueWriter

local function writeFunctionOrMethod(def, path, isMethod)
	local file = io.open(path .. "/" .. def.key .. ".md", "w")
	file:write(headers.h1 .. " " .. def.key)

	file:write("\n\n" .. getDetailedDescription(def, path))

	if (def.arguments and #def.arguments > 0) then
		file:write("\n\n" .. headers.h2 .. " Parameters")
		if (#def.arguments == 1 and def.arguments[1].tableParams and #def.arguments[1].tableParams > 0) then
			file:write("\n\nThis function accepts parameters through a table with the following named entries:")
			writeDictionary(file, def, def.arguments[1].tableParams, false)
		else
			writeDictionary(file, def, def.arguments, false)
		end
	end

	if (def.returns and #def.returns > 0) then
		file:write("\n\n" .. headers.h2 .. " Returns")
		writeDictionary(file, def, def.returns, false)
	end

	file:write("\n")
	file:close()
	file = nil
end

definitionWriters["method"] = function(def, path) writeFunctionOrMethod(def, path, true) end
definitionWriters["function"] = function(def, path) writeFunctionOrMethod(def, path, false) end

definitionWriters["class"] = function(def, path)
	local file = io.open(path .. "/" .. def.key .. ".md", "w")
	file:write(headers.h1 .. " " .. def.key)

	file:write("\n\n" .. getDetailedDescription(def, path))

	if (def.children) then
		local values = {}
		local functions = {}
		local methods = {}
		local metatables = {}

		for _, child in pairs(common.flattenChildren(def)) do
			if (child.type == "metatable") then
				table.insert(metatables, child)
			elseif (child.type == "function") then
				table.insert(functions, child)
			elseif (child.type == "method") then
				table.insert(methods, child)
			else
				table.insert(values, child)
			end
		end

		table.sort(values, definitionSorter)
		if (#values > 0) then
			file:write("\n\n" .. headers.h2 .. " Properties")
			writeDictionary(file, def, values)
		end

		table.sort(methods, definitionSorter)
		if (#methods > 0) then
			file:write("\n\n" .. headers.h2 .. " Methods")
			writeDictionary(file, def, methods)
		end

		table.sort(functions, definitionSorter)
		if (#functions > 0) then
			file:write("\n\n" .. headers.h2 .. " Functions")
			writeDictionary(file, def, functions)
		end

		table.sort(metatables, definitionSorter)
		if (#metatables > 0) then
			file:write("\n\n" .. headers.h2 .. " Metatable Events")
			writeDictionary(file, def, metatables)
		end
	end

	file:write("\n")
	file:close()
	file = nil
end

definitionWriters["table"] = function(def, path)
	local file = io.open(path .. "/" .. def.key .. ".md", "w")
	file:write(headers.h1 .. " " .. def.key)

	file:write("\n\n" .. getDetailedDescription(def, path))

	if (def.children) then
		local values = {}
		local functions = {}
		local methods = {}
		local metatables = {}

		common.execute("mkdir %q", path .. "/" .. def.key)

		for _, child in pairs(common.flattenChildren(def)) do
			if (child.type == "metatable") then
				table.insert(metatables, child)
			elseif (child.type == "function") then
				table.insert(functions, child)
			elseif (child.type == "method") then
				table.insert(methods, child)
			else
				table.insert(values, child)
			end
		end

		table.sort(values, definitionSorter)
		if (#values > 0) then 
			file:write("\n\n" .. headers.h2 .. " Values")
			writeDictionary(file, def, values, false)
		end

		table.sort(methods, definitionSorter)
		if (#methods > 0) then
			error("Table has methods!")
		end

		table.sort(functions, definitionSorter)
		if (#functions > 0) then
			file:write("\n\n" .. headers.h2 .. " Functions")
			writeTableOfContentsTree(file, path, def, functions)
			writeDictionary(file, def, functions, true)
		end

		table.sort(metatables, definitionSorter)
		if (#metatables > 0) then
			error("Table has metatable events!")
		end
	end

	file:write("\n")
	file:close()
	file = nil
end


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
