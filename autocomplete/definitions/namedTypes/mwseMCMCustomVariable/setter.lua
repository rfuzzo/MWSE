return {
	type = "method",
	description = [[This method is called when a new value is saved to the Variable. If the Variable has a `converter` defined, the `converter` is called first. Then, the returned value is passed to this method.]],
	arguments = {
		{ name = "newValue", type = "unknown" }
	},
}
