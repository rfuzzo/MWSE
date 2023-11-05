return {
	type = "function",
	deprecated = true,
	description = [[Use [`tes3.createObject()`](https://mwse.github.io/MWSE/apis/tes3/#tes3createobject) instead. This function created a new enchantment object, which will be stored as part of the current saved game.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "id", type = "string", optional = true, description = "The new object's ID. Must be unique if provided." },
			{ name = "castType", type = "tes3.enchantmentType", optional = false, description = "The enchantment castType. See [`tes3.enchantmentType`](https://mwse.github.io/MWSE/references/enchantment-types/) constants." },
			{ name = "chargeCost", type = "number", optional = false, description = "The new enchantment charge cost. Must be greater than `0`." },
			{ name = "maxCharge", type = "number", optional = false, description = "The new enchantment maximum charge. Must be greater than `0`" },
			{ name = "flags", type = "number", optional = true, description = "The new enchantment flags." },
			{ name = "objectFlags", type = "number", default = 0, description = "The object flags initially set. Force set as modified." }
		},
	}},
	returns = {
		{ name = "newObject", type = "tes3enchantment" },
	}
}
