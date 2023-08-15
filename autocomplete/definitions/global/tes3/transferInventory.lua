return {
	type = "function",
	description = [[Moves all the items in one reference's inventory to another.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "from", type = "tes3reference|tes3mobileActor|string", description = "Who to take items from." },
			{ name = "to", type = "tes3reference|tes3mobileActor|string", description = "Who to give items to." },
			{ name = "playSound", type = "boolean", optional = true, default = true, description = "If false, the up/down sound won't be played." },
			{ name = "limitCapacity", type = "boolean", optional = true, default = true, description = "If false, items can be placed into containers that shouldn't normally be allowed. This includes organic containers, and containers that are full." },
			{ name = "reevaluateEquipment", type = "boolean", optional = true, default = true, description = "If true, and the if in the transferred items are armor, clothing, or weapon items, the actors will reevaluate their equipment choices to see if the new items are worth equipping. This does affect the player." },
			{ name = "equipProjectiles", type = "boolean", optional = true, default = true, description = "If true, and the `to` reference has the same projectile already equipped, the stacks will be merged." },
			{ name = "checkCrime", type = "boolean", optional = true, default = false, description = "If true, and the `to` reference is the player, the function will check if the player has access to the `from` reference's inventory. If not, appropriate crime reactions will be triggered." },
		},
	}},
	returns = {{ name = "transferred", type = "boolean" }},
}
