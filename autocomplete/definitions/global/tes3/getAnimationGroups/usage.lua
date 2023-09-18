
local function onSimulate()
	local reference = tes3.is3rdPerson() and tes3.player or tes3.player1stPerson

	local _, upperGroup, _ = tes3.getAnimationGroups({ reference = reference })
	if upperGroup ~= tes3.animationGroup.bowAndArrow then return end

	local _, upperTiming, _ = unpack(
		tes3.getAnimationTiming({ reference = reference })
	)
	tes3.messageBox(upperTiming)
end
event.register(tes3.event.simulate, onSimulate)
