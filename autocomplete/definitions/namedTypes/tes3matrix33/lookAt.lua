return {
	type = "method",
	description = "Updates the matrix so that its forward and up vectors point toward the given directions.",
	arguments = {
		{ name = "forward", type = "tes3vector3" },
		{ name = "up",      type = "tes3vector3" },
	},
	examples = {
		["..\\..\\niSwitchNode\\niSwitchNode\\line"] = {
			title = "Using the `lookAt` method to rotate a scene graph line along the view direction"
		}
	}
}
