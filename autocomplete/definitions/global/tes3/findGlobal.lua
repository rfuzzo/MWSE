return {
	type = "function",
	description = [[Fetches the core game object that represents a global variable.]],
	arguments = {
		{ name = "id", type = "string" }
	},
	returns = { { name = "globalVariable", type = "tes3globalVariable" } },
}