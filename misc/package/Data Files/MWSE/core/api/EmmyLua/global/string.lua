
--- Returns true if a string ends with a given pattern.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/string/endswith.html).
---@type function
---@param s string
---@param pattern string
---@return boolean
function string.endswith(s, pattern) end

--- This function creates a string, given various values. The format follows the printf format, with the additional option of %q to automatically quote a string.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/string/format.html).
---@type function
---@param format string { comment = "The format string to use for the output." }
---@param arg2 values { comment = "Values to format into the given string.", optional = "after" }
---@return string
function string.format(format, arg2) end

--- Returns true if a string begins with a given pattern.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/string/startswith.html).
---@type function
---@param s string
---@param pattern string
---@return boolean
function string.startswith(s, pattern) end


