local ffi = require("ffi")

local Base = require("mwse.ui.tes3uiElement.createColorPicker.Base")
local Image = require("mwse.ui.tes3uiElement.createColorPicker.Image")
local colorUtils = require("mwse.ui.tes3uiElement.createColorPicker.colorUtils")
local UIID = require("mwse.ui.tes3uiElement.createColorPreview.uiid")

-- Defined in colorUtils\init.lua
local ffiPixel = ffi.typeof("RGB") --[[@as fun(init: ffiImagePixelInit?): ffiImagePixel]]

--- @class ColorPreview
--- @field width integer Width of the individual preview image.
--- @field height integer Height of the individual preview image.
--- @field checkerSize integer?
--- @field lightGray ImagePixel?
--- @field darkGray ImagePixel?
--- @field image Image
--- @field checkerboard Image
--- @field texture niSourceTexture
--- @field color ffiImagePixel
--- @field alpha number
--- @field element tes3uiElement
local ColorPreview = Base:new()

--- @class ColorPreview.new.data
--- @field width integer Width of the individual preview image.
--- @field height integer Height of the individual preview image.--- @field initialColor ImagePixel
--- @field checkerSize? integer? *Default: 16*
--- @field lightGray ImagePixel? *Default: { r = 0.7, g = 0.7, b = 0.7 }*
--- @field darkGray ImagePixel? *Default: { r = 0.5, g = 0.5, b = 0.5 }*
--- @field color ImagePixel
--- @field alpha number? *Default*: 1.0

--- @param data ColorPreview.new.data
--- @return ColorPreview
function ColorPreview:new(data)
	local t = Base:new(data)
	setmetatable(t, self)

	t.color = ffiPixel({ data.color.r, data.color.g, data.color.b })
	t.alpha = data.alpha or 1.0

	t.checkerboard = Image:new({
		width = data.width,
		height = data.height
	})
	t.checkerboard:toCheckerboard(data.checkerSize, data.lightGray, data.darkGray)
	t.image = Image:new({
		width = data.width,
		height = data.height,
	})
	colorUtils.generatePreviewImage(t.color, t.alpha, t.image, t.checkerboard)

	t.texture = niPixelData.new(data.width, data.height):createSourceTexture()
	t.texture.isStatic = false

	self.__index = self
	return t
end


--- @param newColor ffiImagePixel
--- @param alpha number
function ColorPreview:setColor(newColor, alpha)
	self.color = newColor
	self.alpha = alpha

	-- self.element is set by the tes3uiElement:makeLuaWidget.
	local container = self.element
	local standardPreview = container:findChild(UIID.rect)
	standardPreview.color = { newColor.r, newColor.g, newColor.b }

	local colorPreview = container:findChild(UIID.image)
	-- Not every preview has checkered preview.
	if not colorPreview then return end
	colorUtils.generatePreviewImage(newColor, alpha, self.image, self.checkerboard)
	colorPreview.texture.pixelData:setPixelsFloat(self.image:toPixelBufferFloat())
end

function ColorPreview:getAlpha()
	return self.alpha
end

--- @return ImagePixel
function ColorPreview:getColor()
	local c = self.color
	return { r = c.r, g = c.g, b = c.b }
end

function ColorPreview:getColorAlpha()
	return self:getColor(), self:getAlpha()
end

--- @return ImagePixelA
function ColorPreview:getRGBA()
	local c = self.color
	return { r = c.r, g = c.g, b = c.b, a = self.alpha }
end

return ColorPreview
