return {
	type = "event",
	description = "uiEvent is triggered through various UI events. This includes scrolling through panes, clicking buttons, selecting icons, or a host of other UI-related activities.",
	related = { "uiPreEvent" },
	eventData = {
		["block"] = {
			type = "tes3uiElement",
			readOnly = true,
			description = "*Deprecated, please use `source` instead*. The UI element that is firing this event.",
		},
		["source"] = {
			type = "tes3uiElement",
			readOnly = true,
			description = "The UI element that is firing this event.",
		},
		["parent"] = {
			type = "tes3uiElement",
			readOnly = true,
			description = "The calling element's parent.",
		},
		["property"] = {
			type = "tes3.uiProperty",
			readOnly = true,
			description = "The property identifier that is being triggered.",
		},
		["var1"] = {
			type = "number",
			readOnly = true,
			description = "One of two undefined variables related to the event.",
		},
		["var2"] = {
			type = "number",
			readOnly = true,
			description = "One of two undefined variables related to the event.",
		},
	},
	filter = "source.id",
}