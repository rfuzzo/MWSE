return {
	type = "method",
	description = [[This method returns the last rendered frame in the form of niPixelData.]],
	arguments = {
		{ name = "bounds", optional = true, type = "integer[]", description = "These four values are used to take only a specific sub region (in pixels) from the framebuffer. If not provided, the taken screenshot will include the whole screen." },
	},
	returns = {
		{ name = "screenshot", type = "niPixelData" },
	},
}
