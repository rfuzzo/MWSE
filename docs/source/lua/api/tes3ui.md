# tes3ui

The tes3ui library provides access to manipulating the game's GUI.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3ui/acquireTextInput
    tes3ui/captureMouseDrag
    tes3ui/createHelpLayerMenu
    tes3ui/createMenu
    tes3ui/createTooltipMenu
    tes3ui/enterMenuMode
    tes3ui/findHelpLayerMenu
    tes3ui/findMenu
    tes3ui/forcePlayerInventoryUpdate
    tes3ui/getInventorySelectType
    tes3ui/getMenuOnTop
    tes3ui/getPalette
    tes3ui/getServiceActor
    tes3ui/leaveMenuMode
    tes3ui/logToConsole
    tes3ui/menuMode
    tes3ui/registerID
    tes3ui/registerProperty
    tes3ui/showBookMenu
    tes3ui/showScrollMenu
    tes3ui/suppressTooltip
    tes3ui/updateBarterMenuTiles
    tes3ui/updateInventorySelectTiles
    tes3ui/updateInventoryTiles
```

<dl class="describe">
<dt><code class="descname"><a href="tes3ui/acquireTextInput.html">acquireTextInput</a>(<i>element:</i> tes3uiElemenet)</code></dt>
<dd>

Sends all text input to the specified element. Suppresses keybinds while active. Calling this function with a nil argument will release text input and allow keybinds to work.

</dd>
<dt><code class="descname"><a href="tes3ui/captureMouseDrag.html">captureMouseDrag</a>(<i>capture:</i> boolean)</code></dt>
<dd>

When used in a mouse event, causes the element to capture further mouse events even when the cursor goes outside the element.

</dd>
<dt><code class="descname"><a href="tes3ui/createHelpLayerMenu.html">createHelpLayerMenu</a>({<i>id:</i> number}) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3uiElement.html">tes3uiElement</a></code></dt>
<dd>

Creates a help layer menu. Help layer menus include notifications and tooltips that are always above the rest of the interface. The game realizes this using a separate menu root and set of functions.

Note, to create tooltips with the correct behaviour, use tes3ui.createTooltipMenu.

Unlike standard menus, help layer menus are always created with a fixed frame.

</dd>
<dt><code class="descname"><a href="tes3ui/createMenu.html">createMenu</a>({<i>id:</i> number, <i>dragFrame:</i> boolean, <i>fixedFrame:</i> boolean}) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3uiElement.html">tes3uiElement</a></code></dt>
<dd>

Creates a top-level menu.

</dd>
<dt><code class="descname"><a href="tes3ui/createTooltipMenu.html">createTooltipMenu</a>()</code></dt>
<dd>

Creates a tooltip menu. This should be called from within a tooltip event callback. These automatically follow the mouse cursor, and are also destroyed automatically when the mouse leaves the originating element.

</dd>
<dt><code class="descname"><a href="tes3ui/enterMenuMode.html">enterMenuMode</a>(<i>id:</i> number) -> boolean</code></dt>
<dd>

Requests menu mode be activated on a menu with a given id.

</dd>
<dt><code class="descname"><a href="tes3ui/findHelpLayerMenu.html">findHelpLayerMenu</a>(<i>id:</i> number) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3uiElement.html">tes3uiElement</a></code></dt>
<dd>

Locates a help layer menu through its id. Help layer menus include notifications and tooltips that are always above the rest of the interface. The game realizes this using a separate menu root and set of functions.

</dd>
<dt><code class="descname"><a href="tes3ui/findMenu.html">findMenu</a>(<i>id:</i> number) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3uiElement.html">tes3uiElement</a></code></dt>
<dd>

Locates a top-level menu through its id.

</dd>
<dt><code class="descname"><a href="tes3ui/forcePlayerInventoryUpdate.html">forcePlayerInventoryUpdate</a>()</code></dt>
<dd>

Forces the game to update the inventory tile GUI elements. Unlike tes3ui.updateInventoryTiles, this will force-resync the player's inventory to the GUI, rather than updating what is already in the GUI system.

</dd>
<dt><code class="descname"><a href="tes3ui/getInventorySelectType.html">getInventorySelectType</a>()</code></dt>
<dd>

Determines what sort of search is being done when performing an inventory selection, e.g. "alembic" or "ingredient" or "soulGemFilled".

</dd>
<dt><code class="descname"><a href="tes3ui/getMenuOnTop.html">getMenuOnTop</a>()</code></dt>
<dd>

Returns the top-most, active menu.

</dd>
<dt><code class="descname"><a href="tes3ui/getPalette.html">getPalette</a>(<i>name:</i> string) -> table</code></dt>
<dd>

Gets a standard palette color. Returns an array containing the RGB color values, in the range [0.0, 1.0].

</dd>
<dt><code class="descname"><a href="tes3ui/getServiceActor.html">getServiceActor</a>()</code></dt>
<dd>

Returns the mobile actor currently providing services to the player.

</dd>
<dt><code class="descname"><a href="tes3ui/leaveMenuMode.html">leaveMenuMode</a>(<i>id:</i> number) -> boolean</code></dt>
<dd>

Requests menu mode be deactivated on a menu with a given id.

</dd>
<dt><code class="descname"><a href="tes3ui/logToConsole.html">logToConsole</a>(<i>text:</i> string, <i>isCommand:</i> boolean)</code></dt>
<dd>

Logs a message to the console.

</dd>
<dt><code class="descname"><a href="tes3ui/menuMode.html">menuMode</a>()</code></dt>
<dd>

Checks if the game is in menu mode.

</dd>
<dt><code class="descname"><a href="tes3ui/registerID.html">registerID</a>(<i>s:</i> string) -> number</code></dt>
<dd>

Registers a UI element name, returning a UI_ID. Once a property is registered, this function always returns the same UI_ID. These UI_IDs are used by the API to locate elements that may not exist (a weak reference), instead of by element name.

The registry namespace is shared between Property and UI_ID. It is advisable to use a namespace prefix to avoid collisions with other mods.

</dd>
<dt><code class="descname"><a href="tes3ui/registerProperty.html">registerProperty</a>(<i>s:</i> string) -> number</code></dt>
<dd>

Registers a property name, returning a Property. Once a property is registered, this function always returns the same Property.

The registry namespace is shared between Property and UI_ID. It is advisable to use a namespace prefix to avoid collisions with other mods.

</dd>
<dt><code class="descname"><a href="tes3ui/showBookMenu.html">showBookMenu</a>(<i>text:</i> string)</code></dt>
<dd>

Displays the book menu with arbitrary text. Paging is automatically handled.

</dd>
<dt><code class="descname"><a href="tes3ui/showScrollMenu.html">showScrollMenu</a>(<i>text:</i> string)</code></dt>
<dd>

Displays the scroll menu with arbitrary text.

</dd>
<dt><code class="descname"><a href="tes3ui/suppressTooltip.html">suppressTooltip</a>(<i>suppress:</i> boolean)</code></dt>
<dd>

Controls hiding of world object tooltips.

</dd>
<dt><code class="descname"><a href="tes3ui/updateBarterMenuTiles.html">updateBarterMenuTiles</a>()</code></dt>
<dd>

Forces the game to update the barter tile GUI elements.

</dd>
<dt><code class="descname"><a href="tes3ui/updateInventorySelectTiles.html">updateInventorySelectTiles</a>()</code></dt>
<dd>

Forces the game to update the inventory selection GUI elements.

</dd>
<dt><code class="descname"><a href="tes3ui/updateInventoryTiles.html">updateInventoryTiles</a>()</code></dt>
<dd>

Forces the game to update the inventory tile GUI elements.

</dd>
</dl>
