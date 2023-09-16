return {
	type = "method",
	description = [[Creates a new variable of this type.]],
	arguments = {{
		name = "variable",
		type = "table|string",
		description = "If passing only a string, it will be used as variable's id.",
		tableParams = {
			{ name = "id", type = "string", description = "The id of the Morrowind Global." },
			{ name = "numbersOnly", type = "boolean", optional = true, default = false, description = "If true, only numbers will be allowed for this variable in TextFields." },
			{ name = "converter", type = "fun(newValue): unknown", optional = true, description = "This function is called when the value of the variable is changed. The function can modify the new value before it is saved." },
		}
	}},
	returns = {{
		name = "variable", type = "mwseMCMGlobal"
	}}
}
