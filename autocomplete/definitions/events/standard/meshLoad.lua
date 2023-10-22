return {
	type = "event",
	description = "This event is triggered before a mesh is loaded. The path can be changed to instead load a different mesh.",
	related = { "keyframesLoad", "meshLoaded" },
	eventData = {
		["path"] = {
			type = "string",
			description = "The path to the mesh, relative to Data Files\\Meshes",
		},
	},
	filter = "path",
}
