return {
	type = "function",
	description = [[Attempts to determine if a given Morrowind Code Patch feature is enabled. This may not be possible, in which case nil will be returned.]],
	arguments = {
		{ name = "id", type = "tes3.codePatchFeature", description = "The id of the feature. Maps to values in [`tes3.codePatchFeature`](https://mwse.github.io/MWSE/references/code-patch-features/) constants." }
	},
	returns = { name = "state", type = "boolean|nil" },
}