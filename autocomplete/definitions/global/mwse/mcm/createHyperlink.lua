return {
	type = "function",
	description = [[Creates a new Hyperlink inside given `parent` menu.

The canonical way to use this function is to pass a `parent` and `data` arguments. If passing only `data` table, Hyperlink's UI element tree won't be created. To do so, use Hyperlink's `create` method:

```lua
local myHyperlink = mwse.mcm.createHyperlink({ ... })
myHyperlink:create(parent)
```

The same is done by this function if you pass both `parent` and `data` arguments.
]],
	arguments = {
		{ name = "parent", type = "tes3uiElement|mwse.mcm.createHyperlink.data", description = "The UI element inside which the new Hyperlink will be created." },
		{
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
			}
		}
	},
	returns = {{
		name = "hyperlink", type = "mwseMCMHyperlink"
	}}
}
