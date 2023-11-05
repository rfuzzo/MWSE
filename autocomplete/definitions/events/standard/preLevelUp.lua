return {
	type = "event",
	description = "This event is triggered just before the player levels up.",
	related = { "levelUp" },
	eventData = {
		["level"] = {
			type = "number",
			readOnly = true,
			description = "The new level about to be obtained.",
		},
	},
	filter = "level",
}