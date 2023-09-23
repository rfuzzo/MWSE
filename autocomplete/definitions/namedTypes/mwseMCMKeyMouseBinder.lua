return {
	type = "class",
	description = [[This button allows the player to bind a key combination for use with hotkeys. This binder type supports keyboard key combinations and mouse button and scroll wheel.

The player presses the hotkey button, a prompt asks them to press a new key to bind (or key combination using Shift, Ctrl or Alt).

Key combos are stored in the following format ([mwseKeyMouseCombo](../types/mwseKeyMouseCombo.md)):

```lua
{
	keyCode = tes3.scanCode.{key},
	isShiftDown = true,
	isAltDown = false,
	isControlDown = false,
	mouseWheel = -1 - down, 1 - up, nil
	mouseButton = number|nil
},
```
	]],
	inherits = "mwseMCMButton"
}
