/************************************************************************

	xModelBounds.cpp - Copyright (c) 2008 The MWSE Project
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

#include "TES3Reference.h"

using namespace mwse;

namespace mwse {
	class xModelBounds : mwse::InstructionInterface_t {
	public:
		xModelBounds();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static xModelBounds xModelBoundsInstance;

	xModelBounds::xModelBounds() : mwse::InstructionInterface_t(OpCode::xModelBounds) {}

	void xModelBounds::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}

	float xModelBounds::execute(mwse::VMExecuteInterface& virtualMachine) {
		auto& stack = Stack::getInstance();

		auto reference = virtualMachine.getReference();
		auto boundingBox = reference ? reference->baseObject->boundingBox : nullptr;
		if (boundingBox) {
			stack.pushFloat(boundingBox->maximum.z);
			stack.pushFloat(boundingBox->maximum.y);
			stack.pushFloat(boundingBox->maximum.x);
			stack.pushFloat(boundingBox->minimum.z);
			stack.pushFloat(boundingBox->minimum.y);
			stack.pushFloat(boundingBox->minimum.x);
		}
		else {
			for (size_t i = 0; i < 6; i++) {
				stack.pushFloat(0.0f);
			}
		}

		return 0.0f;
	}
}