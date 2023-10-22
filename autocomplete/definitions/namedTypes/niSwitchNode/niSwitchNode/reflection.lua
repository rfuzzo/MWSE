
---@type niSwitchNode, niSwitchNode, niCamera
local lineIn, lineOut, camera
local verticalOffset = tes3vector3.new(0, 0, -30)

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

	lineIn = widgets.axes:clone() --[[@as niSwitchNode]]
	lineOut = lineIn:clone() --[[@as niSwitchNode]]

	root:attachChild(lineIn)
	root:attachChild(lineOut)
	root:update()

	-- switchIndex = 0 - x axis (red)
	-- switchIndex = 1 - y axis (green)
	-- switchIndex = 2 - z axis (blue)
	lineIn.switchIndex = 1
	lineOut.switchIndex = 1
	camera = tes3.worldController.worldCamera.cameraData.camera
end
event.register(tes3.event.loaded, onLoaded)

local function simulateCallback()
	lineIn.translation = tes3.getPlayerEyePosition() + verticalOffset

	local inDirection = camera.worldDirection
	local rotation = lineIn.rotation:copy()
	rotation:lookAt(inDirection, camera.worldUp)

	lineIn.rotation = rotation
	lineIn:update()

	-- Now get the coordinates for the outLine
	--local inDirection = tes3.getPlayerEyeVector()
	local hit = tes3.rayTest({
		position = lineIn.translation,
		direction = inDirection,
		returnNormal = true,
		returnSmoothNormal = true,
		ignore = { tes3.player, tes3.player1stPerson }
	})
	if not hit then return end

	lineOut.translation = hit.intersection

	local normal = hit.normal
	local outDirection = inDirection - (normal * inDirection:dot(normal) * 2)
	outDirection:normalize()
	local axis = outDirection:cross(inDirection)
	local rotation = tes3matrix33.new()
	rotation:lookAt(outDirection, axis:normalized())

	lineOut.rotation = rotation
	lineOut:update()
end
event.register(tes3.event.simulate, simulateCallback)
