return {
	type = "class",
	description = [[A TableVariable takes a lua table and stores the variable in the `id` field in that table.

The TableVariable can be used to save multiple changes to a config file only when the menu is closed. Load the config file with `mwse.loadConfig()`, pass it to any TableVariables in your MCM, and then save it using the `template:saveOnClose()` function.]],
	inherits = "mwseMCMVariable",
}
