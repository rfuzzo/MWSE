return {
	type = "event",
	description = "This event is triggered when a reference is deactivated because it has been removed from the world, or is no longer in an active cell.",
	related = { "referenceActivated", "referenceDeactivated" },
	eventData = {
		["reference"] = {
			type = "tes3reference",
			readOnly = true,
			description = "The reference which was deactivated.",
		},
	},
	filter = "reference",
}
