return {
	type = "method",
	description = [[Returns the index of a first effect of a given effectId in the parent tes3alchemy object.]],
	arguments = {
		{ name = "effectId", type = "tes3.effect", description = [[The effectId to perform a check for. Maps to [`tes3.effect`](https://mwse.github.io/MWSE/references/magic-effects/) constants.]] },
	},
	returns = { name = "index", type = "number" },
}
