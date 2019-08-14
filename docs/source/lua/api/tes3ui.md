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

#### [acquireTextInput](tes3ui/acquireTextInput.md)

> Sends all text input to the specified element. Suppresses keybinds while active. Calling this function with a nil argument will release text input and allow keybinds to work.

#### [captureMouseDrag](tes3ui/captureMouseDrag.md)

> When used in a mouse event, causes the element to capture further mouse events even when the cursor goes outside the element.

#### [createHelpLayerMenu](tes3ui/createHelpLayerMenu.md)

> Creates a help layer menu. Help layer menus include notifications and tooltips that are always above the rest of the interface. The game realizes this using a separate menu root and set of functions.
 >
 >Note, to create tooltips with the correct behaviour, use tes3ui.createTooltipMenu.
 >
 >Unlike standard menus, help layer menus are always created with a fixed frame.

#### [createMenu](tes3ui/createMenu.md)

> Creates a top-level menu.

#### [createTooltipMenu](tes3ui/createTooltipMenu.md)

> Creates a tooltip menu. This should be called from within a tooltip event callback. These automatically follow the mouse cursor, and are also destroyed automatically when the mouse leaves the originating element.

#### [enterMenuMode](tes3ui/enterMenuMode.md)

> Requests menu mode be activated on a menu with a given id.

#### [findHelpLayerMenu](tes3ui/findHelpLayerMenu.md)

> Locates a help layer menu through its id. Help layer menus include notifications and tooltips that are always above the rest of the interface. The game realizes this using a separate menu root and set of functions.

#### [findMenu](tes3ui/findMenu.md)

> Locates a top-level menu through its id.

#### [forcePlayerInventoryUpdate](tes3ui/forcePlayerInventoryUpdate.md)

> Forces the game to update the inventory tile GUI elements. Unlike tes3ui.updateInventoryTiles, this will force-resync the player's inventory to the GUI, rather than updating what is already in the GUI system.

#### [getInventorySelectType](tes3ui/getInventorySelectType.md)

> Determines what sort of search is being done when performing an inventory selection, e.g. "alembic" or "ingredient" or "soulGemFilled".

#### [getMenuOnTop](tes3ui/getMenuOnTop.md)

> Returns the top-most, active menu.

#### [getPalette](tes3ui/getPalette.md)

> Gets a standard palette color. Returns an array containing the RGB color values, in the range [0.0, 1.0].

#### [getServiceActor](tes3ui/getServiceActor.md)

> Returns the mobile actor currently providing services to the player.

#### [leaveMenuMode](tes3ui/leaveMenuMode.md)

> Requests menu mode be deactivated on a menu with a given id.

#### [logToConsole](tes3ui/logToConsole.md)

> Logs a message to the console.

#### [menuMode](tes3ui/menuMode.md)

> Checks if the game is in menu mode.

#### [registerID](tes3ui/registerID.md)

> Registers a UI element name, returning a UI_ID. Once a property is registered, this function always returns the same UI_ID. These UI_IDs are used by the API to locate elements that may not exist (a weak reference), instead of by element name.
 >
 >The registry namespace is shared between Property and UI_ID. It is advisable to use a namespace prefix to avoid collisions with other mods.

#### [registerProperty](tes3ui/registerProperty.md)

> Registers a property name, returning a Property. Once a property is registered, this function always returns the same Property.
 >
 >The registry namespace is shared between Property and UI_ID. It is advisable to use a namespace prefix to avoid collisions with other mods.

#### [showBookMenu](tes3ui/showBookMenu.md)

> Displays the book menu with arbitrary text. Paging is automatically handled.

#### [showScrollMenu](tes3ui/showScrollMenu.md)

> Displays the scroll menu with arbitrary text.

#### [suppressTooltip](tes3ui/suppressTooltip.md)

> Controls hiding of world object tooltips.

#### [updateBarterMenuTiles](tes3ui/updateBarterMenuTiles.md)

> Forces the game to update the barter tile GUI elements.

#### [updateInventorySelectTiles](tes3ui/updateInventorySelectTiles.md)

> Forces the game to update the inventory selection GUI elements.

#### [updateInventoryTiles](tes3ui/updateInventoryTiles.md)

> Forces the game to update the inventory tile GUI elements.
