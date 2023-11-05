--
-- EmmyLua meta files generator for MWSE-lua definitions.
--

local lfs = require("lfs")
local common = require("builders.common")

common.log("Starting build of EmmyLua meta files...")

-- Recreate meta folder.
local metaFolder = lfs.join(common.pathAutocomplete, "..\\misc\\package\\Data Files\\MWSE\\core\\meta")
lfs.remakedir(lfs.join(metaFolder, "function"))
lfs.remakedir(lfs.join(metaFolder, "lib"))
lfs.remakedir(lfs.join(metaFolder, "class"))
lfs.remakedir(lfs.join(metaFolder, "event"))

-- Base containers to hold our compiled data.
local globals = {}
local classes = {}
local events = {}


--
-- Utility functions.
--

common.log("Definitions folder: %s", common.pathDefinitions)

local function getPackageLink(package)
	local tokens = { common.urlBase, package.key }

	if (not package.parent) then
		if (package.type == "class") then
			tokens = { common.urlBase, "types", package.key }
		elseif (package.type == "function") then
			tokens = { common.urlBase, "apis", package.namespace }
		elseif (package.type == "event") then
			tokens = { common.urlBase, "events", package.key }
		end
	else
		local parentType = package.parent.type
		if (parentType == "lib") then
			local token = string.gsub("#" .. package.namespace, "%.", "")
			tokens = { common.urlBase, "apis", package.parent.namespace, token:lower() }
		elseif (parentType == "class") then
			tokens = { common.urlBase, "types", package.parent.key, "#" .. package.key:lower() }
		end
	end

	return table.concat(tokens, "/")
end

--- Only write table when necessary: for library packages or classes that
--- have one or more methods or functions. This the avoids creation of tables
--- in the global namespace for virtual types - types that only exist
--- in the annotations.
--- @param package packageClass
--- @return boolean
local function shouldCreateTable(package)
	return (
		package.type == "lib" or
		package.type == "class" and (
			package.methods and	#package.methods > 0 or
			package.functions and #package.functions > 0
		)
		or false
	)
end

local function writeExamples(package, file)
	if (package.examples) then
		file:write(string.format("---\n--- [Examples available in online documentation](%s).\n", getPackageLink(package)))
	end
end

local function formatLineBreaks(str)
	return string.gsub(str, "\n", "\n--- ")
end

local function formatDescription(description)
	return "--- " .. formatLineBreaks(description)
end

--- @param types string[]
local function insertNil(types)
	local hasNil = false
	for _, type in ipairs(types) do
		if type == "nil" then
			hasNil = true
		elseif type:startswith("fun(") then
			-- If the type ends with "|fun(): someReturnType", don't append nil
			-- at the end. That won't make the argument optional, but will
			-- change the type of the function's return value
			table.insert(types, #types, "nil")
			hasNil = true
			break
		end
	end
	if (not hasNil) then
		table.insert(types, "nil")
	end
end

local function getAllPossibleVariationsOfType(type, package)
	if (not type) then
		return nil
	end

	if (type:startswith("table<")) then
		local keyType, valueType, other = type:match("table<(.+), (.+)>(.*)")
		other = getAllPossibleVariationsOfType(other:sub(2), package)
		return string.format("table<%s, %s>%s%s",
			getAllPossibleVariationsOfType(keyType, package),
			getAllPossibleVariationsOfType(valueType, package),
			other ~= "" and "|" or "",
			other
		)
	end

	local types = {}
	for _, t in ipairs(string.split(type, "|")) do
		local strippedType = common.makeComplexType(t)
		local class = classes[strippedType.type]
		if (class) then
			if (class.allDescendentKeys) then
				for _, descendentType in ipairs(string.split(class.allDescendentKeys, "|")) do
					table.insert(types, common.makeTypeString(descendentType, strippedType.isOptional, strippedType.isArray))
				end
			else
				table.insert(types, t)
			end
		else
			table.insert(types, t)
		end
	end

	if (package.optional or package.default ~= nil) then
		-- If we only have one type, just add ? to it.
		if (#types == 1 and (not types[1]:startswith("fun("))) then
			if (not types[1]:endswith("?")) then
				types[1] = types[1] .. "?"
			end
		else
			-- Otherwise add `nil` to the list if it isn't already there.
			insertNil(types)
		end
	end

	return table.concat(types, "|")
end

local function getParamNames(package)
	local params = {}
	for _, param in ipairs(package.arguments or {}) do
		if (param.type == "variadic") then
			table.insert(params, "...")
		else
			table.insert(params, param.name or "unknown")
		end
	end
	return params
end

local function writeFunction(package, file, namespaceOverride)
	file:write(formatDescription(common.getDescriptionString(package)) .. "\n")
	writeExamples(package, file)

	if (package.deprecated or (package.parent and package.parent.deprecated)) then
		file:write("--- @deprecated\n")
	end

	local functionHasTableArguments = false

	for _, argument in ipairs(package.arguments or {}) do
		local type = argument.type
		local description = common.getDescriptionString(argument)
		if (argument.tableParams) then
			functionHasTableArguments = true
			local types = type:split("|")
			table.removevalue(types, "table")
			table.insert(types, package.namespace .. "." .. argument.name)

			type = table.concat(types, "|")
			description = "This table accepts the following values:"
			for _, tableArgument in ipairs(argument.tableParams) do
				description = description .. string.format("\n\n`%s`: %s — %s", tableArgument.name or "unknown", getAllPossibleVariationsOfType(tableArgument.type, tableArgument) or "any", formatLineBreaks(common.getDescriptionString(tableArgument)))
			end
		end
		if (argument.type == "variadic") then
			file:write(string.format("--- @param ... %s %s\n", getAllPossibleVariationsOfType(argument.variadicType, argument) or "any?", formatLineBreaks(description)))
		else
			file:write(string.format("--- @param %s %s %s\n", argument.name or "unknown", getAllPossibleVariationsOfType(type, argument), formatLineBreaks(description)))
		end
	end

	for _, returnPackage in ipairs(common.getConsistentReturnValues(package) or {}) do
		file:write(string.format("--- @return %s %s %s\n", getAllPossibleVariationsOfType(returnPackage.type, returnPackage) or "any", returnPackage.name or "result", formatLineBreaks(common.getDescriptionString(returnPackage))))
	end

	file:write(string.format("function %s(%s) end\n\n", namespaceOverride or package.namespace, table.concat(getParamNames(package), ", ")))

	if (functionHasTableArguments) then
		file:write(string.format("---Table parameter definitions for `%s`.\n", package.namespace))
		for _, argument in ipairs(package.arguments or {}) do
			if (argument.tableParams) then
				file:write(string.format("--- @class %s.%s\n", package.namespace, argument.name))

				for _, param in ipairs(argument.tableParams) do
					file:write(string.format("--- @field %s %s %s\n", param.name, getAllPossibleVariationsOfType(param.type, param), formatLineBreaks(common.getDescriptionString(param))))
				end
				file:write("\n")
			end
		end
	end
end


--
-- Compile data
--

common.compilePath(lfs.join(common.pathDefinitions, "global"), globals)
common.compilePath(lfs.join(common.pathDefinitions, "namedTypes"), classes, "class")
common.compilePath(lfs.join(common.pathDefinitions, "events", "standard"), events, "event")


--
-- Building
--

local function buildParentChain(className)
	local package = assert(classes[className])
	if (package.inherits) then
		return className .. ", " .. buildParentChain(package.inherits)
	end
	return className
end

--- @param namespace string Should look like: `"tes3.enumName.subEnumName"` or `"tes3.enumName"`. For example, `"tes3.activeBodyPart"` or `"tes3.dialoguePage.greeting"`.
--- @param keys string[] These are the keys of the table to build.
--- @param file file* The file to write to.
local function buildAlias(namespace, keys, file)
	file:write(string.format("--- @alias %s\n", namespace))
	for _, key in ipairs(keys) do
		if type(key) == "number" then
			key = "[" .. key .. "]"
		else
			-- Capture "^[_%a]" matches all the letters + underscore -> valid first letter of lua identifier
			-- Capture "[_%w]*$" matches all the letters + digits + underscore -> OK inside the key name
			local enclose = not key:match("^[_%a][_%w]*$")
			if enclose then
				key = "[\"" .. key .. "\"]"
			else
				key = "." .. key
			end
		end
		file:write(string.format("---| `%s%s`\n", namespace, key))
	end
	file:write("\n")
end

local function sortEnumsByFilename(A, B)
	return A.filename:lower() < B.filename:lower()
end

local function buildExternalRequires(package, file)
	local enumMap = common.getEnumerationsMap(package.key)
	-- Not every "lib" has enumeration tables (e.g. debuglib)
	if not enumMap then
		return
	end

	-- Let's sort the enumerations
	local enums = {}
	for filename, path in pairs(common.getEnumerationsMap(package.key)) do
		enums[#enums + 1] = {
			filename = filename,
			path = path,
		}
	end
	table.sort(enums, sortEnumsByFilename)

	for _, data in ipairs(enums) do
		local namespace = package.key .. "." .. data.filename
		file:write(string.format('%s = require("%s")\n\n', namespace, namespace))

		local enumerationTable = dofile(data.path)
		local keys = table.keys(enumerationTable, true)
		local hasSubtables = type(enumerationTable[keys[1]]) == "table"
		if hasSubtables then
			for subNamespace, subEnumeration in pairs(enumerationTable) do
				local completeNamespace = namespace .. "." .. subNamespace
				local keys = table.keys(subEnumeration, true)
				buildAlias(completeNamespace, keys, file)
			end
		else
			buildAlias(namespace, keys, file)
		end
	end
end

local function build(package)
	-- Load our base package.
	common.log("Building " .. package.type .. ": " .. package.key .. " ...")

	-- Get the package.
	local outDir = lfs.join(metaFolder, package.type)
	local parent = package.parent
	while (parent) do
		outDir = lfs.join(outDir, parent.key)
		parent = parent.parent
	end
	local outPath = lfs.join(outDir, package.key .. ".lua")

	-- Write our file. Mark as autogenerated.
	local file = assert(io.open(outPath, "w"))
	file:write("-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.\n")
	file:write("-- More information: https://github.com/MWSE/MWSE/tree/master/docs\n\n")

	-- Mark the file as a meta file.
	file:write("--- @meta\n")

	-- Write description.
	if (package.type == "lib") then
		file:write(formatDescription(common.getDescriptionString(package)) .. "\n")
		writeExamples(package, file)
		file:write(string.format("--- @class %slib\n", package.namespace))
	elseif (package.type == "class") then
		file:write(formatDescription(common.getDescriptionString(package)) .. "\n")
		writeExamples(package, file)
		file:write(string.format("--- @class %s%s\n", package.key, package.inherits and (" : " .. buildParentChain(package.inherits)) or ""))
	elseif (package.type == "event") then
		file:write(formatDescription(common.getDescriptionString(package)) .. "\n")
		writeExamples(package, file)
		file:write(string.format("--- @class %sEventData\n", package.key))
	elseif (package.type == "function") then
		writeFunction(package, file)
	end

	-- Write out operator overloads
	for _, operator in ipairs(package.operators or {}) do
		for _, overload in ipairs(operator.overloads) do
			-- Handle unary operators
			local rightSideType = ""
			if overload.rightType then
				rightSideType = string.format("(%s)", overload.rightType)
			end

			file:write(string.format("--- @operator %s%s: %s\n", operator.key, rightSideType, overload.resultType))
		end
	end

	-- Write out fields.
	for _, value in ipairs(package.values or {}) do
		if (not value.deprecated) then
			file:write(string.format("--- @field %s %s %s\n", value.key, getAllPossibleVariationsOfType(value.valuetype, value) or "any", formatLineBreaks(common.getDescriptionString(value))))
		end
	end

	-- Custom case: Write out event overrides.
	if (package.type == "lib" and package.key == "event") then
		file:write(string.format("--- @field register fun(eventId: string, callback: fun(e: table): boolean?, options: table?)\n"))
		for _, key in ipairs(table.keys(events, true)) do
			file:write(string.format("--- @field register fun(eventId: '\"%s\"', callback: fun(e: %sEventData): boolean?, options: table?)\n", key, key))
		end
	end

	-- Write out event data.
	if (package.type == "event") then
		local eventData = package.eventData or {}
		if (package.blockable and not eventData.blockable) then
			file:write("--- @field block boolean If set to `true`, vanilla logic will be suppressed. Returning `false` will set this to `true`.\n")
		end
		if (not eventData.claimable) then
			file:write("--- @field claim boolean If set to `true`, any lower-priority event callbacks will be skipped. Returning `false` will set this to `true`.\n")
		end

		local eventDataKeys = table.keys(eventData, true)
		for _, key in ipairs(eventDataKeys) do
			local data = eventData[key]
			if (not data.deprecated) then
				file:write(string.format("--- @field %s %s %s\n", key, getAllPossibleVariationsOfType(data.type, data) or "any", formatLineBreaks(common.getDescriptionString(data))))
			end
		end
	end

	-- Finalize the main class definition.
	if shouldCreateTable(package) then
		file:write(string.format("%s = {}\n\n", package.namespace))
	end

	-- Write out functions.
	for _, value in ipairs(package.functions or {}) do
		writeFunction(value, file)
	end

	-- Write out methods.
	if (package.type == "class") then
		for _, value in ipairs(package.methods or {}) do
			writeFunction(value, file, package.key .. ":" .. value.key)
		end
	end

	-- Bring in external packages and build sub-libraries.
	if (package.type == "lib") then
		buildExternalRequires(package, file)

		if (package.libs) then
			lfs.mkdir(lfs.join(outDir, package.key))
			for _, lib in pairs(package.libs) do
				build(lib)
			end
		end
	end

	-- Close up shop.
	file:close()
end

for _, package in pairs(globals) do
	build(package)
end

for _, package in pairs(classes) do
	build(package)
end

for _, package in pairs(events) do
	build(package)
end
