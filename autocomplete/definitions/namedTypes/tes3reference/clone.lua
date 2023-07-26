return {
	type = "method",
	description = [[Clones a reference for a base actor into a reference to an instance of that actor. For example, this will force a container to resolve its leveled items and have its own unique inventory. Also, marks the new cloned reference as modified.]],
	returns = {{
		name = "cloned",
		type = "boolean",
		description = [[Returns `true` if the reference was successfully cloned. Returns `false` if the reference was already cloned or can't be cloned.]],
	}}
}