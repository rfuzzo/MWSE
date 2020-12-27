/************************************************************************

	MGEOutputDebugString.cpp - Copyright (c) 2008 The MWSE Project
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

#include "mge_log.h"

using namespace mwse;

namespace mwse
{
	class MGEOutputDebugString : mwse::InstructionInterface_t
	{
	public:
		MGEOutputDebugString();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static MGEOutputDebugString MGEOutputDebugStringInstance;

	MGEOutputDebugString::MGEOutputDebugString() : mwse::InstructionInterface_t(OpCode::MGEOutputDebugString) {}

	void MGEOutputDebugString::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}


	float MGEOutputDebugString::execute(mwse::VMExecuteInterface& virtualMachine)
	{
		mwseString& line = virtualMachine.getString(Stack::getInstance().popLong());
		LOG::logline("%s", line.c_str());

		return 0.0f;
	}
}