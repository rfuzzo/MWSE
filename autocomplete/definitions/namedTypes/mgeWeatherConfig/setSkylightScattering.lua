return {
	type = "function",
	description = [[Sets the sky scatter values for MGE. The result table of `getSkylightScattering` can be modified then passed to this function.]],
	arguments = {{
		name = "params",
		-- The type is set to union so we can pass the result table from
		-- the getSkylightScattering here without the type checker complaining
		type = "table|mgeSkylightScatteringTable",
		tableParams = {
			{ name = "skylight", type = "tes3vector3|table" },
			{ name = "mix", type = "number", optional = true, default = 0.44 },
		},
	}},
}
