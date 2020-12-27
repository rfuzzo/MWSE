/************************************************************************

	xSetGS.cpp - Copyright (c) 2008 The MWSE Project
	https://github.com/MWSE/MWSE/

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

**************************************************************************/

#include "VMExecuteInterface.h"
#include "Stack.h"
#include "InstructionInterface.h"
#include "MemoryUtil.h"

#include "TES3DataHandler.h"
#include "TES3GameSetting.h"

using namespace mwse;

namespace mwse
{
	class xSetGS : mwse::InstructionInterface_t
	{
	public:
		xSetGS();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static xSetGS xSetGSInstance;

	xSetGS::xSetGS() : mwse::InstructionInterface_t(OpCode::xSetGSfloat) {}

	void xSetGS::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}

	float xSetGS::execute(mwse::VMExecuteInterface& virtualMachine)
	{
		auto gmstId = Stack::getInstance().popLong();
		mwseString& newString = virtualMachine.getString(Stack::getInstance().popLong());

		if (gmstId < TES3::GMST::sMonthMorningstar || gmstId > TES3::GMST::sWitchhunter) {
			mwse::log::getLog() << "xSetGS: Invalid GMST id." << std::endl;
			mwse::Stack::getInstance().pushLong(false);
			return 0.0f;
		}

		// Set the GMST value.
		TES3::DataHandler::get()->nonDynamicData->GMSTs[gmstId]->value.asLong = Stack::getInstance().popLong();

		return 0.0f;
	}
}