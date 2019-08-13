
--- A core game object used for storing both active and non-dynamic gameplay data.
---@class tes3dataHandler
tes3dataHandler = {}

--- Access to the current interior cell, if the player is in an interior.
---@type tes3cell
tes3dataHandler.currentInteriorCell = nil

--- A flag set for the frame that the player has changed cells.
---@type boolean
tes3dataHandler.cellChanged = nil

---@type number
tes3dataHandler.threadSleepTime = nil

--- The position of the origin longitudinal grid coordinate.
---@type boolean
tes3dataHandler.centralGridY = nil

--- A child structure where core game objects are held.
---@type tes3nonDynamicData
tes3dataHandler.nonDynamicData = nil

--- One of the core parent scene graph nodes.
---@type niNode
tes3dataHandler.worldPickLandscapeRoot = nil

--- Access to the cell that the player is currently in.
---@type tes3cell
tes3dataHandler.currentCell = nil

--- A Windows handle to the background processing thread.
---@type number
tes3dataHandler.backgroundThread = nil

--- Access to the running state for the background processing thread.
---@type boolean
tes3dataHandler.backgroundThreadRunning = nil

--- Access to the last visited exterior cell.
---@type tes3cell
tes3dataHandler.lastExteriorCell = nil

--- The thread ID for the background processing thread.
---@type number
tes3dataHandler.backgroundThreadId = nil

--- The thread ID for the main execution thread.
---@type number
tes3dataHandler.mainThreadId = nil

--- The position of the origin horizontal grid coordinate.
---@type boolean
tes3dataHandler.centralGridX = nil

--- One of the core parent scene graph nodes.
---@type niNode
tes3dataHandler.worldPickObjectRoot = nil

--- A Windows handle to the main execution thread.
---@type number
tes3dataHandler.mainThread = nil

--- One of the core parent scene graph nodes.
---@type niNode
tes3dataHandler.worldObjectRoot = nil


