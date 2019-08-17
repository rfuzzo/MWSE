# tes3inputController

A data structure, off of the world controller, that handles input.

## Properties

<dl class="describe">
<dt><code class="descname">creationFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A bit field representing device capabilities and settings.

</dd>
<dt><code class="descname">inputMaps: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

The array-style access to input bindings.

</dd>
<dt><code class="descname">keyboardState: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

The array-style access to raw key states.

</dd>
<dt><code class="descname">mouseState: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3directInputMouseState.html">tes3directInputMouseState</a></code></dt>
<dd>

The raw DirectInput mouse state.

</dd>
<dt><code class="descname">previousKeyboardState: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

The array-style access to the previous frame's raw key states.

</dd>
<dt><code class="descname">previousMouseStatement: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3directInputMouseState.html">tes3directInputMouseState</a></code></dt>
<dd>

The raw DirectInput mouse state for the previous state.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">isKeyDown(<i>key:</i> number) -> boolean</code></dt>
<dd>

Performs a key down test for a given scan key code.

</dd>
<dt><code class="descname">isKeyPressedThisFrame(<i>key:</i> number) -> boolean</code></dt>
<dd>

Checks to see if a given scan code is pressed, and wasn't pressed last frame.

</dd>
<dt><code class="descname">isKeyReleasedThisFrame(<i>key:</i> number) -> boolean</code></dt>
<dd>

Checks to see if a given scan code is released, and was pressed last frame.

</dd>
<dt><code class="descname">keybindTest(<i>key:</i> number, <i>transition:</i> number) -> boolean</code></dt>
<dd>

Performs a test for a given keybind, and optionally a transition state.

</dd>
</dl>
