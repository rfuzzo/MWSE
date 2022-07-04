return {
	type = "event",
	description = "This event fires once the player arrives at a travel destination via a travel service.",
	eventData = {
		["mobile"] = {
			type = "tes3mobileActor",
			readOnly = true,
			description = "The mobile actor of the merchant that transported the player.",
		},
		["reference"] = {
			type = "tes3reference",
			readOnly = true,
			description = "The mobile’s related reference.",
		},
		["basePrice"] = {
			type = "number",
			readOnly = true,
			description = "The base cost of traveling the service.",
		},
		["price"] = {
			type = "number",
			readOnly = true,
			description = "The actual cost of the service.",
		},
		["destination"] = {
			type = "tes3reference",
			readOnly = true,
			description = "The travel marker that marks the destination at which the player arrived at.",
		},
		["companions"] = {
			type = "tes3mobileActor[]|nil",
			readOnly = true,
			description = "Companions that have traveled with the player, or `nil` if no companions were present."
		},
		["hoursPassed"] = {
			type = "number",
			readOnly = true,
			description = "The time passed during travel, in hours."
		},
		["cell"] = {
			type = "tes3cell",
			readOnly = true,
			description = "The destination cell of the travel."
		},
		["previousCell"] = {
			type = "tes3cell",
			readOnly = true,
			description = "The starting cell of the travel."
		}
	},
	examples = {
		["travelAccident"] = {
			title = "A travel accident",
			description = "The player may have an accident during a trip from Balmora to Suran via a Silt Strider."
		}
	}
}
