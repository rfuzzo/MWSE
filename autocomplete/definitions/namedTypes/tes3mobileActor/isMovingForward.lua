return {
	type = "value",
	description = [[Direct access to the actor's current movement flags, showing if the actor is moving forwards.]],
	valuetype = "boolean",
	examples = {
		["isMoving"] = {
			title = "Checking if a mobile actor is moving",
			description = "There are many movement flags for mobile actors. To check if a mobile actor is moving at all, we need to check if the mobile is moving in each possible direction."
		}
	}
}