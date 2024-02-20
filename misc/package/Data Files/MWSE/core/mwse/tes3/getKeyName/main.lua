---@param keyCode tes3.scanCode
function tes3.getKeyName(keyCode)
    -- get the index of the appropriate GMST setting
    -- the `%02X` does hexadecimal formatting and gives numbers `< 16` a leading 0.
    --      so, `11` -> "0A" and `16` -> "10"
    -- for example, if `keyCode == tes3.scanCode["2"] == 3`, then
    --      `string.format("sKeyName_%02X", keyCode) == sKeyName_03`
	local index = tes3.gmst[string.format("sKeyName_%02X", keyCode)]
    -- if the game setting exists, return its value
	if index then
		return tes3.findGMST(index).value
	end
end