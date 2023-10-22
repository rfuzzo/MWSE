return {
	type = "method",
	description = [[This method fetches all of the script's variables as a table. Returns nil if the script has no variables.]],
	arguments = {
		{ name = "useLocals", type = "boolean", optional = true, description = "" },
	},
	returns = {{
		name = "results",
		type = "table<string, tes3scriptVariableData>|nil",
		description = [[A table with all of the script's variable names as keys.]]
	}},
}
