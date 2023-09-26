return {
	type = "class",
	description = [[A ConfigVariable fetches a json file from a given path and stores the variable in the id field in that file. If no config file of that name exists yet, it will create it.

The ConfigVariable saves to the config file every time the setting is updated. It is generally recommended you use TableVariable and save the config using `template.saveOnClose()` instead, especially if you are using a setting where updates happen frequently such as with sliders.]],
	inherits = "mwseMCMVariable"
}
