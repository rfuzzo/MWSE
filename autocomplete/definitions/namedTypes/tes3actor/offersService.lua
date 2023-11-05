return {
	type = "method",
	description = [[Checks if the actor will offer a service in dialogue. This an offer and may still be refused by dialogue checks. To also get the result of dialogue checks, use [`tes3.checkMerchantOffersService()`](https://mwse.github.io/MWSE/apis/tes3/#tes3checkmerchantoffersservice).]],
	arguments = {
		{ name = "service", type = "tes3.merchantService", description = "Use one of the values in the [`tes3.merchantService.*`](https://mwse.github.io/MWSE/references/merchant-services/) table." },
	},
	valuetype = "boolean",
}