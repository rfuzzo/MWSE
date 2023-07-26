return {
	type = "function",
	description = [[This function is used to claim a unique spell effect name and id. This is needed before actually creating a new effect by calling `tes3.addMagicEffect()`. A claimed effect id is then available as: `tes3.effect.effectName` (just like any other spell effect). For examples of this function in practice see [`tes3.addMagicEffect()`](https://mwse.github.io/MWSE/apis/tes3/#tes3addmagiceffect) example.

You can read a list of already claimed magic effects [here](https://mwse.github.io/MWSE/references/magic-effects-modded/). The new magic effect's `id` should be higher than 142 (the last vanilla magic effect) and not already claimed.]],
	arguments = {
		{ name = "name", type = "string", description = "The name of the new spell effect. Must be unique. An error will be thrown if it's non-unique." },
		{ name = "id", type = "number", description = "A unique number representing the new spell effect. An error will be thrown if it's non-unique." },
	},
}
