return {
	type = "function",
	description = [[Finds a cell, either by an id, by an object position (finds an exterior cell), or by an X/Y grid position. Returns `nil` if the cell id cannot be found or the cell does not exist at a position.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "id", type = "string", optional = true, description = "The cell's ID. If not provided, position or x and y must be." },
			{ name = "position", type = "tes3vector3|number[]", optional = true, description = "A point in an exterior cell."},
			{ name = "x", type = "number", optional = true, description = "The X grid-position." },
			{ name = "y", type = "number", optional = true, description = "The Y grid-position." },
		},
	}},
	returns = "cell",
	valuetype = "tes3cell",
}
