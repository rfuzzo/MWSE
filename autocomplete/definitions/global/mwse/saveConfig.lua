return {
	type = "function",
	description = [[Saves a config table to Data Files\MWSE\config\{fileName}.json.]],
	arguments = {
		{ name = "fileName", type = "string" },
		{ name = "object", type = "any" },
		{ name = "config", type = "table", optional = true },
	},
	returns = { { type = "table" } },
}