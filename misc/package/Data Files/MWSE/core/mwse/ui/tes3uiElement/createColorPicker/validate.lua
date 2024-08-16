local this = {}


--- @param n number
function this.inUnitRange(n)
	if n < 0 or n > 1 then
		return false
	end
	return true
end

--- @param pixel ImagePixel
function this.pixel(pixel)
	if not pixel.r
	or not this.inUnitRange(pixel.r)
	or not pixel.g
	or not this.inUnitRange(pixel.g)
	or not pixel.b
	or not this.inUnitRange(pixel.b) then
		return false
	end
	return true
end


return this
