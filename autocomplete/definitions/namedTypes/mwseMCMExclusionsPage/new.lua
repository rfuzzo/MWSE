return {
	type = "method",
	description = [[Creates a new Exclusions Page.]],
	arguments = {{
		name = "data",
		type = "table",
		optional = true,
		tableParams = {
			{ name = "showHeader", type = "boolean", optional = true, default = false, description = "The page's label will only be created if set to true." },
			{ name = "label", type = "string", description = "The label field is displayed in the tab for that page at the top of the menu. Defaults to: \"Page {number}\"." },
			{ name = "variable", type = "mwseMCMVariable|mwseMCMSettingNewVariable", description = "The Variable used to store blocked list entries." },
			{ name = "filters", type = "mwseMCMExclusionsPageFilter[]", description = "A list of filters. Filters control which items will appear in the lists of the Exclusions Page. At least one filter is required. See the [filter page](./mwseMCMExclusionsPageFilter.md) for description." },
			{ name = "description", type = "string", optional = true, description = "Displayed at the top of the page above the lists." },
			{ name = "toggleText", type = "string", optional = true, description = "The text for the button that toggles filtered items from one list to another. The default is a localised version of \"Toggle Filtered\"." },
			{ name = "leftListLabel ", type = "string", optional = true, description = "The label on the left list. The default is a localised version of \"Blocked\"." },
			{ name = "rightListLabel ", type = "string", optional = true, description = "The label on the right list. The default is a localised version of \"Allowed\"." },
			{ name = "showAllBlocked ", type = "boolean", optional = true, default = false, description = "When set to true, the left list shows all items in the blocked table, regardless of the filter being used." },
			{ name = "indent", type = "integer", optional = true, default = 6, description = "The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component." },
			{ name = "childIndent", type = "integer", optional = true, description = "The left padding size in pixels. Used on all the child components." },
			{ name = "paddingBottom", type = "integer", optional = true, default = 4, description = "The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component." },
			{ name = "childSpacing", type = "integer", optional = true, description = "The bottom border size in pixels. Used on all the child components." },
			{ name = "inGameOnly", type = "boolean", optional = true, default = false },
			{ name = "class", type = "string", optional = true },
			{ name = "componentType", type = "string", optional = true },
			{ name = "parentComponent", type = "mwseMCMComponent", optional = true },
		}
	}},
	returns = {{
		name = "page", type = "mwseMCMExclusionsPage"
	}}
}
