return {
	type = "function",
	description = [[Sets the in- and out-scatter values for MGE. The result table of `getScattering` can be modified then passed to this function.]],
	arguments = {{
		name = "params",
		-- The type is set to union so we can pass the result table from
		-- the getScattering here without the type checker complaining
		type = "table|mgeScatteringTable",
		tableParams = {
			{ name = "inscatter", type = "tes3vector3|table" },
			{ name = "outscatter", type = "tes3vector3|table" },
		},
	}},
}
