return {
	type = "function",
	description = [[Returns the complex name of a magic effect, taking into account attribute or skill values.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "effect", type = "tes3.effect", description = "The effect ID to get the name of. Maps to values in [`tes3.effect`](https://mwse.github.io/MWSE/references/magic-effects/) table." },
			{ name = "attribute", type = "tes3.attribute", optional = true, description = "The attribute ID to use, if applicable. Maps to values in [`tes3.attribute`](https://mwse.github.io/MWSE/references/attributes/) table." },
			{ name = "skill", type = "tes3.skill", optional = true, description = "The skill ID to use, if applicable. Maps to values in [`tes3.skill`](https://mwse.github.io/MWSE/references/skills/) table." },
		},
	}},
	returns = {
		{ name = "complexName", type = "string" }
	},
}