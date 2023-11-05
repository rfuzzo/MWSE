return {
	type = "function",
	description = [[Registers a new clothing slot. Adds a new place for clothing pieces with a matching slot number to equip to.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "slot", type = "number", description = "Clothing slot number. A number greater than 9 to configure a slot for." },
			{ name = "name", type = "string", description = "The human-readable name for the clothing slot." },
			{ name = "key", type = "string", optional = true, description = "The key placed in the `tes3.clothingSlot` table. If no key is provided, the name will be used." },
		},
	}},
}
