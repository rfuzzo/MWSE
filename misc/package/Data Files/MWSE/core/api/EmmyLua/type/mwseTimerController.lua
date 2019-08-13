
--- A Timer Controller is a class used to sort and trigger callbacks based on an arbitrary timekeeping mechanic.
---@class mwseTimerController
mwseTimerController = {}

--- The current clock time for this timer controller.
---@type number
mwseTimerController.clock = nil

--- Creates a timer for the given Timer Controller.
---|
---|**Accepts table parameters:**
---|* `type` (*number*)
---|* `duration` (*number*)
---|* `callback` (*function*)
---|* `iterations` (*number*): Optional.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/mwseTimerController/create.html).
---@type method
---@param params table
---@return mwseTimer { name = "timer" }
function mwseTimerController:create(params) end

--- Creates a new Timer Controller. Its initial clock is zero, unless a start time is provided.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/mwseTimerController/new.html).
---@type function
---@param startTime number { optional = "after" }
---@return mwseTimerController
function mwseTimerController.new(startTime) end


