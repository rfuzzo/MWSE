return {
	type = "function",
	description = [[This function returns the total effective magnitude and total base magnitude of a certain magic effect affecting a reference. It returns a pair of numbers, the first being the effective magnitude after all the actor's resistances are applied (see examples). The second number is the magnitude before any of the actor's resistances are applied.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "reference", type = "tes3reference|tes3mobileActor|string", description = "An associated mobile should exist for this function to be able to work." },
			{ name = "effect", type = "tes3.effect", description = "Effect ID. Can be any of the predefined spell effects, or one added by `tes3.claimSpellEffectId()`. Maps to values of [`tes3.effect`](https://mwse.github.io/MWSE/references/magic-effects/) constants" },
			{ name = "skill", optional = true, default = -1, type = "tes3.skill", description = "If effect parameter specified is: Absorb, Damage, Drain, Fortify or Restore Skill, a skill should be provided. This also applies to any custom spell effect which operates on a certain skill. This value maps to [`tes3.skill`](https://mwse.github.io/MWSE/references/skills/) constants." },
			{ name = "attribute", optional = true, default = -1, type = "tes3.attribute", description = "If effect parameter specified is: Absorb, Damage, Drain, Fortify or Restore Attribute, an attribute should be provided. This also applies to any custom spell effect which operates on a certain attribute. This value maps to [`tes3.attribute`](https://mwse.github.io/MWSE/references/attributes/) constants." },
		},
	}},
	returns = {
		{ name = "effectiveMagnitude", type = "number", description = "The effective magnitude after all the actor's resistances are applied." },
		{ name = "magnitude", type = "integer", description = "The magnitude before any of the actor's resistances are applied." },
	},
	examples = {
		["getOneMagnitude"] = {
			title = "Get magnitude after resistances are applied.",
			description = "You can treat the function as if it returns a single value.",
		},
		["getBothMagnitudes"] = {
			title = "Get both magnitudes.",
		},
	},
}
