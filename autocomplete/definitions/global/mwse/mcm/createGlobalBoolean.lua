return {
	type = "function",
	description = [[Creates a new GlobalBoolean variable.]],
	arguments = {{
		name = "variable",
		type = "table|string",
		description = "If passing only a string, it will be used as variable's id.",
		tableParams = {
			{ name = "id", type = "string", description = "The id of the Morrowind Global." },
		}
	}},
	returns = {
		{ name = "variable", type = "mwseMCMGlobalBoolean" }
	}
}
