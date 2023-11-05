return {
	type = "function",
	description = [[Creates a new ConfigVariable.]],
	arguments = {{
		name = "variable",
		type = "table",
		tableParams = {
			{ name = "id", type = "string", description = "Key in the config file used to store the variable." },
			{ name = "path", type = "string", description = "Location of the config file relative to Data `Files/MWSE/config/`." },
			{ name = "defaultSetting", type = "unknown", optional = true, description = "If there is no value stored by the `id` key in the config file, it will be initialized to this value." },
			{ name = "inGameOnly", type = "boolean", optional = true, default = false, description = "If true, the setting containing this variable will be disabled if the game is on main menu." },
			{ name = "numbersOnly", type = "boolean", optional = true, default = false, description = "If true, only numbers will be allowed for this variable in TextFields." },
			{ name = "restartRequired", type = "boolean", optional = true, default = false, description = "If true, updating the setting containing this variable will notify the player to restart the game." },
			{ name = "restartRequiredMessage", type = "string", optional = true, description = " The default text is a localized version of: \"The game must be restarted before this change will come into effect.\"." },
			{ name = "converter", type = "fun(newValue): unknown", optional = true, description = "This function is called when the value of the variable is changed. The function can modify the new value before it is saved." },
		}
	}},
	returns = {{
		name = "variable", type = "mwseMCMConfigVariable"
	}}
}
