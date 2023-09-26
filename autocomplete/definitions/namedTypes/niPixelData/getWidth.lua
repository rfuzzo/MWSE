return {
	type = "method",
	description = [[Returns the width of the mipmap level at the given index, where level 1 is the finest (largest) mipmap level, and level `mipMapLevels` is the coarsest (smallest) mipmap level.]],
	arguments = {
		{ name = "mipMapLevel", type = "number", optional = true, default = 1 },
	},
	valuetype = "number",
}