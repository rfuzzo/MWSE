return {
	type = "function",
	description = [[Creates a new KeyBinder inside given `parent` menu.

The canonical way to use this function is to pass a `parent` and `data` arguments. If passing only `data` table, KeyBinder's UI element tree won't be created. To do so, use KeyBinder's `create` method:

```lua
local myKeyBinder = mwse.mcm.createKeyBinder({ ... })
myKeyBinder:create(parent)
```

The same is done by this function if you pass both `parent` and `data` arguments.
]],
	arguments = {
		{ name = "parent", type = "tes3uiElement|mwse.mcm.createKeyBinder.data", description = "The UI element inside which the new KeyBinder will be created." },
		{
			name = "data",
			type = "table",
			optional = true,
			tableParams = {
				{ name = "label", type = "string", optional = true, description = "Text shown next to the button." },
				{ name = "description", type = "string", optional = true, description = "If in a [Sidebar Page](../types/mwseMCMSideBarPage.md), the description will be shown on mouseover." },
				{ name = "allowCombinations ", type = "boolean", optional = true, default = true, description = "If true, the keybinder will let the user use modification keys: Shift, Ctrl, and Alt when rebinding." },
				{ name = "allowMouse ", type = "boolean", optional = true, default = false, description = "If true, the keybinder will let the user use mouse buttons and scroll wheel in this keybinder. In that case the variable will have [mwseKeyMouseCombo](../types/mwseKeyMouseCombo.md) layout, [mwseKeyCombo](../types/mwseKeyCombo.md) otherwise." },
				{ name = "keybindName", type = "string", optional = true, description = "The keybind name. Shown in the popup menu header. This string is formatted into a localized version of \"SET %s KEYBIND.\". If none is provided the popup has \"SET NEW KEYBIND.\" as header text." },
				{ name = "leftSide ", type = "boolean", optional = true, default = true, description = "If true, the button will be created on the left and label on the right." },
				{ name = "variable", type = "mwseMCMVariable|mwseMCMSettingNewVariable", description = "A variable for this KeyBinder." },
				{ name = "defaultSetting", type = "mwseKeyCombo", optional = true, description = "If `defaultSetting` wasn't passed in the `variable` table, can be passed here. The new variable will be initialized to this value." },
				{ name = "callback", type = "fun(self: mwseMCMKeyBinder)", optional = true, description = "The custom function called when the player interacts with this KeyBinder." },
				{ name = "inGameOnly", type = "boolean", optional = true, default = false, description = "If true, the setting is disabled while the game is on main menu." },
				{ name = "restartRequired", type = "boolean", optional = true, default = false, description = "If true, updating this Setting will notify the player to restart the game." },
				{ name = "restartRequiredMessage", type = "string", optional = true, description = 'The message shown if restartRequired is triggered. The default text is a localized version of: "The game must be restarted before this change will come into effect."' },
				{ name = "indent", type = "integer", optional = true, default = 12, description = "The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component." },
				{ name = "childIndent", type = "integer", optional = true, description = "The left padding size in pixels. Used on all the child components." },
				{ name = "paddingBottom", type = "integer", optional = true, default = 4, description = "The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component." },
				{ name = "childSpacing", type = "integer", optional = true, description = "The bottom border size in pixels. Used on all the child components." },
				{ name = "postCreate", type = "fun(self: mwseMCMKeyBinder)", optional = true, description = "Can define a custom formatting function to make adjustments to any element saved in `self.elements`." },
			}
		}
	},
	returns = {{
		name = "button", type = "mwseMCMKeyBinder"
	}}
}
