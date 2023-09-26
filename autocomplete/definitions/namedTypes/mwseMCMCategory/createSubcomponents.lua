return {
	type = "method",
	description = [[Creates UI element tree for all the given components by calling `component:create`.]],
	arguments = {
		{ name = "parentBlock",	type = "tes3uiElement" },
		{ name = "components", type = "mwseMCMComponent.getComponent.componentData[]", description = "See description for [getComponent](./mwseMCMCategory.md#getcomponent)." }
	}
}
