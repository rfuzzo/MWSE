return {
	type = "function",
	description = [[Loads a mesh file and provides a scene graph object.]],
	arguments = {
		{ name = "path", type = "string", description = "Path, relative to Data Files/Meshes." }
	},
	returns = { { name = "model", type = "niNode" } },
}