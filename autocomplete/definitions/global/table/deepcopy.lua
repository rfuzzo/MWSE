return {
	type = "function",
	description = [[Copies a table's contents. All subtables will also be copied, as will any metatable.]],
	arguments = {
		{ name = "t", type = "table" },
	},
	returns = { { type = "table" } },
}