return {
	type = "method",
	description = [[Induces hit stun on the actor. Without any parameters, it produces a brief stun that lasts about 1 second and prevents starting a new attack. It can produce other types of stun, see parameters. There are states where actors can't be stunned (such as already being in hit stun and paralysis). The function will return if the stun was successfuly applied.]],
	arguments = {{
		name = "params",
		type = "table",
		optional = true,
		tableParams = {
			{ name = "knockDown", type = "boolean", optional = true, description = "Changes the stun type to knockdown. This is when the character falls to their knees and takes several seconds to recover. It will interrupt spell casting." },
			{ name = "cancel", type = "boolean", optional = true, description = "Cancels hit stun and knockdown when used on the same frame as the hit. For regular combat, it should be used in the events `damaged` or `damagedHandToHand`." },
		},
	}},
	valuetype = "boolean",
}