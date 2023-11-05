return {
	type = "function",
	description = [[Creates a new basic or bump map.]],
	arguments = {{
		name = "params",
		optional = true,
		type = "table",
		tableParams = {
			{ name = "texture", type = "niTexture", optional = true, description = "If provided, sets the map texture to the given value." },
			{ name = "clampMode", type = "ni.texturingPropertyClampMode", optional = true, default = "ni.texturingPropertyClampMode.wrapSwrapT", description = "The clamp mode to set the map to use." },
			{ name = "filterMode", type = "ni.texturingPropertyFilterMode", optional = true, default = "ni.texturingPropertyFilterMode.trilerp", description = "The filter mode to set the map to use." },
			{ name = "textCoords", type = "integer", optional = true, default = "0", description = "The texture coordinates to set the map to use." },
			{ name = "isBumpMap", type = "boolean", optional = true, default = "false", description = "If true, a bump map will be created instead." },
		},
	}},
	returns = {
		{ name = "map", type = "niTexturingPropertyMap", description = "The created basic or bump map." },
	},
}