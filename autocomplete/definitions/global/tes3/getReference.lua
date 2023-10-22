return {
	type = "function",
	description = [[Fetches the first reference for a given base object ID.]],
	arguments = {
		{ name = "id", optional = true, type = "string", description = [[Passing "player" or "playersavegame" will return the player reference.]] }
	},
	returns = {{ name = "reference", type = "tes3reference" }}
}