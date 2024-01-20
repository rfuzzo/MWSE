return {
	type = "function",
	description = [[Performs a binary search for a given value.

If the `value` is found, a table holding all the matching indices is returned. (e.g. `{ startindice, endindice }`.) If only one matching indice was found, `startindice` will be the same as `endindice`.

If `compval` is given, then it must be a function that takes one value and returns the value to use for comparisons. For example, to compare arrays based on their first entry, you can write `compvalue = function( value ) return value[1] end`.

If `reversed == true`, then the search assumes that `t` is sorted in reverse order (i.e., largest value at position 1). Note that specifying `reversed` requires specifying `compval`. You can circumvent this by passing `nil` for `compval`. e.g., `binsearch(tbl, value, nil, true)`.

Return value: on success: a table holding matching indices (e.g. { startindice, endindice } ) on failure: nil]],
	arguments = {
		{ name = "t", type = "table" },
		{ name = "value", type = "unknown", description="The value to search for." },
		{ name = "compval", type = "function", optional = true, description="A function that returns the value to use in comparisons." },
		{ name = "reversed", type = "boolean", optional = true, "If true, then `binsearch` will assume `t` is sorted in reverse order." },
	},
	valuetype = "table",
}