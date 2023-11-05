return {
	type = "method",
	description = [[Creates a new Template.]],
	arguments = {{
		name = "data",
		type = "table",
		tableParams = {
			{ name = "name", type = "string", optional = true, description = "The name field is the mod name, used to register the MCM, and is displayed in the mod list on the lefthand pane." },
			{ name = "label", type = "string", optional = true, description = "Used in place of `name` if that argument isn't passed. You need to pass at least one of the `name` and `label` arguments. If `headerImagePath` is not passed, a UI element will be created with `label` as text." },
			{ name = "headerImagePath", type = "string", optional = true, description = "Set it to display an image at the top of your menu. Path is relative to `Data Files/`. The image must have power-of-2 dimensions (i.e. 16, 32, 64, 128, 256, 512, 1024, etc.)." },
			{ name = "onClose", type = "fun(modConfigContainer: tes3uiElement)", optional = true, description = "Set this to a function which will be called when the menu is closed. Useful for saving variables, such as TableVariable." },
			{ name = "onSearch", type = "fun(searchText: string): boolean", optional = true, description = "A custom search handler function. This function should return true if this mod Template should show up in search results for given `searchText`." },
			{ name = "pages", type = "mwseMCMPage.new.data[]", optional = true, description = "You can create pages for the template directly here. The entries in the array must specify the class of the page." },
			{ name = "indent", type = "integer", optional = true, default = 12, description = "The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component." },
			{ name = "childIndent", type = "integer", optional = true, description = "The left padding size in pixels. Used on all the child components." },
			{ name = "paddingBottom", type = "integer", optional = true, default = 4, description = "The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component." },
			{ name = "childSpacing", type = "integer", optional = true, description = "The bottom border size in pixels. Used on all the child components." },
			{ name = "inGameOnly", type = "boolean", optional = true, default = false },
			{ name = "postCreate", type = "fun(self: mwseMCMTemplate)", optional = true, description = "Can define a custom formatting function to make adjustments to any element saved in `self.elements`." },
			{ name = "class", type = "string", optional = true },
			{ name = "parentComponent", type = "mwseMCMComponent", optional = true },
		}
	}},
	returns = {{
		name = "template", type = "mwseMCMTemplate"
	}}
}
