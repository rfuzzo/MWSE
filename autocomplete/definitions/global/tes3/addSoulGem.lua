return {
	type = "function",
	description = [[Causes a misc item to be recognized as a soul gem, so that it can be used for soul trapping.]],
	arguments = {{
		name = "params",
		type = "table",
		values = {
			{ name = "item", type = "tes3misc|string", description = "The item to recognize as a soul gem." },
		},
	}},
	returns = { { name = "wasAdded", type = "number" } },
}