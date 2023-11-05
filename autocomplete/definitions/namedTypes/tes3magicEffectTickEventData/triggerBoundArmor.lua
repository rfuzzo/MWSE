return {
	type = "method",
	description = [[Performs vanilla armor summoning logic. It can summon one or two armor objects with provided ID(s).]],
	arguments = {
		{ name = "id",  type = "string", description = "The ID of the armor object to summon." },
		{ name = "id2", type = "string", optional = true, description = "The ID of the additional armor object to summon." },
	},
}
