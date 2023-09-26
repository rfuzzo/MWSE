
--- Returns true if the mobile is moving.
---@param mobile tes3mobileCreature|tes3mobileNPC|tes3mobilePlayer
---@return boolean
local function isMoving(mobile)
	return mobile.isMovingForward or mobile.isMovingBack or mobile.isMovingLeft or mobile.isMovingRight
end
