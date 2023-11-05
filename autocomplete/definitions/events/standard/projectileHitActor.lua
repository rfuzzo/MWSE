return {
	type = "event",
	description = "The projectileHitActor event fires when a projectile collides with an actor.",
	related = { "projectileHitActor", "projectileHitObject", "projectileHitTerrain", "projectileExpire" },
	eventData = {
		["mobile"] = {
			type = "tes3mobileProjectile",
			readOnly = true,
			description = "The mobile projectile that is expiring.",
		},
		["target"] = {
			type = "tes3reference",
			readOnly = true,
			description = "Reference to the actor that was hit.",
		},
		["collisionPoint"] = {
			type = "tes3vector3",
			readOnly = true,
			description = "The collision point of the mobile projectile.",
		},
		["position"] = {
			type = "tes3vector3",
			readOnly = true,
			description = "The position of the mobile projectile at collision.",
		},
		["velocity"] = {
			type = "tes3vector3",
			readOnly = true,
			description = "The velocity of the mobile projectile at collision.",
		},
		["firingReference"] = {
			type = "tes3reference",
			readOnly = true,
			description = "Reference to the actor that fired the projectile.",
		},
		["firingWeapon"] = {
			type = "tes3weapon",
			readOnly = true,
			description = "The weapon that fired the projectile.",
		},
	},
}