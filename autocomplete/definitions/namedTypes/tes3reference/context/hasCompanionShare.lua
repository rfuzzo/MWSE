--- This function returns `true` if the reference
--- has a variable companion set to 1 in its script.
---@param reference tes3reference
---@return boolean
local function hasCompanionShare(reference)

	-- Any local script variable inside `tes3scriptContext`
	-- objects can be read as if it were a normal Lua table
	-- (`reference.context` is of `tes3scriptContext` type)
	local companion = reference.context.companion
	-- or:
	-- local companion = reference.context["companion"]

	-- In addition, local script variables can be accessed from the tes3npc object:
	-- myNpc.script.context.somVarName

	-- To change the variable value, do an assignment:
	-- reference.context.companion = 0

	return (
		companion and
		companion == 1 or
		false
	)
end