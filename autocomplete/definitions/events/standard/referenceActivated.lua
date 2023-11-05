return {
	type = "event",
	description = "This event is triggered when a reference becomes active because its cell has been loaded, or it has been placed or moved to an active cell. Current notable exception: when loading a save game that's in the same cell as the player, the cell stays active and unmodified references will not trigger referenceActivated. This exception may be resolved with future patches.",
	related = { "referenceActivated", "referenceDeactivated" },
	eventData = {
		["reference"] = {
			type = "tes3reference",
			readOnly = true,
			description = "The reference which was activated.",
		},
	},
	filter = "reference",
}
