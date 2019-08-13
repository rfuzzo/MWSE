
--- Creates a timer that will finish the next frame. It defaults to the next simulation frame.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/timer/delayOneFrame.html).
---@type function
---@param callback function
---@param type number
---@return mwseTimer { name = "timer" }
function timer.delayOneFrame(callback, type) end

--- Constant to represent timers that run when the game isn't paused.
---@type number
timer.simulate = nil

--- Constant to represent a timer that is paused.
---@type number
timer.paused = nil

--- Constant to represent a timer that is actively running.
---@type number
timer.active = nil

--- Constant to represent a timer that has completed.
---@type number
timer.expired = nil

--- Constant to represent timers that run based on in-world time.
---@type number
timer.game = nil

--- Creates a timer.
---|
---|**Accepts table parameters:**
---|* `type` (*number*): Defaults to timer.simulate. Optional.
---|* `duration` (*number*): Duration of the timer. The method of time passing depends on the timer type.
---|* `callback` (*function*): The callback function that will execute when the timer expires.
---|* `iterations` (*number*): The number of iterations to run. Default: 1.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/timer/start.html).
---@type function
---@param params table
---@return mwseTimer { name = "timer" }
function timer.start(params) end

--- Constant to represent timers that run in real-time.
---@type number
timer.real = nil


