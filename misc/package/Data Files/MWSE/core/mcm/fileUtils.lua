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
    -- "Page" instead of "Page.lua"
    local className = fileName:sub(1, fileName:len() - 4) 
    -- "mcm.components.pages.Page" instead of "data files\\mwse\\core\\mcm\\components\\pages\\Page.lua"
    local luaPath = filePath:sub(1 + prefixLength, filePath:len() - 4):gsub("[\\/]", ".")
	componentPaths[className] = luaPath
end
-- Add backwards compatibility by redirecting old component names to new ones.
componentPaths.HyperLink = componentPaths.Hyperlink
componentPaths.SidebarPage = componentPaths.SideBarPage

for filePath, dir, fileName in lfs.walkdir("data files\\mwse\\core\\mcm\\variables\\") do
    local className = fileName:sub(1, fileName:len() - 4) 
    local luaPath = filePath:sub(1 + prefixLength, filePath:len() - 4):gsub("[\\/]", ".")
	variablePaths[className] = luaPath
end

local components = {}
local variables = {}

---@protected
---@param className string The name of the class of the `mwseMCMComponent` to search for.
---@return mwseMCMComponent?
function fileUtils.getComponentClass(className)
	local class = components[className]
	if class then return class end

	local luaPath = componentPaths[className]
    if not luaPath then return end
    class = include(luaPath)
    if not class or type(class) ~= "table" then return end

    class.class = className -- Store it now so we don't have to do this every time.
    components[className] = class
    return class
end

---@protected
---@param className string The name of the class of the `mwseMCMVariable` to search for.
---@return mwseMCMVariable?
function fileUtils.getVariableClass(className)
	local class = variables[className]
	if class then return class end
	local luaPath = variablePaths[className]

    if not luaPath then return end
    class = include(luaPath)
    if not class or type(class) ~= "table" then return end

    class.class = className -- Store it now so we don't have to do it every time.
    variables[className] = class
    return class
end

return fileUtils