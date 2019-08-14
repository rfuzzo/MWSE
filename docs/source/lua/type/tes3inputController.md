# tes3inputController

A data structure, off of the world controller, that handles input.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3inputController/creationFlags
    tes3inputController/inputMaps
    tes3inputController/keyboardState
    tes3inputController/mouseState
    tes3inputController/previousKeyboardState
    tes3inputController/previousMouseStatement
```

#### [creationFlags](tes3inputController/creationFlags.md)

> A bit field representing device capabilities and settings.

#### [inputMaps](tes3inputController/inputMaps.md)

> The array-style access to input bindings.

#### [keyboardState](tes3inputController/keyboardState.md)

> The array-style access to raw key states.

#### [mouseState](tes3inputController/mouseState.md)

> The raw DirectInput mouse state.

#### [previousKeyboardState](tes3inputController/previousKeyboardState.md)

> The array-style access to the previous frame's raw key states.

#### [previousMouseStatement](tes3inputController/previousMouseStatement.md)

> The raw DirectInput mouse state for the previous state.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3inputController/isKeyDown
    tes3inputController/isKeyPressedThisFrame
    tes3inputController/isKeyReleasedThisFrame
    tes3inputController/keybindTest
```

#### [isKeyDown](tes3inputController/isKeyDown.md)

> Performs a key down test for a given scan key code.

#### [isKeyPressedThisFrame](tes3inputController/isKeyPressedThisFrame.md)

> Checks to see if a given scan code is pressed, and wasn't pressed last frame.

#### [isKeyReleasedThisFrame](tes3inputController/isKeyReleasedThisFrame.md)

> Checks to see if a given scan code is released, and was pressed last frame.

#### [keybindTest](tes3inputController/keybindTest.md)

> Performs a test for a given keybind, and optionally a transition state.
