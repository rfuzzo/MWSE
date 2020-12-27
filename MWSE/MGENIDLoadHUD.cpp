/************************************************************************

	MGENIDLoadHUD.cpp - Copyright (c) 2008 The MWSE Project
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
	class MGENIDLoadHUD : mwse::InstructionInterface_t
	{
	public:
		MGENIDLoadHUD();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static MGENIDLoadHUD MGENIDLoadHUDInstance;

	MGENIDLoadHUD::MGENIDLoadHUD() : mwse::InstructionInterface_t(OpCode::MGENIDLoadHUD) {}

	void MGENIDLoadHUD::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}


	float MGENIDLoadHUD::execute(mwse::VMExecuteInterface& virtualMachine)
	{
		mwseString& texture = virtualMachine.getString(Stack::getInstance().popLong());
		if (MGEhud::currentHUDId.empty() || texture.empty()) {
			return 0.0f;
		}

		MGEhud::load(MGEhud::currentHUDId.c_str(), texture.c_str());

		return 0.0f;
	}
}