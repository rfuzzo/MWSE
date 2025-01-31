return {
	type = "method",
	description = [[Gets an exterior associated with this cell. If the cell is or behaves as an exterior, it returns the current cell. Otherwise it looks through load doors, searching for an exterior cell. If the cell links to multiple exteriors, there is no guarantee that the returned exterior is the closest one to the player.]],
	returns = {
		{ name = "exterior", type = "tes3cell?", description = "An exterior cell linked to this cell." },
	}
}