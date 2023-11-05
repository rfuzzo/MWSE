return {
	type = "method",
	description = [[Creates a NIF model from a file. Still under research.]],
	arguments = { {
		name = "params",
		type = "table",
		optional = true,
		tableParams = {
			{ name = "id", type = "string|number", description = "An identifier to help find this element later.", optional = true },
			{ name = "path", type = "string", description = "A model path. This path is relative to `Data Files`." },
		},
	} },
	valuetype = "tes3uiElement",
}
