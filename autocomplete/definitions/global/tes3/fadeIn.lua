return {
	type = "function",
	description = [[Similar to the vanilla FadeIn mwscript command.]],
	arguments = {{
		name = "params",
		type = "table",
		optional = true,
		tableParams = {
			{ name = "fader", type = "tes3fader", optional = true, default = "tes3.worldController.transitionFader", description = "Defaults to the transition fader." },
			{ name = "duration", type = "number", optional = true, default = "1.0", description = "Time, in seconds, for the fade." },
		},
	}},
}