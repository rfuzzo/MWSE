
--- Removes all callbacks registered for a given event.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/event/clear.html).
---@type function
---@param eventId string
---@param options table { optional = "after" }
function event.clear(eventId, options) end

--- Triggers an event. This can be used to trigger custom events with specific data.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/event/trigger.html).
---@type function
---@param eventId string
---@param payload table { optional = "after" }
---@param options table { optional = "after" }
function event.trigger(eventId, payload, options) end

--- Unregisters a function  event is raised.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/event/unregister.html).
---@type function
---@param eventId string
---@param callback function
---@param options table { optional = "after" }
function event.unregister(eventId, callback, options) end

--- Registers a function to be called when an event is raised.
---|
---|[Read online documentation](https://mwse.readthedocs.io/en/latest/lua/api/event/register.html).
---@type function
---@param eventId string
---@param callback function
---@param options table { optional = "after" }
function event.register(eventId, callback, options) end


