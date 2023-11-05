return {
	type = "method",
	description = [[Properties are extra variables attached to an element. Morrowind uses these to bind variables to the UI, and they can be useful for element class-specific properties. This function sets a property to a boolean value.]],
	arguments = {
		{ name = "property", type = "number|string", description = "The property to set." },
		{ name = "value", type = "boolean", description = "The value to set." },
	},
	examples = {
		["menuAlpha"] = {
			title = "Make a UI element update its transparency based on the Menu Transparency setting.",
			description = "This will automatically update the menu's transparency recursively. A requirement is that the menu background is of \"rect\" contentType."
		}
	}
}
