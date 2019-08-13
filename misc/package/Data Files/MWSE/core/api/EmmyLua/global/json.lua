
--- Saves a serializable table to Data Files\MWSE\{fileName}.json, using json.encode.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/json/savefile.html).
---@type function
---@param fileName string
---@param object any
---@param config table { optional = "after" }
function json.savefile(fileName, object, config) end

--- Current version of dkjson.
---@type string
json.version = "dkjson 2.5"

--- Quote a UTF-8 string and escape critical characters using JSON escape sequences. This function is only necessary when you build your own __tojson functions.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/json/quotestring.html).
---@type function
---@param s string
---@return string
function json.quotestring(s) end

--- Create a string representing the object. Object can be a table, a string, a number, a boolean, nil, json.null or any object with a function __tojson in its metatable. A table can only use strings and numbers as keys and its values have to be valid objects as well. It raises an error for any invalid data types or reference cycles.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/json/encode.html).
---@type function
---@param object any
---@param state table
---@return string
function json.encode(object, state) end

--- You can use this value for setting explicit null values.
---@type number
json.null = nil

--- Decode string into a table.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/json/decode.html).
---@type function
---@param s string
---@param position number
---@param nullValue any
---@return table
function json.decode(s, position, nullValue) end

--- Loads the contents of a file through json.decode. Files loaded from Data Files\MWSE\{fileName}.json.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/json/loadfile.html).
---@type function
---@param fileName string
---@return table
function json.loadfile(fileName) end


