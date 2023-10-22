
-- In this example, we force the attack
-- direction for axes to always be chop

---@param e attackStartEventData
local function onAttackStart(e)
	local mobile = e.reference.mobile
	if not mobile then return end

	local weapon = mobile.readiedWeapon.object --[[@as tes3weapon]]

	if weapon.type == tes3.weaponType.axeOneHand
	or weapon.type == tes3.weaponType.axeTwoHand then
		-- Now actually change the attack direction
		e.attackType = tes3.physicalAttackType.chop
	end
end

event.register(tes3.event.attackStart, onAttackStart)
