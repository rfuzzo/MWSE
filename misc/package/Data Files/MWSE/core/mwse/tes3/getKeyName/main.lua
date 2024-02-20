---@param keyCode tes3.scanCode
function tes3.getKeyName(keyCode)
    -- get the index of the appropriate GMST setting
    -- the `%02X` does hexadecimal formatting and gives numbers `< 16` a leading 0.
    -- so, `11` -> "0A" and `16` -> "10"
    local index = string.format("sKeyName_%02X", keyCode)
	local gmst = tes3.gmst[index]
    -- if the game setting exists, return its value
	if gmst then
		return tes3.findGMST(gmst).value
	end
end