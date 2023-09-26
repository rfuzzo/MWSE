return {
	type = "value",
	description = [[Determines if the container's respawn flag is enabled. Only the organic containers can have respawn flag set.

The global script variable, "MonthsToRespawn" is decremented at the end of each month. If it reaches zero at the first day of next month, it is reset to `iMonthsToRespawn` (GMST) and all respawning containers are refilled.]],
	valuetype = "boolean",
}