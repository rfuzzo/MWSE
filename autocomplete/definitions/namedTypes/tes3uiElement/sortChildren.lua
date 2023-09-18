return {
	type = "method",
	description = [[Reorders the element's children given a sorting function.]],
	arguments = {
		{ name = "sortFunction", type = "fun(a: tes3uiElement, b: tes3uiElement): boolean", description = "The function to sort with. Like most sorting functions, this is given two arguments to compare." },
	},
}