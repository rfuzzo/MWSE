return {
	type = "function",
	description = [[Locates a root dialogue topic that can then be filtered down for a specific actor to return a specific dialogue info. Specify either `topic`, or both `type` and `page` for other types of dialogue.

For example, `tes3.findDialogue({type = tes3.dialogueType.greeting, page = tes3.dialoguePage.greeting.greeting0})` will return the "Greeting 0" topic, which is not available using a topic ID.]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "topic", type = "string", optional = true, description = "The dialogue topic to look for." },
			{ name = "type", type = "tes3.dialogueType", optional = true, description = "The type of dialogue to look for. Uses [`tes3.dialogueType`](https://mwse.github.io/MWSE/references/dialogue-types/) constants." },
			{ name = "page", type = "tes3.dialoguePage.voice|tes3.dialoguePage.greeting|tes3.dialoguePage.service", optional = true, description = "The page of dialogue to fetch. Uses [`tes3.dialoguePage`](https://mwse.github.io/MWSE/references/dialogue-pages/) constants." },
		},
	}},
	returns = {{ name = "dialogue", type = "tes3dialogue" }},
}
