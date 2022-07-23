--
-- This file performs a check for common errors in autocomplete definitions.
--

local lfs = require("lfs")
local common = require("builders.common")

common.log("Analizing autocomplete defintions...")
-- Base containers to hold our compiled data.
local globals = {}
local classes = {}
local events = {}
local warnings = {}

-- Missing optional flag on arguments that have default values set.
local function checkFunction(package)
	for _, argument in ipairs(package.arguments or {}) do
		if argument.default and	argument.optional == nil then
			local warning = ("%s definition, argument: %s is missing `optional`, but provided `default`."):format(package.namespace, argument.name)
			table.insert(warnings, warning)
		end
	end
end

local function checkMissingDescription(package)
	if package.description == nil or package.description == "" then
		local warning = ("Missing description in %s definition."):format(package.namespace)
		table.insert(warnings, warning)
	end
end

local function check(package)
	if (package.type == "function") then
		checkFunction(package)
		checkMissingDescription(package)
	elseif (package.type == "class") then
		for _, package in ipairs(package.methods or {}) do
			checkFunction(package)
			checkMissingDescription(package)
		end
	elseif (package.type == "lib" and package.libs) then
		for _, lib in pairs(package.libs) do
			check(lib)
		end
	else
		checkMissingDescription(package)
	end
	for _, package in ipairs(package.functions or {}) do
		checkFunction(package)
		checkMissingDescription(package)
	end
	for _, property in ipairs(package.values or {}) do
		checkMissingDescription(property)
	end
end

--
-- Compile data
--

common.compilePath(lfs.join(common.pathDefinitions, "global"), globals)
common.compilePath(lfs.join(common.pathDefinitions, "namedTypes"), classes, "class")
common.compilePath(lfs.join(common.pathDefinitions, "events", "standard"), events, "event")

for _, package in pairs(globals) do
	check(package)
end

for _, package in pairs(classes) do
	check(package)
end

for _, package in pairs(events) do
	check(package)
end

table.sort(warnings)
io.createwith("warnings.txt", table.concat(warnings, "\n"))
common.log("Definitions checks complete. See warnings.txt for the results.")
