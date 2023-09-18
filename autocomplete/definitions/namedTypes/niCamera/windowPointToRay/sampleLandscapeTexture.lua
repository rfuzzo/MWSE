
local function onEnterFrame()
	local cursor = tes3.getCursorPosition()
	local camera = tes3.worldController.worldCamera.cameraData.camera
	local position, direction = camera:windowPointToRay({ cursor.x, cursor.y })

	local hit = tes3.rayTest({
		position = position,
		direction = direction,
		-- Let's ray test agains terrain
		root = tes3.game.worldLandscapeRoot
	})
	if not hit or not hit.object then return end

	local texturingProperty = hit.object.texturingProperty
	if not texturingProperty then return end

	local baseMap = texturingProperty.maps[1]
	if not baseMap or not baseMap.texture then return end

	tes3.messageBox(baseMap.texture.fileName)
end

local function onLoaded()
	if event.isRegistered(tes3.event.enterFrame, onEnterFrame) then return end

	event.register(tes3.event.enterFrame, onEnterFrame)
end

event.register(tes3.event.loaded, onLoaded)
