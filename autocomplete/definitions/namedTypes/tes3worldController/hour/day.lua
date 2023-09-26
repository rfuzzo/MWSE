
--- The strings returned by getDayTime function.
--- Using an alias as a collection for these strings
--- gives better autocomplete suggestions.
---@alias myModDaySegment
---| "sunrise"
---| "day"
---| "sunset"
---| "night"

--- This function returns a string that represents the current part of day.
--- The day segments are based on the sunset and sunrise durations.
---@return myModDaySegment
local function getDayTime()
	local hour = tes3.worldController.hour.value
	local wc = tes3.worldController.weatherController

	local sunriseBegin = wc.sunriseHour
	local sunriseDuration = wc.sunsetDuration
	local sunriseEnd = sunriseBegin + sunriseDuration

	local sunsetBegin = wc.sunsetHour
	local sunsetDuration = wc.sunsetDuration
	local sunsetEnd = sunsetBegin + sunsetDuration

	if (hour >= sunriseBegin and hour < sunriseEnd) then
		return "sunrise"
	elseif (hour >= sunriseEnd and hour < sunsetBegin) then
		return "day"
	elseif (hour >= sunsetBegin and hour < sunsetEnd) then
		return "sunset"
	else
		return "night"
	end
end

local function onLoaded()
	tes3.messageBox("Currently it's " .. getDayTime())
end
event.register(tes3.event.loaded, onLoaded)
