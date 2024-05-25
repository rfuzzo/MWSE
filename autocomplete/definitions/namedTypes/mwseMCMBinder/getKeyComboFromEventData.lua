return {
	type = "method",
	description = [[Used to convert raw input event data into `mwseKeyMouseCombo`. This method needs to be implemented in children of Binder.]],
	arguments = {
		{ name = "e", type = "keyDownEventData|mouseWheelEventData|mouseButtonDownEventData|mwseKeyMouseCombo" }
	},
	returns = {{ name = "keyCombo", type = "mwseKeyMouseCombo" }}
}
