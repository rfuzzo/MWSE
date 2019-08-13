
--- Loads the given module. The function starts by looking into the package.loaded table to determine whether modname is already loaded. If it is, then require returns the value stored at package.loaded[modname]. Otherwise, it tries to find a loader for the module. If no module could be found, it returns nil instead of erroring.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/include.html).
---@type function
---@param modname string { special = "require:1" }
---@return table 
function include(modname) end


