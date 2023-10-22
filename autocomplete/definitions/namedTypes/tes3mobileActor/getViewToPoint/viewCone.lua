-- These are view cone sizes in degrees
local viewCone = {
	first = 30,
	third = 45,
}

--- This will return true if the target is inside player's view cone.
--- It doesn't perform any checks if there is line connecting the player
--- and reference. In other words this won't check if the reference
--- isn't actually visible if it's covered by a building for example.
---@param ref tes3reference
---@return boolean
local function inPCViewCone(ref)
	local angle = math.abs(tes3.mobilePlayer:getViewToPoint(ref.position))
	local cone = (tes3.is3rdPerson() and viewCone.third) or viewCone.first
	if angle < cone then
		return true
	end
	return false
end
