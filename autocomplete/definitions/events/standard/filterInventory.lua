return {
	type = "event",
	description = "This event fires when an item in the inventory is filtered.",
	related = { "filterBarterMenu", "filterContentsMenu", "filterInventory" },
	eventData = {
		["tile"] = {
			type = "tes3inventoryTile",
			readOnly = true,
			description = "The inventory tile being filtered.",
		},
		["item"] = {
			type = "tes3item",
			readOnly = true,
			description = "The item being filtered.",
		},
		["itemData"] = {
			type = "tes3itemData",
			readOnly = true,
			description = "The item data for the item being filtered.",
		},
	},
}