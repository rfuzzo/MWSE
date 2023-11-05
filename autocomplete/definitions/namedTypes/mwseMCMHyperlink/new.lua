return {
	type = "method",
	description = [[Creates a new Hyperlink.]],
	arguments = {{
		name = "data",
		type = "table",
		optional = true,
		tableParams = {
			{ name = "text", type = "string", description = "The Hyperlink's text." },
			{ name = "description", type = "string", optional = true, description = "If in a [Sidebar Page](../types/mwseMCMSideBarPage.md), the description will be shown on mouseover." },
			{ name = "url", type = "string", description = "The URL for this hyperlink." },
			{ name = "label", type = "string", optional = true, description = "The Hyperlink's label. Shown above the Hyperlink's text." },
			{ name = "inGameOnly", type = "boolean", optional = true, default = false },
			{ name = "indent", type = "integer", optional = true, default = 12, description = "The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component." },
			{ name = "childIndent", type = "integer", optional = true, description = "The left padding size in pixels. Used on all the child components." },
			{ name = "paddingBottom", type = "integer", optional = true, default = 4, description = "The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component." },
			{ name = "childSpacing", type = "integer", optional = true, description = "The bottom border size in pixels. Used on all the child components." },
			{ name = "postCreate", type = "fun(self: mwseMCMHyperlink)", optional = true, description = "Can define a custom formatting function to make adjustments to any element saved in `self.elements`." },
			{ name = "class", type = "string", optional = true },
			{ name = "componentType", type = "string", optional = true },
			{ name = "parentComponent", type = "mwseMCMComponent", optional = true },
		}
	}},
	returns = {{
		name = "hyperlink", type = "mwseMCMHyperlink"
	}}
}
