
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
	arrows.scale = 30

	-- Attaching our arrows shape to a node in the scene graph will
	-- make it actually visible in-game.
	root:attachChild(arrows)

	-- No changes are applied until the update() method was called on the parent node.
	root:update()
end
event.register(tes3.event.loaded, onLoaded)

local function simulateCallback()
	-- Let's set the base position of the arrows in the in-game world to the player's
	-- eye position. Then we offset it in the direction of eye vector by 200 units.
	-- We get the arrows following the player's cursor at 200 units distance.
	arrows.translation = tes3.getPlayerEyePosition() + tes3.getPlayerEyeVector() * 200
	arrows:update()
end
event.register(tes3.event.simulate, simulateCallback)
