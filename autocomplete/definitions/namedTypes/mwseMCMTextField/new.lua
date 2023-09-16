return {
	type = "method",
	description = [[Creates a new TextField.]],
	arguments = {{
		name = "data",
		type = "table",
		optional = true,
		tableParams = {
			{ name = "label", type = "string", optional = true, description = "Text shown above the text field." },
			{ name = "buttonText", type = "string", optional = true, description = 'The text shown on the button next to the input field. The default text is a localized version of: "Submit".' },
			{ name = "variable", type = "mwseMCMVariable|mwseMCMSettingNewVariable", optional = true, description = "A variable for this setting." },
			{ name = "description", type = "string", optional = true, description = "If in a [Sidebar Page](../types/mwseMCMSideBarPage.md), the description will be shown on mouseover." },
			{ name = "press", type = "fun(self: mwseMCMTextField)", optional = true, description = "This allows overriding the default implementation of this method. Can be overriden to add a confirmation message before updating. This function should call `self:update()` at the end." },
			{ name = "sNewValue", type = "string", optional = true, description = [[The message shown after a new value is submitted. This can be formatted with a '%s' which will be replaced with the new value. The default text is a localized version of: "New value: '%s'".]] },
			{ name = "sNumbersOnly", type = "string", optional = true, description = 'The text shown in a messageBox when the user entered an invalid input when `self.variable.numbersOnly` is true. The default text is a localized version of: "Value must be a number.".' },
			{ name = "minHeight", type = "integer", optional = true, description = "The minimum height set on the `self.element.border` UI element." },
			{ name = "callback", type = "fun(self: mwseMCMTextField)", optional = true, description = "This allows overriding the default implementation of this method. See its [description](../types/mwseMCMTextField.md#callback)." },
			{ name = "inGameOnly", type = "boolean", optional = true, default = false, description = "If true, the setting is disabled while the game is on main menu." },
			{ name = "restartRequired", type = "boolean", optional = true, default = false, description = "If true, updating this Setting will notify the player to restart the game." },
			{ name = "restartRequiredMessage", type = "string", optional = true, description = 'The message shown if restartRequired is triggered. The default text is a localized version of: "The game must be restarted before this change will come into effect."' },
			{ name = "indent", type = "integer", optional = true, default = 12, description = "The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component." },
			{ name = "childIndent", type = "integer", optional = true, description = "The left padding size in pixels. Used on all the child components." },
			{ name = "paddingBottom", type = "integer", optional = true, default = 4, description = "The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component." },
			{ name = "childSpacing", type = "integer", optional = true, description = "The bottom border size in pixels. Used on all the child components." },
			{ name = "postCreate", type = "fun(self: mwseMCMTextField)", optional = true, description = "Can define a custom formatting function to make adjustments to any element saved in `self.elements`." },
			{ name = "class", type = "string", optional = true },
			{ name = "componentType", type = "string", optional = true },
			{ name = "parentComponent", type = "mwseMCMComponent", optional = true },
		}
	}},
	returns = {{
		name = "textField", type = "mwseMCMTextField"
	}}
}
