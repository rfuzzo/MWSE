return {
	type = "function",
	description = [[Checks if a merchant will offer a service to you, including dialogue checks like disposition and faction membership. A specific service can be checked, or if no service is given, a generic dialogue check is made. If the service is refused, the dialogue reply for the refusal may also be returned (it may be nil, as there may not always be a reply available).]],
	arguments = {{
		name = "params",
		type = "table",
		tableParams = {
			{ name = "reference", type = "tes3reference|tes3mobileActor|string" },
			{ name = "service", type = "tes3.merchantService", optional = true, description = "The specific service to check for availability. Maps to values in the [`tes3.merchantService`](https://mwse.github.io/MWSE/references/merchant-services/) table." },
			{ name = "context", type = "tes3.dialogueFilterContext", default = "tes3.dialogueFilterContext.script", description = "An override for how this info request should be treated. Maps to values in the [`tes3.dialogueFilterContext`](https://mwse.github.io/MWSE/references/dialogue-filter-context/) table." },
		}
	}},
	returns = {
		{ name = "offersService", type = "boolean" },
		{ name = "refusalReply", type = "tes3dialogueInfo" },
	},
}
