return {
	type = "method",
	description = [[Attempts to remove a decal at a given index.]],
	arguments = {
		{ name = "index", type = "ni.texturingPropertyMapType", description = "The index of the decal to remove. The available indices are between `ni.texturingPropertyMapType.decalFirst` and `ni.texturingPropertyMapType.decalLast`." },
	},
	returns = {
		{ name = "removed", type = "boolean", description = "True if the decal was removed." },
	},
}