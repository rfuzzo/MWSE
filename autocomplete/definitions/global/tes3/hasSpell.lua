return {
	type = "function",
	description = [[Determines if the player has access to a given spell. At least one of the `actor`, `mobile` or `reference` arguments needs to be passed.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "reference", type = "tes3reference|tes3mobileActor|string", optional = true, description = "Who to check the spell list of. To check an actor without specifying any particular reference, use `actor` instead." },
			{ name = "actor", type = "tes3actor|string", optional = true, description = "Who to check the spell list of. Providing a base actor can be done before a save has been loaded, but may not correctly update effects for instanced versions of that actor in an active save." },
			{ name = "mobile", type = "tes3reference|tes3mobileActor|string", optional = true, description = "Who to check the spell list of. To check an actor without specifying any particular reference, use `actor` instead." },
			{ name = "spell", type = "tes3spell|string", description = "The spell to check." },
		},
	}},
	returns = {
		{ name = "hasSpell", type = "boolean", description = "True if the spell exists in the actor's spell list, race spell list, or birthsign spell list." },
	}
}