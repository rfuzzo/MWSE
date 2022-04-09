local lfs = require("lfs")
local common = require("builders.common")

common.log("Starting build of EmmyLua aliases meta file...")

local outputFile = "..\\misc\\package\\Data Files\\MWSE\\core\\meta\\class\\aliases.lua"
local enumerationsFolder = "..\\misc\\package\\Data Files\\MWSE\\core\\lib\\tes3"

-- Allow require-ing the files.
package.path = enumerationsFolder .. "\\?.lua;" .. package.path

local blacklist = {
	["attributeName.lua"] = true,
	["init.lua"] = true,
	["scanCodeToNumber.lua"] = true,
	["skillName.lua"] = true,
	["specializationName.lua"] = true,
	["."] = true, -- Ignore the current folder, we only care about files.
	[".."] = true, -- Ignore the parent folder.
}

--- This function returns the list of files in `\misc\package\Data Files\MWSE\core\lib\tes3` that are suitable for EmmyLua aliases.
---@return table<number, string> fileNames
local function getFileList()
	local files = {}

	for entry in lfs.dir(enumerationsFolder) do
		if not blacklist[entry] then
			-- This will match the file name, but not the extension.
			-- For example, "actionFlag.lua" will match to "actionFlag".
			local file = entry:match("%a+")
			table.insert(files, file)
		end
	end

	return files
end

---@param prefix string Should look like: `"tes3.enumName.subEnumName"` or `"tes3.enumName"`.
---@param keys table<number, string> These are the keys of the table to build.
---@return string alias The compiled table that conforms to EmmyLua ---@alias annotation.
local function buildTable(prefix, keys)
	local out = {}
	local firstLine = string.format("---@alias %s \"%s.%s\"\n", prefix, prefix, keys[1])
	table.insert(out, firstLine)

	-- Skip the first line, since it was handled before.
	for i = 2, #keys, 1 do
		local line = string.format("---| \"%s.%s\"\n", prefix, keys[i])
		table.insert(out, line)
	end

	table.insert(out, "\n")
	out = table.concat(out)
	return out
end

---Builds an alias for a `tes3.` enumerations file.
---@param fileName string Needs to be the file name without extension. For example, "objectType".
---@return string out The EmmyLua alias annotation for the file.
local function build(fileName)
	common.log("Building alias for: tes3." .. fileName .. ".lua" .. " ...")

	local out = {}

	local enumeration = require(fileName)
	local keys = table.keys(enumeration)

	if type(enumeration[keys[1]]) == "table" then
		for subEnumName, subEnumeration in pairs(enumeration) do

			local prefix = string.format("tes3.%s.%s", fileName, subEnumName)
			local keys = table.keys(subEnumeration)

			table.insert(out, buildTable(prefix, keys))
		end
	else
		local prefix = string.format("tes3.%s", fileName)

		table.insert(out, buildTable(prefix, keys))
	end

	local out = table.concat(out)
	return out
end

---Builds EmmyLua aliases for provided `tes3.` enumeration files.
---@param files table<number, string> The values of the table need to be valid file names without extension. For example, "objectType".
---@return string out The EmmyLua alias annotation for provided files.
local function buildFiles(files)
	local out = {}

	for _, file in ipairs(files) do
		local alias = build(file)
		table.insert(out, alias)
	end

	out = table.concat(out)
	return out
end

local files = getFileList()
local out = buildFiles(files)

local f = io.open(outputFile, "w")
f:write("--- @meta\n\n")
f:write(out)
f:close()
