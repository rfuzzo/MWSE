return {
	type = "method",
	description = [[Creates a new Sidebar Page.]],
	arguments = {{
		name = "data",
		type = "table",
		optional = true,
		tableParams = {
			{ name = "showHeader", type = "boolean", optional = true, default = false, description = "The page's label will only be created if set to true." },
			{ name = "label", type = "string", optional = true, description = "The label field is displayed in the tab for that page at the top of the menu. Defaults to: \"Page {number}\"." },
			{ name = "noScroll", type = "boolean", optional = true, default = false, description = "When set to true, the page will not have a scrollbar. Particularly useful if you want to use a [ParagraphField](./mwseMCMParagraphField.md), which is not compatible with scroll panes." },
			{ name = "description", type = "string", optional = true, description = "Default sidebar text shown when the mouse isn't hovering over a component inside this Sidebar Page. It will be added to right column as a mwseMCMInfo." },
			{ name = "components", type = "mwseMCMComponent.getComponent.componentData[]", optional = true, description = "Use this if you want to directly create all the nested components in this Page. This table is described at [getComponent](./mwseMCMSideBarPage.md#getcomponent)." },
			{ name = "indent", type = "integer", optional = true, default = 6, description = "The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component." },
			{ name = "childIndent", type = "integer", optional = true, description = "The left padding size in pixels. Used on all the child components." },
			{ name = "paddingBottom", type = "integer", optional = true, default = 4, description = "The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component." },
			{ name = "childSpacing", type = "integer", optional = true, description = "The bottom border size in pixels. Used on all the child components." },
			{ name = "inGameOnly", type = "boolean", optional = true, default = false },
			{ name = "postCreate", type = "fun(self: mwseMCMSideBarPage)", optional = true, description = "Can define a custom formatting function to make adjustments to any element saved in `self.elements`." },
			{ name = "class", type = "string", optional = true },
			{ name = "componentType", type = "string", optional = true },
			{ name = "parentComponent", type = "mwseMCMComponent", optional = true },
		}
	}},
	returns = {{
		name = "page", type = "mwseMCMSideBarPage"
	}}
}
