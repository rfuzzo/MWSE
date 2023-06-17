return {
	type = "function",
	description = [[This function is used to see what the player is looking at. Unlike a real raycast, this does not work in all circumstances. For instance, combat targets aren't returned by this function. You can access the last hit combat target using [`mobileActor.actionData.hitTarget`](https://mwse.github.io/MWSE/types/tes3actionData/#hittarget). Other option is to use `tes3.rayTest`.

As a general rule, it will return the reference if the information box is shown when it is looked at.]],
	valuetype = "tes3reference",
}