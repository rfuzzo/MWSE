
--- Forces the game to update the barter tile GUI elements.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/updateBarterMenuTiles.html).
---@type function
function tes3ui.updateBarterMenuTiles() end

--- Displays the book menu with arbitrary text. Paging is automatically handled.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/showBookMenu.html).
---@type function
---@param text string
function tes3ui.showBookMenu(text) end

--- Requests menu mode be activated on a menu with a given id.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/enterMenuMode.html).
---@type function
---@param id number
---@return boolean
function tes3ui.enterMenuMode(id) end

--- Creates a tooltip menu. This should be called from within a tooltip event callback. These automatically follow the mouse cursor, and are also destroyed automatically when the mouse leaves the originating element.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/createTooltipMenu.html).
---@type function
---@return tes3uiElement
function tes3ui.createTooltipMenu() end

--- Checks if the game is in menu mode.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/menuMode.html).
---@type function
---@return boolean
function tes3ui.menuMode() end

--- Sends all text input to the specified element. Suppresses keybinds while active. Calling this function with a nil argument will release text input and allow keybinds to work.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/acquireTextInput.html).
---@type function
---@param element tes3uiElemenet { optional = "after" }
function tes3ui.acquireTextInput(element) end

--- Gets a standard palette color. Returns an array containing the RGB color values, in the range [0.0, 1.0].
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/getPalette.html).
---@type function
---@param name string { comment = "The name of the palette color." }
---@return table
function tes3ui.getPalette(name) end

--- Controls hiding of world object tooltips.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/suppressTooltip.html).
---@type function
---@param suppress boolean { comment = "Turns on suppression if true, immediately hiding any active tooltip and further world object tooltips. Turns off suppression if false." }
function tes3ui.suppressTooltip(suppress) end

--- Logs a message to the console.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/logToConsole.html).
---@type function
---@param text string
---@param isCommand boolean
function tes3ui.logToConsole(text, isCommand) end

--- When used in a mouse event, causes the element to capture further mouse events even when the cursor goes outside the element.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/captureMouseDrag.html).
---@type function
---@param capture boolean { comment = "Turns on mouse capture for the element currently processing a mouse event if true, sending all further mouse events to that element. Turns off capture if false." }
function tes3ui.captureMouseDrag(capture) end

--- Forces the game to update the inventory tile GUI elements.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/updateInventoryTiles.html).
---@type function
function tes3ui.updateInventoryTiles() end

--- Returns the top-most, active menu.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/getMenuOnTop.html).
---@type function
---@return tes3uiElement
function tes3ui.getMenuOnTop() end

--- Determines what sort of search is being done when performing an inventory selection, e.g. "alembic" or "ingredient" or "soulGemFilled".
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/getInventorySelectType.html).
---@type function
---@return string
function tes3ui.getInventorySelectType() end

--- Returns the mobile actor currently providing services to the player.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/getServiceActor.html).
---@type function
---@return tes3mobileActor
function tes3ui.getServiceActor() end

--- Forces the game to update the inventory selection GUI elements.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/updateInventorySelectTiles.html).
---@type function
function tes3ui.updateInventorySelectTiles() end

--- Registers a property name, returning a Property. Once a property is registered, this function always returns the same Property.
---|
---|The registry namespace is shared between Property and UI_ID. It is advisable to use a namespace prefix to avoid collisions with other mods.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/registerProperty.html).
---@type function
---@param s string
---@return number
function tes3ui.registerProperty(s) end

--- Displays the scroll menu with arbitrary text.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/showScrollMenu.html).
---@type function
---@param text string
function tes3ui.showScrollMenu(text) end

--- Locates a help layer menu through its id. Help layer menus include notifications and tooltips that are always above the rest of the interface. The game realizes this using a separate menu root and set of functions.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/findHelpLayerMenu.html).
---@type function
---@param id number
---@return tes3uiElement
function tes3ui.findHelpLayerMenu(id) end

--- Registers a UI element name, returning a UI_ID. Once a property is registered, this function always returns the same UI_ID. These UI_IDs are used by the API to locate elements that may not exist (a weak reference), instead of by element name.
---|
---|The registry namespace is shared between Property and UI_ID. It is advisable to use a namespace prefix to avoid collisions with other mods.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/registerID.html).
---@type function
---@param s string
---@return number
function tes3ui.registerID(s) end

--- Locates a top-level menu through its id.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/findMenu.html).
---@type function
---@param id number { comment = "The ID of the menu to locate." }
---@return tes3uiElement
function tes3ui.findMenu(id) end

--- Forces the game to update the inventory tile GUI elements. Unlike tes3ui.updateInventoryTiles, this will force-resync the player's inventory to the GUI, rather than updating what is already in the GUI system.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/forcePlayerInventoryUpdate.html).
---@type function
function tes3ui.forcePlayerInventoryUpdate() end

--- Creates a top-level menu.
---|
---|**Accepts table parameters:**
---|* `id` (*number*): The menu’s ID. The menu can be later accessed by tes3ui.findMenu(id).
---|* `dragFrame` (*boolean*): Constructs a draggable and resizeable frame and background for the menu. It is similar to the stats, inventory, magic and map menus in the standard UI. After construction, position and minimum dimensions should be set.
---|* `fixedFrame` (*boolean*): Constructs a fixed (non-draggable) frame and background for the menu. The layout system should automatically centre and size it to fit whatever is added to the menu.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/createMenu.html).
---@type function
---@param params table
---@return tes3uiElement
function tes3ui.createMenu(params) end

--- Creates a help layer menu. Help layer menus include notifications and tooltips that are always above the rest of the interface. The game realizes this using a separate menu root and set of functions.
---|
---|Note, to create tooltips with the correct behaviour, use tes3ui.createTooltipMenu.
---|
---|Unlike standard menus, help layer menus are always created with a fixed frame.
---|
---|**Accepts table parameters:**
---|* `id` (*number*): The menu’s ID. The menu can be later accessed by tes3ui.findHelpLayerMenu(id).
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/createHelpLayerMenu.html).
---@type function
---@param params table
---@return tes3uiElement
function tes3ui.createHelpLayerMenu(params) end

--- Requests menu mode be deactivated on a menu with a given id.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/tes3ui/leaveMenuMode.html).
---@type function
---@param id number
---@return boolean
function tes3ui.leaveMenuMode(id) end


