return {
	type = "method",
	description = [[Used to convert raw input event data into `mwseKeyMouseCombo`.]],
	arguments = {
		{ name = "e", type = "mouseWheelEventData|mouseButtonDownEventData|mwseKeyMouseCombo" }
	},
	returns = {{ name = "keyCombo", type = "mwseKeyMouseCombo" }}
}
