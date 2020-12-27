/************************************************************************

	xModelSwitch.cpp - Copyright (c) 2008 The MWSE Project
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
#include "TES3Util.h"

#include "TES3Reference.h"

#include "NIRTTI.h"
#include "NISwitchNode.h"

namespace mwse
{
	class xModelSwitch : InstructionInterface_t
	{
	public:
		xModelSwitch();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static xModelSwitch xModelSwitchInstance;

	xModelSwitch::xModelSwitch() : InstructionInterface_t(OpCode::xModelSwitch) {}

	void xModelSwitch::loadParameters(VMExecuteInterface& virtualMachine) {}

	float xModelSwitch::execute(VMExecuteInterface& virtualMachine)
	{
		auto reference = virtualMachine.getReference();
		if (reference == nullptr) {
			return 0.0f;
		}

		// Get node name.
		mwseString& nodeName = virtualMachine.getString(Stack::getInstance().popLong());
		if (nodeName.empty()) {
			return 0.0f;
		}

		auto index = Stack::getInstance().popLong();

		if (reference->sceneNode) {
			auto child = reference->sceneNode->getObjectByNameAndType<NI::SwitchNode>(nodeName.c_str());
			if (child && child->isOfType(NI::RTTIStaticPtr::NiSwitchNode)) {
				child->setSwitchIndex(index);
			}
		}

		return 0.0f;
	}
}