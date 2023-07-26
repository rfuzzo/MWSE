return {
	type = "function",
	description = [[Updates the journal index in a way similar to the mwscript function Journal.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "id", type = "tes3dialogue|string" },
			{ name = "index", type = "integer" },
			{ name = "speaker", type = "tes3mobileActor|tes3reference|string" },
			{ name = "showMessage", type = "boolean", optional = true, default = true, description = "If set, a message may be shown to the player." },
		},
	}},
	returns = {
		{ name = "wasUpdated", type = "boolean" },
	},
}