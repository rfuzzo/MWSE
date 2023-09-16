return {
	type = "class",
	description = [[Stores the variable on the Player reference.data table. This results in the value of the variable being local to the loaded save file. If users may want different values set for different games, this is a good Variable to use.

Settings using mwseMCMPlayerData are in-game only by default, as the Player reference can only be accessed while a game is loaded.]],
	inherits = "mwseMCMVariable",
}
