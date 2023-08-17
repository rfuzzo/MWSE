return {
	type = "method",
	description = [[Applies a coloring effect to the fader. A fader without a texture will apply a colouring effect over the screen. The colour set here can completely change the color of the fader's texture.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "color", type = "tes3vector3|number[]", description = "The RGB values to set in [0.0, 1.0] range. If passing an array, pass 3 numbers." },
			{ name = "flag", type = "boolean", optional = true, default = false },
		}
	}},
	valuetype = "boolean",
}