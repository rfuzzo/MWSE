
local function disableNegativeLights()
	for light in tes3.iterateObjects(tes3.objectType.light) do
		---@cast light tes3light

		if light.isNegative then
			light.isOffByDefault = true
			light.radius = 0
		end
	end
end
event.register(tes3.event.initialized, disableNegativeLights)
