return {
	type = "method",
	description = [[Returns true if the component should be disabled.

Componets with a variable:

- True if the Component's **variable** has `inGameOnly` field set to true, and the game is on the main menu. For components with multiple subcomponent ([Category](./mwseMCMCategory.md)), the check is done for each subcomponent.

Components without a variable:

- True if the **Component's** `inGameOnly` field is set to true, and the game is on the main menu.
]],
	returns = {
		{ name = "result", type = "boolean" }
	}
}
