local ffi = require("ffi")

local CONSTANTS = require("mwse.ui.tes3uiElement.createColorPicker.constants")
local format = require("mwse.ui.tes3uiElement.createColorPicker.formatHelpers")
local oklab = require("mwse.ui.tes3uiElement.createColorPicker.oklab")
local UIID = require("mwse.ui.tes3uiElement.createColorPicker.uiid")

-- Defined in oklab\init.lua
local ffiPixel = ffi.typeof("RGB") --[[@as fun(init: ffiImagePixelInit?): ffiImagePixel]]
local this = {}

--- @param picker ColorPicker
--- @param parent tes3uiElement
--- @param newColor ffiImagePixel
--- @param alpha number
local function updatePreview(picker, parent, newColor, alpha)
	local previewsContainer = parent:findChild(UIID.preview.topContainer)
	local currentContainer = previewsContainer.children[1]

	-- standardPreview is a colored rect.
	local standardPreview = currentContainer:findChild(UIID.preview.left)
	standardPreview.color = { newColor.r, newColor.g, newColor.b }

	-- checkersPreview is the currently selected color alpha blended on checkered background.
	local checkersPreview = currentContainer:findChild(UIID.preview.right)
	picker:updatePreviewImage(newColor, alpha)
	checkersPreview.texture.pixelData:setPixelsFloat(picker.previewImage:toPixelBufferFloat())
end

--- @alias IndicatorID
---| "main"
---| "hue"
---| "alpha"
---| "slider"

--- @param parent tes3uiElement
local function getIndicators(parent)
	--- @type table<IndicatorID, tes3uiElement>
	local indicators = {}
	for _, UIID in pairs(UIID.indicator) do
		local indicator = parent:findChild(UIID)
		-- Not every Color Picker will have alpha indicator.
		if indicator then
			local id = indicator:getLuaData("indicatorID")
			indicators[id] = indicator
		end
	end
	return indicators
end

--- @param parent tes3uiElement
--- @param newColor ffiImagePixel
--- @param alpha number?
function this.updateIndicatorPositions(parent, newColor, alpha)
	local hsv = oklab.hsvlib_srgb_to_hsv(newColor)
	local indicators = getIndicators(parent)
	indicators.main.absolutePosAlignX = hsv.s
	indicators.main.absolutePosAlignY = 1 - hsv.v
	indicators.hue.absolutePosAlignY = hsv.h / 360
	if indicators.alpha then
		indicators.alpha.absolutePosAlignY = 1 - alpha
	end
	-- Update main picker's slider
	indicators.slider.widget.current = hsv.s * CONSTANTS.SLIDER_SCALE
	indicators.hue:getTopLevelMenu():updateLayout()
end


--- @param parent tes3uiElement
--- @param newColor ffiImagePixel|ImagePixel|ImagePixelA
--- @param alpha number
function this.updateValueInput(parent, newColor, alpha)
	local input = parent:findChild(UIID.textInput)
	if not input then return end

	-- Make sure we don't get NaNs in color text inputs. We clamp alpha here.
	if alpha then
		alpha = math.clamp(alpha, 0.0000001, 1.0)
	end

	local newText = ""
	if input:getLuaData("hasAlpha") then
		newText = format.pixelToHex({
			r = newColor.r,
			g = newColor.g,
			b = newColor.b,
			a = alpha,
		})
	else
		newText = format.pixelToHex({
			r = newColor.r,
			g = newColor.g,
			b = newColor.b,
		})
	end
	input.text = newText
end

--- Used to update current preview color and the text shown in the value input.
--- Usually used when after a color was picked in the main or alpha pickers.
--- @param picker ColorPicker
--- @param parent tes3uiElement
--- @param newColor ffiImagePixel
--- @param alpha number
function this.colorSelected(picker, parent, newColor, alpha)
	-- Make sure we don't create reference to the pixel picked from the mainImage.
	-- We construct a new ffiPixel.
	newColor = ffiPixel({ newColor.r, newColor.g, newColor.b })
	picker:setColor(newColor, alpha)
	updatePreview(picker, parent, newColor, alpha)
	this.updateValueInput(parent, newColor, alpha)
end

--- Used when a color with different Hue was picked.
--- @param picker ColorPicker
--- @param parent tes3uiElement
--- @param newColor ffiImagePixel|ImagePixel
--- @param alpha number
function this.hueChanged(picker, parent, newColor, alpha)
	-- Make sure we don't create reference to the pixel picked from the mainImage.
	-- We construct a new ffiPixel.
	newColor = ffiPixel({ newColor.r, newColor.g, newColor.b })
	this.colorSelected(picker, parent, newColor, alpha)
	-- Now, also need to regenerate the image for the main picker since the Hue changed.
	picker:updateMainImage(newColor)

	local mainPicker = parent:findChild(UIID.mainPicker)
	mainPicker.texture.pixelData:setPixelsFloat(picker.mainImage:toPixelBufferFloat())
end


return this
