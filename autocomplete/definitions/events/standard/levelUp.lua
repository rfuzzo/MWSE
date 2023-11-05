return {
	type = "event",
	description = "This even is called whenever the player successfully finishes leveling up.",
	related = { "preLevelUp" },
	eventData = {
		["level"] = {
			type = "number",
			readOnly = true,
			description = "The new level obtained.",
		},
	},
	filter = "level",
}