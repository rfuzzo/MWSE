/************************************************************************

	MGENIDSetHUDEffectVec.cpp - Copyright (c) 2008 The MWSE Project
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

#include "userhud.h"

using namespace mwse;

namespace mwse
{
	class MGENIDSetHUDEffectVec : mwse::InstructionInterface_t
	{
	public:
		MGENIDSetHUDEffectVec();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static MGENIDSetHUDEffectVec MGENIDSetHUDEffectVecInstance;

	MGENIDSetHUDEffectVec::MGENIDSetHUDEffectVec() : mwse::InstructionInterface_t(OpCode::MGENIDSetHUDEffectVec) {}

	void MGENIDSetHUDEffectVec::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}


	float MGENIDSetHUDEffectVec::execute(mwse::VMExecuteInterface& virtualMachine)
	{
		mwseString& name = virtualMachine.getString(Stack::getInstance().popLong());
		float values[4];
		for (size_t i = 0; i < 4; i++) {
			values[i] = Stack::getInstance().popFloat();
		}

		if (MGEhud::currentHUD != MGEhud::invalid_hud_id) {
			MGEhud::setEffectVec4(MGEhud::currentHUD, name.c_str(), values);
		}

		return 0.0f;
	}
}