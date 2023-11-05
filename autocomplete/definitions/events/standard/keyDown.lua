return {
	type = "event",
	description = "The key event fires when a key is pressed.",
	related = { "keyUp" },
	eventData = {
		["keyCode"] = {
			type = "tes3.scanCode",
			readOnly = true,
			description = "The scan code of the key that raised the event. Maps to values in [`tes3.scanCode`](https://mwse.github.io/MWSE/references/scan-codes/) table.",
		},
		["isShiftDown"] = {
			type = "boolean",
			readOnly = true,
			description = "True if either shift key is held.",
		},
		["isControlDown"] = {
			type = "boolean",
			readOnly = true,
			description = "True if either control key is held.",
		},
		["isAltDown"] = {
			type = "boolean",
			readOnly = true,
			description = "True if either alt key is held.",
		},
		["isSuperDown"] = {
			type = "boolean",
			readOnly = true,
			description = "True if super (Windows key) is held.",
		},
	},
	filter = "keyCode",
	examples = {
		["PrintCtrlZ"] = {
			title = "Show a Message when Ctrl-Z is Pressed",
			description = "Displays a simple message when Z is pressed while control is held.",
		},
		["..\\..\\..\\global\\tes3\\isKeyEqual\\filtering"] = {
			title = "Filtering out key presses that aren't equal to the bound key combination"
		},
	},
}