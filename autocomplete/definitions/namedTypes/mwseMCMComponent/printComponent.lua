return {
	type = "method",
	description = [[Prints the component table to the `mwse.log`. If a component is passed, it will be printed. If called without arguments, the component it was called on will be printed.]],
	arguments = {
		{ name = "component", type = "table", optional = true, default = "self" }
	}
}
