return {
	type = "method",
	description = [[Creates component's label UI element.

First, it calls `self:createLabelBlock` and creates the label element inside new `labelBlock`. Stores both new UI elements in the `self.elements` and `self.mouseOvers`.]],
	arguments = {
		{ name = "parentBlock",	type = "tes3uiElement" }
	}
}
