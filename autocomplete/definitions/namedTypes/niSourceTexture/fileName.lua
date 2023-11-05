return {
	type = "value",
	description = [[The platform-independent version of the filename from which the image was created, or nil if the image was created from pixel data.]],
	valuetype = "string",
	readOnly = true,
	examples = {
		["..\\..\\niCamera\\windowPointToRay\\sampleLandscapeTexture"] = {
			title = "Sampling landscape texture under the crosshair/mouse cursor",
		}
	}
}