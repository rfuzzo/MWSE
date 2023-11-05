return {
	type = "function",
	description = [[Moves one or more items from one reference to another. Returns the actual amount of items successfully transferred. If transfering more than one item, the items without itemData will be transferred first. Both the `from` and `to` references will be cloned if needed.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "from", type = "tes3reference|tes3mobileActor|string", description = "Who to take items from." },
			{ name = "to", type = "tes3reference|tes3mobileActor|string", description = "Who to give items to." },
			{ name = "item", type = "tes3item|string", description = "The item to transfer." },
			{ name = "itemData", type = "tes3itemData", optional = true, description = "The specific item data to transfer if, for example, you want to transfer a specific player item. If `itemData` argument is provided, only one item will be transferred." },
			{ name = "count", type = "number", optional = true, default = "1", description = "The maximum number of items to transfer." },
			{ name = "playSound", type = "boolean", optional = true, default = true, description = "If false, the up/down sound for the item won't be played." },
			{ name = "limitCapacity", type = "boolean", optional = true, default = true, description = "If false, items can be placed into containers that shouldn't normally be allowed. This includes organic containers, and containers that are full." },
			{ name = "reevaluateEquipment", type = "boolean", optional = true, default = true, description = "If true, and the item transferred is armor, clothing, or a weapon, the actors will reevaluate their equipment choices to see if the new item is worth equipping. This does not affect the player." },
			{ name = "equipProjectiles", type = "boolean", optional = true, default = true, description = "If true, and the `to` reference has the same projectile already equipped, the stacks will be merged. This will only work if the GUI is updated." },
			{ name = "updateGUI", type = "boolean", optional = true, default = true, description = "If false, the function won't manually resync the player's GUI state. This can result in some optimizations, though [tes3ui.forcePlayerInventoryUpdate](https://mwse.github.io/MWSE/apis/tes3ui/#tes3uiforceplayerinventoryupdate) or [tes3.updateInventoryGUI](https://mwse.github.io/MWSE/apis/tes3/#tes3updateinventorygui) and [tes3.updateMagicGUI](https://mwse.github.io/MWSE/apis/tes3/#tes3updatemagicgui) must manually be called after all inventory updates are finished." },
		},
	}},
	returns = {{ name = "transferredCount", type = "number" }},
}
