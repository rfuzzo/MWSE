return {
	type = "function",
	description = [[Returns an actor's equipped item stack, provided a given filter]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "actor", type = "tes3reference|tes3mobileActor|tes3actor" },
			{ name = "enchanted", type = "boolean", optional = true, description = "If true, filters only enchanted items." },
			{ name = "objectType", type = "tes3.objectType", optional = true, description = "Maps to [`tes3.objectType`](https://mwse.github.io/MWSE/references/object-types/) constants. Used to filter equipment by type." },
			{ name = "slot", type = "tes3.armorSlot|tes3.clothingSlot", optional = true, description = "Maps to [`tes3.armorSlot`](https://mwse.github.io/MWSE/references/armor-slots/) or [`tes3.clothingSlot`](https://mwse.github.io/MWSE/references/clothing-slots/). Used to filter equipment by slot." },
			{ name = "type", type = "tes3.weaponType", optional = true, description = "Maps to [`tes3.weaponType`](https://mwse.github.io/MWSE/references/weapon-types/). Used to filter equipment by type." },
		},
	}},
	returns = {
		{ name = "stack", type = "tes3equipmentStack|nil", description = "The equipped stack, or `nil` if the queried stack was not found." },
	},
	examples = {
		["GetPlayerLight"] = {
			title = "Get Player’s Equipped Light",
			description = "In this example, we print the object ID of the player’s equipped light source.",
		},
		["GetPlayerShield"] = {
			title = "Get Player’s Shield",
			description = "This example shows the player’s shield.",
		},
	},
}
