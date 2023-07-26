return {
	type = "function",
	description = [[Gets the current region the player is in. This checks the player's current cell first, but will fall back to the last exterior cell.]],
	arguments = {{
		name = "params",
		type = "table",
		optional = true,
		tableParams = {
			{ name = "useDoors", type = "boolean", optional = true, default = false }
		}
	}},
	returns = {
		{ name = "region", type = "tes3region|nil" }
	}
}