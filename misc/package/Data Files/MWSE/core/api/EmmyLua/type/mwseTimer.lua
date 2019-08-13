
--- A Timer is a class used to keep track of callback that should be invoked at a later time.
---@class mwseTimer
mwseTimer = {}

--- Cancels the timer.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/mwseTimer/cancel.html).
---@type method
function mwseTimer:cancel() end

--- The amount of iterations left for the timer.
---@type number
mwseTimer.iterations = nil

--- The amount of time left on the timer.
---@type number
mwseTimer.duration = nil

--- When this timer ends, or the time remaining if the timer is paused.
---@type number
mwseTimer.timing = nil

--- The state of the timer, matching timer.active, timer.paused, or timer.expired.
---@type number
mwseTimer.state = nil

--- The callback that will be invoked when the timer elapses.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/mwseTimer/callback.html).
---@type function
function mwseTimer.callback() end

--- Pauses the timer.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/mwseTimer/pause.html).
---@type method
function mwseTimer:pause() end

--- Resumes a paused timer.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/mwseTimer/resume.html).
---@type method
function mwseTimer:resume() end

--- The amount of time left before this timer will complete.
---@type number
mwseTimer.timeLeft = nil

--- Resets the timer completion time, as if it elapsed. Only works if the timer is active.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/type/mwseTimer/reset.html).
---@type method
function mwseTimer:reset() end


