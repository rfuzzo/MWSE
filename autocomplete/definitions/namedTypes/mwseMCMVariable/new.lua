return {
	type = "method",
	description = [[Creates a new variable of this type.]],
	arguments = {{
		name = "variable",
		type = "table|string",
		optional = true,
		description = "If passing only a string, it will be used as variable's id.",
		tableParams = {
			{ name = "id", type = "string", optional = true, description = "The unique identifier for the variable." },
			{ name = "inGameOnly", type = "boolean", optional = true, default = false, description = "If true, the setting containing this variable will be disabled if the game is on main menu." },
			{ name = "numbersOnly", type = "boolean", optional = true, default = false, description = "If true, only numbers will be allowed for this variable in TextFields." },
			{ name = "restartRequired", type = "boolean", optional = true, default = false, description = "If true, updating the setting containing this variable will notify the player to restart the game." },
			{ name = "restartRequiredMessage", type = "string", optional = true, description = " The default text is a localized version of: \"The game must be restarted before this change will come into effect.\"." },
			{ name = "converter", type = "fun(newValue): unknown", optional = true, description = "This function is called when the value of the variable is changed. The function can modify the new value before it is saved." },
		}
	}},
	returns = {{
		name = "variable", type = "mwseMCMVariable"
	}}
}
