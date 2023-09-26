return {
	type = "class",
	description = [[Base class that represents the nodes of a scene graph. A node can have any number of child nodes.]],
	inherits = "niAVObject",
	examples = {
		["attaching"] = {
			title = "Adding new shapes to the scene graph",
			description = "The most basic of the scene graph operations is attaching. Attaching a node to the elements of the scene graph will make it visible.",
		},
		["attachToActor"] = {
			title = "Attaching a mesh directly to the actor's scene graph",
		},
		["perpendicular"] = {
			title = "Orienting an object so that it's perpendicular to the surface.",
			description = "In this example the unit arrows are placed perpendicular to the surface in the direction the player is looking at.",
		},
	}
}