return {
	type = "event",
	description = "This event is invoked whenever the player gains experience in a skill. The event can be blocked to prevent progress. Additionally, both the skill gaining experience and the progress gained can be changed.",
	related = { "skillRaised" },
	eventData = {
		skill = {
			type = "tes3.skill",
			description = "The ID of the skill that is gaining experience. The IDs used are available in Lua by their indentifier in the [`tes3.skill`](https://mwse.github.io/MWSE/references/skills/) namespace. This can be changed to provide experience to a different skill.",
		},
		progress = {
			type = "number",
			description = "The amount of experience that skill is gaining. Note that experience is not on a scale of 1 to 100. This value is modifiable.",
		},
	},
	filter = "skill",
	blockable = true,
}