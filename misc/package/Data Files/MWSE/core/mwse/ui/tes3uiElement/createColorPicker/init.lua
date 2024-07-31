local ffi = require("ffi")

local ColorPicker = require("mwse.ui.tes3uiElement.createColorPicker.ColorPicker")
local CONSTANTS = require("mwse.ui.tes3uiElement.createColorPicker.constants")
local format = require("mwse.ui.tes3uiElement.createColorPicker.formatHelpers")
local oklab = require("mwse.ui.tes3uiElement.createColorPicker.oklab")
local UIID = require("mwse.ui.tes3uiElement.createColorPicker.uiid")
local update = require("mwse.ui.tes3uiElement.createColorPicker.updateHelpers")

-- Defined in oklab\init.lua
local ffiPixel = ffi.typeof("RGB") --[[@as fun(init: ffiImagePixelInit?): ffiImagePixel]]
local i18n = mwse.loadTranslations("..")

--- @class ColorPickerPreviewsTable
--- @field standardPreview tes3uiElement
--- @field checkersPreview tes3uiElement

--- @param dimension integer
local function scalePreview(dimension)
	return math.floor(dimension * 0.85)
end


--- @param picker ColorPicker
--- @param parent tes3uiElement
--- @param color ffiImagePixel
--- @param alpha number
--- @param texture niSourceTexture
--- @return ColorPickerPreviewsTable
local function createPreviewElement(picker, parent, color, alpha, texture)
	local standardPreview = parent:createRect({
		id = UIID.preview.left,
		color = { color.r, color.g, color.b },
	})
	standardPreview.width = scalePreview(picker.previewWidth / 2)
	standardPreview.height = scalePreview(picker.previewHeight)
	standardPreview.borderLeft = 8

	local checkersPreview = parent:createRect({
		id = UIID.preview.right,
		color = { 1.0, 1.0, 1.0 },
	})
	checkersPreview.width = scalePreview(picker.previewWidth / 2)
	checkersPreview.height = scalePreview(picker.previewHeight)
	checkersPreview.texture = texture
	checkersPreview.imageFilter = false
	checkersPreview.borderRight = 8

	picker:updatePreviewImage(color, alpha)
	checkersPreview.texture.pixelData:setPixelsFloat(picker.previewImage:toPixelBufferFloat())

	return {
		standardPreview = standardPreview,
		checkersPreview = checkersPreview,
	}
end

--- @param outerContainer tes3uiElement
--- @param label string
local function createPreviewLabel(outerContainer, label)
	local labelContainer = outerContainer:createBlock({
		id = tes3ui.registerID("ColorPicker_color_preview_label_container")
	})
	labelContainer.flowDirection = tes3.flowDirection.topToBottom
	labelContainer.autoWidth = true
	labelContainer.autoHeight = true
	labelContainer.paddingAllSides = 8
	labelContainer:createLabel({
		id = tes3ui.registerID("ColorPicker_color_preview_" .. label ),
		text = i18n(label)
	})
end

--- @param picker ColorPicker
--- @param parent tes3uiElement
--- @param color ffiImagePixel
--- @param alpha number
--- @param label string
--- @param labelOnTop boolean
--- @param onClickCallback? fun(e: tes3uiEventData)
--- @return ColorPickerPreviewsTable
local function createPreview(picker, parent, color, alpha, label, labelOnTop, onClickCallback)
	-- We don't want to create references to color.
	local color = ffiPixel({ color.r, color.g, color.b })
	local outerContainer = parent:createBlock({ id = tes3ui.registerID("ColorPicker_color_preview_outer_container") })
	outerContainer.flowDirection = tes3.flowDirection.topToBottom
	outerContainer.autoWidth = true
	outerContainer.autoHeight = true

	if labelOnTop then
		createPreviewLabel(outerContainer, label)
	end

	local innerContainer = outerContainer:createBlock({
		id = tes3ui.registerID("ColorPicker_color_preview_inner_container")
	})
	innerContainer.flowDirection = tes3.flowDirection.leftToRight
	innerContainer.autoWidth = true
	innerContainer.autoHeight = true

	local previewTexture = picker.textures["preview" .. label]
	local previews = createPreviewElement(picker, innerContainer, color, alpha, previewTexture)

	if not labelOnTop then
		createPreviewLabel(outerContainer, label)
	end

	if onClickCallback then
		innerContainer:register(tes3.uiEvent.mouseDown, function(e)
			onClickCallback(e)
		end)
	end
	return previews
end


--- @param parent tes3uiElement
--- @param id string
--- @param absolutePosAlignX number
--- @param absolutePosAlignY number
local function createIndicator(parent, id, absolutePosAlignX, absolutePosAlignY)
	local indicator = parent:createImage({
		id = UIID.indicator[id],
		path = CONSTANTS.INDICATOR_TEXTURE,
	})
	indicator.color = CONSTANTS.INDICATOR_COLOR
	indicator.absolutePosAlignX = absolutePosAlignX
	indicator.absolutePosAlignY = absolutePosAlignY
	indicator:setLuaData("indicatorID", id)
	return indicator
end

local function isShiftDown()
	return tes3.worldController.inputController:isShiftDown()
end

--- @param params tes3uiElement.createColorPicker.params
--- @param picker ColorPicker
--- @param parent tes3uiElement
local function createPickerBlock(params, picker, parent)
	local initialColor = ffiPixel({ params.initialColor.r, params.initialColor.g, params.initialColor.b })

	local mainRow = parent:createBlock({ id = tes3ui.registerID("ColorPicker_picker_row_container") })
	mainRow.flowDirection = tes3.flowDirection.leftToRight
	mainRow.autoHeight = true
	mainRow.autoWidth = true
	mainRow.widthProportional = 1.0
	mainRow.paddingAllSides = 4

	local initialHSV = oklab.hsvlib_srgb_to_hsv(initialColor)
	local mainIndicatorInitialAbsolutePosAlignX = initialHSV.s
	local mainIndicatorInitialAbsolutePosAlignY = 1 - initialHSV.v
	local hueIndicatorInitialAbsolutePosAlignY = initialHSV.h / 360


	local pickerContainer = mainRow:createBlock({ id = tes3ui.registerID("ColorPicker_main_picker_container") })
	pickerContainer.autoHeight = true
	pickerContainer.autoWidth = true
	pickerContainer.flowDirection = tes3.flowDirection.topToBottom

	local mainPicker = pickerContainer:createRect({
		id = UIID.mainPicker,
		color = { 1, 1, 1 },
	})
	mainPicker.borderTop = 8
	mainPicker.borderLeft = 8
	mainPicker.borderRight = 8
	mainPicker.width = picker.mainWidth
	mainPicker.height = picker.height
	mainPicker.texture = picker.textures.main
	mainPicker.imageFilter = false
	mainPicker.texture.pixelData:setPixelsFloat(picker.mainImage:toPixelBufferFloat())
	mainPicker:register(tes3.uiEvent.mouseDown, function(e)
		tes3ui.captureMouseDrag(true)
	end)
	mainPicker:register(tes3.uiEvent.mouseRelease, function(e)
		tes3ui.captureMouseDrag(false)
	end)
	local mainIndicator = createIndicator(
		mainPicker,
		"main",
		mainIndicatorInitialAbsolutePosAlignX,
		mainIndicatorInitialAbsolutePosAlignY
	)
	local slider = pickerContainer:createSlider({
		id = UIID.indicator.slider,
		step = 1,
		jump = 1,
		current = mainIndicatorInitialAbsolutePosAlignX * CONSTANTS.SLIDER_SCALE,
		max = CONSTANTS.SLIDER_SCALE,
	})
	slider.width = picker.mainWidth
	slider.borderBottom = 8
	slider.borderLeft = 8
	slider.borderRight = 8
	slider:setLuaData("indicatorID", "slider")

	local huePicker = mainRow:createRect({
		id = tes3ui.registerID("ColorPicker_hue_picker"),
		color = { 1, 1, 1 },
	})
	huePicker.borderAllSides = 8
	huePicker.width = picker.hueWidth
	huePicker.height = picker.height
	huePicker.texture = picker.textures.hue
	huePicker.imageFilter = false
	huePicker.texture.pixelData:setPixelsFloat(picker.hueBar:toPixelBufferFloat())
	huePicker:register(tes3.uiEvent.mouseDown, function(e)
		tes3ui.captureMouseDrag(true)
	end)
	huePicker:register(tes3.uiEvent.mouseRelease, function(e)
		tes3ui.captureMouseDrag(false)
	end)
	local hueIndicator = createIndicator(
		huePicker,
		"hue",
		0.5,
		hueIndicatorInitialAbsolutePosAlignY
	)

	local alphaPicker
	local alphaIndicator
	if params.alpha then
		alphaPicker = mainRow:createRect({
			id = tes3ui.registerID("ColorPicker_alpha_picker"),
			color = { 1, 1, 1 },
		})
		alphaPicker.borderAllSides = 8
		alphaPicker.width = picker.hueWidth
		alphaPicker.height = picker.height
		alphaPicker.texture = picker.textures.alpha
		alphaPicker.imageFilter = false
		alphaPicker.texture.pixelData:setPixelsFloat(picker.alphaBar:toPixelBufferFloat())
		alphaPicker:register(tes3.uiEvent.mouseDown, function(e)
			tes3ui.captureMouseDrag(true)
		end)
		alphaPicker:register(tes3.uiEvent.mouseRelease, function(e)
			tes3ui.captureMouseDrag(false)
		end)

		alphaIndicator = createIndicator(
			alphaPicker,
			"alpha",
			0.5,
			1 - params.initialAlpha
		)
	end

	local previewContainer = mainRow:createBlock({ id = UIID.preview.topContainer })
	previewContainer.flowDirection = tes3.flowDirection.topToBottom
	previewContainer.autoWidth = true
	previewContainer.autoHeight = true

	local currentPreview = createPreview(picker, previewContainer, initialColor, params.initialAlpha, "Current", true)

	-- Implement picking behavior
	mainPicker:register(tes3.uiEvent.mouseStillPressed, function(e)
		local x = math.clamp(e.relativeX, 1, mainPicker.width)
		local y = math.clamp(e.relativeY, 1, mainPicker.height)
		if isShiftDown() then
			y = mainIndicator.absolutePosAlignY * mainPicker.height
		end

		local pickedColor = picker.mainImage:getPixel(x, y)
		update.colorSelected(picker, parent, pickedColor, picker.currentAlpha)

		x = x / mainPicker.width
		y = y / mainPicker.height
		mainIndicator.absolutePosAlignX = x
		mainIndicator.absolutePosAlignY = y
		slider.widget.current = x * CONSTANTS.SLIDER_SCALE
		mainRow:getTopLevelMenu():updateLayout()
		parent.parent:triggerEvent("colorChanged")
	end)
	slider:register(tes3.uiEvent.partScrollBarChanged, function(e)
		local x = math.clamp((slider.widget.current / CONSTANTS.SLIDER_SCALE) * mainPicker.width, 1, mainPicker.width)
		local y = mainIndicator.absolutePosAlignY * mainPicker.height
		local pickedColor = picker.mainImage:getPixel(x, y)
		update.colorSelected(picker, parent, pickedColor, picker.currentAlpha)

		x = x / mainPicker.width
		y = y / mainPicker.height
		mainIndicator.absolutePosAlignX = x
		mainIndicator.absolutePosAlignY = y
		mainRow:getTopLevelMenu():updateLayout()
		parent.parent:triggerEvent("colorChanged")
	end)

	huePicker:register(tes3.uiEvent.mouseStillPressed, function(e)
		local x = math.clamp(e.relativeX, 1, huePicker.width)
		local y = math.clamp(e.relativeY, 1, huePicker.height)

		local current = picker:getColor()
		local currentHSV = oklab.hsvlib_srgb_to_hsv(ffiPixel({ current.r, current.g, current.b }))

		local pickedColor = picker.hueBar:getPixel(x, y)
		local pickedHSV = oklab.hsvlib_srgb_to_hsv(pickedColor)
		-- Make sure we only change Hue when sliding over the hue picker.
		currentHSV.h = pickedHSV.h
		pickedColor = oklab.hsvlib_hsv_to_srgb(currentHSV)

		update.hueChanged(picker, parent, pickedColor, picker.currentAlpha)

		hueIndicator.absolutePosAlignY = y / huePicker.height
		mainRow:getTopLevelMenu():updateLayout()
		parent.parent:triggerEvent("colorChanged")
	end)

	if params.alpha then
		alphaPicker:register(tes3.uiEvent.mouseStillPressed, function(e)
			local y = math.clamp(e.relativeY / alphaPicker.height, 0, 1)
			update.colorSelected(picker, parent, picker.currentColor, 1 - y)
			alphaIndicator.absolutePosAlignY = y
			mainRow:getTopLevelMenu():updateLayout()
			parent.parent:triggerEvent("colorChanged")
		end)
	end

	if params.showOriginal then
		--- @param e tes3uiEventData
		local function resetColor(e)
			update.hueChanged(picker, parent, params.initialColor, params.initialAlpha)

			mainIndicator.absolutePosAlignX = mainIndicatorInitialAbsolutePosAlignX
			mainIndicator.absolutePosAlignY = mainIndicatorInitialAbsolutePosAlignY
			slider.widget.current = mainIndicatorInitialAbsolutePosAlignX * CONSTANTS.SLIDER_SCALE
			hueIndicator.absolutePosAlignY = hueIndicatorInitialAbsolutePosAlignY
			if params.alpha then
				alphaIndicator.absolutePosAlignY = 1 - params.initialAlpha
			end
			mainRow:getTopLevelMenu():updateLayout()
			parent.parent:triggerEvent("colorChanged")
		end
		createPreview(picker, previewContainer, initialColor, params.initialAlpha, "Original", false, resetColor)
	end

	return {
		mainPicker = mainPicker,
		huePicker = huePicker,
		alphaPicker = alphaPicker,
		currentPreview = currentPreview,
	}
end

--- Returns the channel value by reading `text` property of given TextInput. Returned value is in range of [0, 1].
--- @param input tes3uiElement
local function getInputValue(input)
	local text = input.text
	local hasAlpha = input:getLuaData("hasAlpha")

	-- Clearing the text input will set the color to 0.
	if text == "" then
		text = hasAlpha and "00000000" or "000000"
	end

	-- Clamp the text length to the correct value.
	local expectedLength = hasAlpha and 8 or 6
	local actualLength = string.len(text)
	local delta = actualLength - expectedLength

	if delta > 0 then
		text = string.sub(text, 1, expectedLength)
	elseif delta < 0 then
		-- If user cleared some characters, fill with 0.
		text = text .. string.rep('0', math.abs(delta))
	end

	return text
end

--- @param params tes3uiElement.createColorPicker.params
--- @param picker ColorPicker
--- @param parent tes3uiElement
local function createDataBlock(params, picker, parent)
	local dataRow = parent:createThinBorder({ id = UIID.dataRowContainer })
	dataRow.flowDirection = tes3.flowDirection.leftToRight
	dataRow.autoHeight = true
	dataRow.autoWidth = true
	dataRow.widthProportional = 1.0
	dataRow.borderLeft = 12
	dataRow.paddingAllSides = 4
	dataRow.childAlignY = 0.5

	local text = i18n("RGB: #")
	local inputText = format.pixelToHex(params.initialColor)
	if params.alpha then
		text = i18n("ARGB: #")
		local initialColor = table.copy(params.initialColor) --[[@as ImagePixelA]]
		initialColor.a = params.initialAlpha
		inputText = format.pixelToHex(initialColor)
	end
	local label = dataRow:createLabel({
		id = tes3ui.registerID("ColorPicker_data_row_label"),
		text = text
	})
	label.borderLeft = 4

	local input = dataRow:createTextInput({
		id = UIID.textInput,
		text = inputText,
	})
	input:setLuaData("hasAlpha", params.alpha or false)
	input.autoWidth = true
	input.widthProportional = 1.0

	-- Update color after new value was entered.
	input:registerAfter(tes3.uiEvent.keyEnter, function(e)
		local newColor, alpha = format.hexToPixel(getInputValue(input))
		update.hueChanged(picker, parent, newColor, alpha)
		update.updateIndicatorPositions(parent, newColor, alpha)
		parent.parent:triggerEvent("colorChanged")
	end)

	local copyButton = dataRow:createButton({
		id = tes3ui.registerID("ColorPicker_data_row_copy_button"),
		text = i18n("Copy"),
	})
	copyButton:register(tes3.uiEvent.mouseClick, function(e)
		local text = getInputValue(input)
		os.setClipboardText(text)
		tes3.messageBox(i18n("%q copied to clipboard."), text)
	end)

	return {
		input = input,
	}
end

--- @param params tes3uiElement.createColorPicker.params
--- @param parent tes3uiElement
local function createColorPickerWidget(params, parent)
	if (not params.alpha) or (not params.initialAlpha) then
		params.initialAlpha = 1
	end
	params = table.deepcopy(params)

	local picker = ColorPicker:new({
		mainWidth = CONSTANTS.PICKER_MAIN_WIDTH,
		height = CONSTANTS.PICKER_HEIGHT,
		hueWidth = CONSTANTS.PICKER_VERTICAL_COLUMN_WIDTH,
		previewWidth = CONSTANTS.PICKER_PREVIEW_WIDTH,
		previewHeight = CONSTANTS.PICKER_PREVIEW_HEIGHT,
		initialColor = params.initialColor,
		initialAlpha = params.initialAlpha,
	})

	picker:setColor(
		ffiPixel({ params.initialColor.r, params.initialColor.g, params.initialColor.b }),
		params.initialAlpha
	)

	local container = parent:createBlock({ id = params.id })
	container.autoWidth = true
	container.autoHeight = true
	container.flowDirection = tes3.flowDirection.topToBottom
	createPickerBlock(params, picker, container)

	if params.showDataRow then
		createDataBlock(params, picker, container)
	end

	return picker
end



--- @class tes3uiElement.createColorPicker.params
--- @field id? string
--- @field initialColor ImagePixel
--- @field initialAlpha? number
--- @field alpha? boolean If true the picker will also allow picking an alpha value.
--- @field showOriginal? boolean If true the picker will show original color below the currently picked color.
--- @field showDataRow? boolean If true the picker will show RGB(A) values of currently picked color in a label below the picker.

---@param params tes3uiElement.createColorPicker.params
function tes3uiElement:createColorPicker(params)
	local picker = createColorPickerWidget(params, self)

	self:makeLuaWidget("colorPicker", {
		picker = picker,
	})

	return self
end

tes3ui.defineLuaWidget({
	name = "colorPicker",
	metatable = ColorPicker,
})
