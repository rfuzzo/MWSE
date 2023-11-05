return {
	type = "function",
	description = [[Sets the trap on a given reference.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "reference", type = "tes3reference|tes3mobileActor|string" },
			{ name = "spell", type = "tes3spell|string|nil", description = "Passing `nil` will untrap the object." },
		},
	}},
	returns = {{ name = "trapped", type = "boolean" }},
	examples = {
		["untrapping"] = {
			title = "Untrapping a door or container the player is looking at"
		},
	}
}