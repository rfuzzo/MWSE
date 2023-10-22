return {
	type = "function",
	description = [[Removes a spell from an actor's spell list. If the spell is passive, any active effects from that spell are retired. At least one of the `actor`, `mobile` or `reference` arguments needs to be passed.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "reference", type = "tes3reference|tes3mobileActor|string", optional = true, description = "Who to remove the spell from. To manipulate an actor without specifying any particular reference, use `actor` instead." },
			{ name = "actor", type = "tes3actor|string", optional = true, description = "Who to remove the spell from. Providing a base actor can be done before a save has been loaded, but may not correctly update effects for instanced versions of that actor in an active save." },
			{ name = "mobile", type = "tes3reference|tes3mobileActor|string", optional = true, description = "Who to remove the spell from. To manipulate an actor without specifying any particular reference, use `actor` instead." },
			{ name = "spell", type = "tes3spell|string", description = "The spell to remove." },
			{ name = "updateGUI", type = "boolean", optional = true, default = true, description = "If true, the GUI will be updated respecting the removal of the spell. This can be useful to disable when batch-removing many spells. The batch should be ended with [`tes3.updateMagicGUI`](https://mwse.github.io/MWSE/apis/tes3/#tes3updatemagicgui) to reflect the changes." },
		},
	}},
	returns = {
		{ name = "wasRemoved", type = "boolean", description = "True if the spell was successfully removed. This can be false if the spell comes from a race or birthsign." },
	},
}