return {
	type = "function",
	description = [[Creates a new Slider inside given `parent` menu.

The canonical way to use this function is to pass a `parent` and `data` arguments. If passing only `data` table, Slider's UI element tree won't be created. To do so, use Slider's `create` method:

```lua
local mySlider = mwse.mcm.createSlider({ ... })
mySlider:create(parent)
```

The same is done by this function if you pass both `parent` and `data` arguments.
]],
	arguments = {
		{ name = "parent", type = "tes3uiElement|mwse.mcm.createSlider.data", description = "The UI element inside which the new Slider will be created." },
		{
			name = "data",
			type = "table",
			optional = true,
			tableParams = {
				{ name = "label", type = "string", optional = true, description = "Text shown above the slider. If left as a normal string, it will be shown in the form: [`label`]: [`self.variable.value`]. If the string contains a '%s' format operator, the value will be formatted into it." },
				{ name = "variable", type = "mwseMCMVariable|mwseMCMSettingNewVariable", description = "A variable for this setting." },
				{ name = "defaultSetting", type = "unknown", optional = true, description = "If `defaultSetting` wasn't passed in the `variable` table, can be passed here. The new variable will be initialized to this value." },
				{ name = "min", type = "integer", optional = true, default = 0, description = "Minimum value of slider." },
				{ name = "max", type = "integer", optional = true, default = 100, description = "Maximum value of slider." },
				{ name = "step", type = "integer", optional = true, default = 1, description = "How far the slider moves when you press the arrows." },
				{ name = "jump", type = "integer", optional = true, default = 5, description = "How far the slider jumps when you click an area inside the slider." },
				{ name = "description", type = "string", optional = true, description = "If in a [Sidebar Page](../types/mwseMCMSideBarPage.md), the description will be shown on mouseover." },
				{ name = "callback", type = "fun(self: mwseMCMSlider)", optional = true, description = "The custom function called when the player interacts with this Setting." },
				{ name = "inGameOnly", type = "boolean", optional = true, default = false, description = "If true, the setting is disabled while the game is on main menu." },
				{ name = "restartRequired", type = "boolean", optional = true, default = false, description = "If true, updating this Setting will notify the player to restart the game." },
				{ name = "restartRequiredMessage", type = "string", optional = true, description = 'The message shown if restartRequired is triggered. The default text is a localized version of: "The game must be restarted before this change will come into effect."' },
				{ name = "indent", type = "integer", optional = true, default = 12, description = "The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component." },
				{ name = "childIndent", type = "integer", optional = true, description = "The left padding size in pixels. Used on all the child components." },
				{ name = "paddingBottom", type = "integer", optional = true, default = 4, description = "The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component." },
				{ name = "childSpacing", type = "integer", optional = true, description = "The bottom border size in pixels. Used on all the child components." },
				{ name = "postCreate", type = "fun(self: mwseMCMSlider)", optional = true, description = "Can define a custom formatting function to make adjustments to any element saved in `self.elements`." },
			}
		}
	},
	returns = {{
		name = "slider", type = "mwseMCMSlider"
	}}
}
