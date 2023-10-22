return {
	type = "method",
	description = [[Calculates the dot product with another vector.]],
	arguments = {
		{ name = "vec", type = "tes3vector3" },
	},
	returns = { type = "number", name = "result" },
	examples = {
		["..\\..\\niSwitchNode\\niSwitchNode\\reflection"] = {
			title = "The visualization of vector reflection",
			description = "outDirection = inDirection - (normal * inDirection:dot(normal) * 2)"
		}
	}
}