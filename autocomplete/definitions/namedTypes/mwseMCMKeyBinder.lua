return {
	type = "class",
	description = [[This button allows the player to bind a key combination for use with hotkeys.

The player presses the hotkey button, a prompt asks them to press a key (or key combination using Shift, Ctrl or Alt), and the current key combo is displayed in the popup until they press “Okay” to confirm.

Key combos are stored in the following format ([mwseKeyCombo](../types/mwseKeyCombo.md)):

```lua
{
	keyCode = tes3.scanCode.{key},
	isShiftDown = true,
	isAltDown = false,
	isControlDown = false,
},
```
	]],
	inherits = "mwseMCMButton"
}
