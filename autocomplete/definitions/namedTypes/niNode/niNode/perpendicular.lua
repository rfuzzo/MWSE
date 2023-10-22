
---@type niTriShape
local arrows

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

	-- Objects in the scene graph share as much same properties as possible, which
	-- allows for some optimizations. Because of that, we need to clone our object
	-- before attaching it to the scene graph.
	arrows = widgets.arrows:clone() --[[@as niTriShape]]

	-- The base size of the arrows is 1 unit. Let's make them a bit bigger.
	arrows.scale = 100

	-- Attaching our arrows shape to a node in the scene graph will
	-- make it actually visible in-game.
	root:attachChild(arrows)

	-- No changes are applied until the update() method was called on the parent node.
	root:update()
end
event.register(tes3.event.loaded, onLoaded)


-- This is the up axis unit vector.
local UP = tes3vector3.new(0, 0, 1)

--- This function returns the difference in direction
--- of two vectors in Euler angles in radians.
---@param vec1 tes3vector3
---@param vec2 tes3vector3
---@return tes3vector3, boolean?
local function rotationDifference(vec1, vec2)
	vec1 = vec1:normalized()
	vec2 = vec2:normalized()

	local axis = vec1:cross(vec2)
	local norm = axis:length()
	if norm < 1e-5 then
		return tes3vector3.new(0, 0, 0)
	end

	local angle = math.asin(norm)
	if vec1:dot(vec2) < 0 then
		angle = math.pi - angle
	end

	axis:normalize()
	local m = tes3matrix33.new()
	m:toRotation(-angle, axis.x, axis.y, axis.z)
	return m:toEulerXYZ()
end


local function simulateCallback()
	local hit = tes3.rayTest({
		position = tes3.getPlayerEyePosition(),
		direction = tes3.getPlayerEyeVector(),
		returnNormal = true,
		returnSmoothNormal = true,
		ignore = { tes3.player }
	})
	if not hit then return end

	-- First, set the the arrows position
	arrows.translation = hit.intersection

	-- Now, let's get the rotation
	local rotation = rotationDifference(UP, hit.normal)
	local m = tes3matrix33.new()

	-- We need to convert our rotation to a rotation matrix
	-- since nodes of scene graph store their rotations in
	-- that form.
	m:fromEulerXYZ(rotation.x, rotation.y, rotation.z)
	arrows.rotation = m

	arrows:update()
end
event.register(tes3.event.simulate, simulateCallback)
