return {
	type = "event",
	description = "This event is called when determining the price of traveling, and can be used to modify the given price.",
	related = { "calcBarterPrice", "calcEnchantmentPrice", "calcRepairPrice", "calcSpellmakingPrice", "calcSpellPrice", "calcTrainingPrice", "calcTravelPrice" },
	eventData = {
		["mobile"] = {
			type = "tes3mobileActor",
			readOnly = true,
			description = "The mobile actor of the merchant the player is interacting with.",
		},
		["reference"] = {
			type = "tes3reference",
			readOnly = true,
			description = "The mobile’s related reference.",
		},
		["basePrice"] = {
			type = "number",
			readOnly = true,
			description = "The price before adjustment.",
		},
		["price"] = {
			type = "number",
			description = "The adjusted price of travelling.",
		},
		["destination"] = {
			type = "tes3reference",
			readOnly = true,
			description = "The travel marker that marks the destination.",
		},
		["companions"] = {
			type = "tes3mobileActor[]|nil",
			readOnly = true,
			description = "Companions that will travel with the player, or `nil` if no companions are present."
		},
	},
}
