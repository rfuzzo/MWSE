return {
	type = "function",
	description = [[Fetches the core game faction object for a given faction ID.]],
	arguments = {
		{ name = "id", type = "string" }
	},
	returns = { { name = "faction", type = "tes3faction" } },
}