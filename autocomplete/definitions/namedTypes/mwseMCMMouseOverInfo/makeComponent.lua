return {
	type = "method",
	description = [[This method creates the info (a label) UI element of the mwseMCMMouseOverInfo and stores it in `self.elements.info` and `self.mouseOvers`. Also, registers event handlers on `triggerOn` and `triggerOff` events that call `self:updateInfo`.]],
	arguments = {
		{ name = "parentBlock", type = "tes3uiElement" }
	}
}
