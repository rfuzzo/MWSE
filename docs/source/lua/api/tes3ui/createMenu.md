# createMenu

Creates a top-level menu.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The menu's ID. The menu can be later accessed by tes3ui.findMenu(id).

</dd>
<dt><code class="descname">dragFrame: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Constructs a draggable and resizeable frame and background for the menu. It is similar to the stats, inventory, magic and map menus in the standard UI. After construction, position and minimum dimensions should be set.

</dd>
<dt><code class="descname">fixedFrame: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Constructs a fixed (non-draggable) frame and background for the menu. The layout system should automatically centre and size it to fit whatever is added to the menu.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">undefined: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3uiElement.html">tes3uiElement</a></code></dt>
<dd>

No description available.

</dd>
</dl>
