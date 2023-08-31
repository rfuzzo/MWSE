
local reference = tes3.is3rdPerson() and tes3.player or tes3.player1stPerson
local lowerTiming, upperTiming, leftArmTiming = unpack(
	tes3.getAnimationTiming({ reference = reference })
)
