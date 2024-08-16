local UIID = {
	indicator = {
		main = tes3ui.registerID("ColorPicker_main_picker_indicator"),
		hue = tes3ui.registerID("ColorPicker_hue_picker_indicator"),
		alpha = tes3ui.registerID("ColorPicker_alpha_picker_indicator"),
		slider = tes3ui.registerID("ColorPicker_main_picker_slider"),
	},
	mainPicker = tes3ui.registerID("ColorPicker_main_picker"),
	preview = {
		original = tes3ui.registerID("ColorPicker_preview_original"),
		current = tes3ui.registerID("ColorPicker_preview_current"),
		topContainer = tes3ui.registerID("ColorPicker_color_preview_container"),
	},
	dataRowContainer = tes3ui.registerID("ColorPicker_data_row_container"),
	textInput = tes3ui.registerID("ColorPicker_data_row_value_input"),
}

return UIID
