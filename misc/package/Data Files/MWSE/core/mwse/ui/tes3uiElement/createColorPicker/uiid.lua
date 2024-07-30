local UIID = {
	indicator = {
		main = tes3ui.registerID("ColorPicker_main_picker_indicator"),
		hue = tes3ui.registerID("ColorPicker_hue_picker_indicator"),
		alpha = tes3ui.registerID("ColorPicker_alpha_picker_indicator"),
		slider = tes3ui.registerID("ColorPicker_main_picker_slider"),
	},
	mainPicker = tes3ui.registerID("ColorPicker_main_picker"),
	preview = {
		topContainer = tes3ui.registerID("ColorPicker_color_preview_container"),
		left = tes3ui.registerID("ColorPicker_color_preview_left"),
		right = tes3ui.registerID("ColorPicker_color_preview_right"),
	},
	textInput = tes3ui.registerID("ColorPicker_data_row_value_input"),
}

return UIID
