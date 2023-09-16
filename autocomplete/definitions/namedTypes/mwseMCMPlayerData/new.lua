return {
	type = "method",
	description = [[Creates a new variable of this type.]],
	arguments = {{
		name = "variable",
		type = "table",
		tableParams = {
			{ name = "id", type = "string", description = "Key of entry used on the `tes3.player.data` table." },
			{ name = "path", type = "string", description = "Path to `id` relative to `tes3.player.data`. The subtable keys need to be split by dots. It's best to at least store all your mwseMCMPlayerData fields in a table named after your mod to avoid conflicts." },
			{ name = "defaultSetting", type = "unknown", optional = true, description = "If `id` does not exist in the `tes3.player.data` field, it will be initialized to this value. It's best to initialize this yourself though, as this will not create the value until you've entered the MCM." },
			{ name = "restartRequired", type = "boolean", optional = true, default = false, description = "If true, updating the setting containing this variable will notify the player to restart the game." },
			{ name = "restartRequiredMessage", type = "string", optional = true, description = " The default text is a localized version of: \"The game must be restarted before this change will come into effect.\"." },
			{ name = "converter", type = "fun(newValue): unknown", optional = true, description = "This function is called when the value of the variable is changed. The function can modify the new value before it is saved." },
		}
	}},
	returns = {{
		name = "variable", type = "mwseMCMPlayerData"
	}}
}