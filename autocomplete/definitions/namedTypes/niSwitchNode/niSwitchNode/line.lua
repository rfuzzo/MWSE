
---@type niSwitchNode, niCamera
local line, camera
local verticalOffset = tes3vector3.new(0, 0, -5)

local function onLoaded()
	-- MWSE ships with a mesh which contains a few useful widgets.
	-- These can be used during debugging.
	local mesh = tes3.loadMesh("mwse\\widgets.nif") --[[@as niNode]]
	local widgets = {
		-- 3D coordinate axes
		arrows = mesh:getObjectByName("unitArrows") --[[@as niTriShape]],
		-- A common switch node that has three almost infinite lines
		-- along each coordinate exis
		axes = mesh:getObjectByName("axisLines") --[[@as niSwitchNode]],
		plane = mesh:getObjectByName("unitPlane") --[[@as niTriShape]],
		sphere = mesh:getObjectByName("unitSphere") --[[@as niTriShape]]
	}

	local root = tes3.worldController.vfxManager.worldVFXRoot
	---@cast root niNode

	line = widgets.axes:clone() --[[@as niSwitchNode]]
	root:attachChild(line)
	root:update()

	-- switchIndex = 0 - x axis (red)
	-- switchIndex = 1 - y axis (green)
	-- switchIndex = 2 - z axis (blue)
	line.switchIndex = 1

	camera = tes3.worldController.worldCamera.cameraData.camera
end
event.register(tes3.event.loaded, onLoaded)

local function simulateCallback()
	-- Let's make the line's origin at the eye position.
	-- The position is offset -5 along the Z axis, so that
	-- that we can actually see the line (the line isn't
	-- visible if looking directly along the line).
	line.translation = tes3.getPlayerEyePosition() + verticalOffset

	local rotation = tes3matrix33.new()

	-- Make the line point in the look direction.
	-- We'll get the direction vector from the world camera.
	rotation:lookAt(camera.worldDirection, camera.worldUp)
	line.rotation = rotation
	line:update()
end
event.register(tes3.event.simulate, simulateCallback)
