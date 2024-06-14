-- Fetches Components and Variables by class name.
-- Intended for internal use only.
local fileUtils = {}



local prefixLength = string.len("Data Files\\MWSE\\core\\")

-- Store component/variable paths so we only have to iterate the directory once. 
-- (Testing has shown this results in a noticeable boost in performance.)

local componentPaths = {}
local variablePaths = {}

for filePath, dir, fileName in lfs.walkdir("data files\\mwse\\core\\mcm\\components\\") do
	-- For example, when adding the path of `mwseMCMPage`:
	-- The key   will be:  "Page" 
	--        instead of:  "Page.lua"
	-- The value will be:  "mcm.components.pages.Page" 
	-- 		  instead of:  "data files\\mwse\\core\\mcm\\components\\pages\\Page.lua"
	componentPaths[fileName:sub(1, fileName:len() - 4)] = filePath:sub(1 + prefixLength, filePath:len() - 4):gsub("[\\/]", ".")
end

for filePath, dir, fileName in lfs.walkdir("data files\\mwse\\core\\mcm\\variables\\") do
	variablePaths[fileName:sub(1, fileName:len() - 4)] = filePath:sub(1 + prefixLength, filePath:len() - 4):gsub("[\\/]", ".")
end

local components = {}
local variables = {}

---@protected
---@param className string The name of the class of the `mwseMCMComponent` to search for.
---@return mwseMCMComponent?
function fileUtils.getComponentClass(className)
	local class = components[className]
	if class then return class end
	if className == "HyperLink" then
		return fileUtils.getComponentClass("Hyperlink")
	end
	if className == "SidebarPage" then
		return fileUtils.getComponentClass("SideBarPage")
	end
	local luaPath = componentPaths[className]
	if luaPath then
		class = include(luaPath)
		if class and type(class) == "table" then
			class.class = className -- Store it now so we don't have to do this every time.
			components[className] = class
			return class
		end
	end
end

---@protected
---@param className string The name of the class of the `mwseMCMVariable` to search for.
---@return mwseMCMVariable?
function fileUtils.getVariableClass(className)
	local class = variables[className]
	if class then return class end
	local luaPath = variablePaths[className]
	if luaPath then
		class = include(luaPath)
		if class and type(class) == "table" then
			class.class = className -- Store it now so we don't have to do it every time.
			variables[className] = class
			return class
		end
	end
end

return fileUtils