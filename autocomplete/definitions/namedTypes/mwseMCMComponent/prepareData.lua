return {
	type = "method",
	description = [[Prepares the provided parameters table and sets the `parentComponent` field to `mwseMCMComponent`.]],
	arguments = {
		{ name = "data", type = "string|mwseMCMComponent.new.data", optional = true }
	},
	returns = {{
		name = "data", type = "mwseMCMComponent.new.data"
	}}
}
