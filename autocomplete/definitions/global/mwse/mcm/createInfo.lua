return {
	type = "function",
	description = [[Creates a new Info inside given `parent` menu.

The canonical way to use this function is to pass a `parent` and `data` arguments. If passing only `data` table, Info's UI element tree won't be created. To do so, use Info's `create` method:

```lua
local myInfo = mwse.mcm.createInfo({ ... })
myInfo:create(parent)
```

The same is done by this function if you pass both `parent` and `data` arguments.
]],
	arguments = {
		{ name = "parent", type = "tes3uiElement|mwse.mcm.createInfo.data|string", description = "The UI element inside which the new Info will be created." },
		{
			name = "data",
			type = "table|string",
			optional = true,
			description = "If passing only a string, it will be used as the Info's label.",
			tableParams = {
				{ name = "label", type = "string", optional = true, description = "The Info's label." },
				{ name = "text", type = "string", optional = true, description = "The Info's text." },
				{ name = "description", type = "string", optional = true, description = "If in a [Sidebar Page](../types/mwseMCMSideBarPage.md), the description will be shown on mouseover." },
				{ name = "variable", type = "mwseMCMVariable|mwseMCMSettingNewVariable", optional = true, description = "A variable for this setting." },
				{ name = "defaultSetting", type = "unknown", optional = true, description = "If `defaultSetting` wasn't passed in the `variable` table, can be passed here. The new variable will be initialized to this value." },
				{ name = "inGameOnly", type = "boolean", optional = true, default = false },
				{ name = "indent", type = "integer", optional = true, default = 12, description = "The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component." },
				{ name = "childIndent", type = "integer", optional = true, description = "The left padding size in pixels. Used on all the child components." },
				{ name = "paddingBottom", type = "integer", optional = true, default = 4, description = "The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component." },
				{ name = "childSpacing", type = "integer", optional = true, description = "The bottom border size in pixels. Used on all the child components." },
				{ name = "postCreate", type = "fun(self: mwseMCMInfo)", optional = true, description = "Can define a custom formatting function to make adjustments to any element saved in `self.elements`." },
			}
		}
	},
	returns = {{
		name = "info", type = "mwseMCMInfo"
	}}
}
