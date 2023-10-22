return {
	type = "event",
	description = "This event is triggered just before an on-strike or on-use enchantment is used by any actor, and also by the UI system to label enchant charges. It allows modification of the charge required to use an enchantment.",
	eventData = {
		["caster"] = {
			type = "tes3reference",
			readOnly = true,
			description = "The caster of the enchantment.",
		},
		["source"] = {
			type = "tes3enchantment",
			readOnly = true,
			description = "The enchantment being used or examined by the UI.",
		},
		["charge"] = {
			type = "number",
			description = "The charge required to cast the enchantment. May be modified.",
		},
		["isCast"] = {
			type = "boolean",
			description = "True if the calculation is for a on-strike or on-use action, false if for UI enchant charge display. The type of action is found at `e.source.castType`.",
		},
		["sourceInstance"] = {
			type = "tes3magicSourceInstance|nil",
			readOnly = true,
			description = [[Only available when isCast is true. The instance object of the magic being cast.

Warning: The sourceInstance may be destroyed immediately if the cast fails due to insufficient charge. Do not keep a long-lived reference to this sourceInstance. If you need to reference it in the future, save the source's `serialNumber` and look it up with `tes3.getMagicSourceInstanceBySerial`.]],
		},
		["item"] = {
			type = "tes3item",
			readOnly = true,
			description = "Only available when isCast is true. The item used to cast the enchantment.",
		},
		["itemData"] = {
			type = "tes3itemData",
			readOnly = true,
			description = "Only available when isCast is true. The item data of the item used to cast the enchantment.",
		},
	},
	filter = "caster",
}