
#include "VMExecuteInterface.h"
#include "Stack.h"
#include "InstructionInterface.h"

#include "TES3DataHandler.h"
#include "TES3GameSetting.h"

using namespace mwse;

namespace mwse
{
	class xGetGS : mwse::InstructionInterface_t
	{
	public:
		xGetGS();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static xGetGS xGetGSInstance;

	xGetGS::xGetGS() : mwse::InstructionInterface_t(OpCode::xGetGS) {}

	void xGetGS::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}

	float xGetGS::execute(mwse::VMExecuteInterface& virtualMachine)
	{
		auto& stack = mwse::Stack::getInstance();

		auto gameSetting = stack.popLong();
		if (gameSetting < TES3::GMST::sMonthMorningstar || gameSetting > TES3::GMST::sWitchhunter) {
			stack.pushLong(0);
			return 0.0f;
		}

		auto gmst = TES3::DataHandler::get()->nonDynamicData->GMSTs[gameSetting];
		stack.pushLong(gmst->value.asLong);

		return 0.0f;
	}
}
