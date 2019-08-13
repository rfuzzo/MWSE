
--- Returns the number of elements inside the table. Unlike the length operator (#) this will work with any table.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/table/size.html).
---@type function
---@param t table
---@return number
function table.size(t) end

--- Returns a random element from the given table.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/table/choice.html).
---@type function
---@param t table
---@return any
function table.choice(t) end

--- Removes a value from a given table. Returns true if the value was successfully removed.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/table/removevalue.html).
---@type function
---@param t table
---@param value any
---@return boolean
function table.removevalue(t, value) end

--- Inserts a given value through BinaryInsert into the table sorted by [, comp].
---|
---|If 'comp' is given, then it must be a function that receives two table elements, and returns true when the first is less than the second, e.g. comp = function(a, b) return a > b end, will give a sorted table, with the biggest value on position 1. [, comp] behaves as in table.sort(table, value [, comp]) returns the index where 'value' was inserted
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/table/bininsert.html).
---@type function
---@param t table
---@param value any
---@param comp any { optional = "after" }
---@return number
function table.bininsert(t, value, comp) end

--- Shallowly copies a table's contents to a destination table. If no destination table is provided, a new table will be created. Note that sub tables will not be copied, and will still refer to the same data.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/table/copy.html).
---@type function
---@param from table
---@param to table { optional = "after" }
---@return table
function table.copy(from, to) end

--- Copies a table's contents. All subtables will also be copied, as will any metatable.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/table/deepcopy.html).
---@type function
---@param t table
---@return table
function table.deepcopy(t) end

--- Returns the key for a given value, or nil if the table does not contain the value.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/table/find.html).
---@type function
---@param t table
---@param value any
---@return any
function table.find(t, value) end

--- Performs a binary search for a given value.
---|
---|If the  value is found:
---|	It returns a table holding all the mathing indices (e.g. { startindice,endindice } )
---|	endindice may be the same as startindice if only one matching indice was found
---|If compval is given:
---|	then it must be a function that takes one value and returns a second value2,
---|	to be compared with the input value, e.g.:
---|	compvalue = function( value ) return value[1] end
---|If reversed is set to true:
---|	then the search assumes that the table is sorted in reverse order (largest value at position 1)
---|	note when reversed is given compval must be given as well, it can be nil/_ in this case
---|Return value:
---|	on success: a table holding matching indices (e.g. { startindice,endindice } )
---|	on failure: nil
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/table/binsearch.html).
---@type function
---@param t table
---@param value any
---@param compval any { optional = "after" }
---@param reversed any { optional = "after" }
---@return table
function table.binsearch(t, value, compval, reversed) end


