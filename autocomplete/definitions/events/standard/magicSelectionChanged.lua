return {
	type = "event",
	description = "This event is triggered when the player selects any spell or enchant, or when the current magic selection is deselected.",
	eventData = {
		["source"] = {
			type = "tes3alchemy|tes3enchantment|tes3spell|nil",
			readOnly = true,
			description = "The magic source. When magic is deselected, this is nil.",
		},
		["item"] = {
			type = "tes3object|nil",
			readOnly = true,
			description = "When the source is an enchantment, this is the item that holds the enchantment.",
		},
	},
}