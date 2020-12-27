/************************************************************************

	xRayTestFrom.cpp - Copyright (c) 2008 The MWSE Project
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

#include "MGEUtil.h"

using namespace mwse;

namespace mwse {
	class xRayTestFrom : mwse::InstructionInterface_t {
	public:
		xRayTestFrom();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static xRayTestFrom xRayTestFromInstance;

	xRayTestFrom::xRayTestFrom() : mwse::InstructionInterface_t(OpCode::xRayTestFrom) {}

	void xRayTestFrom::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}

	float xRayTestFrom::execute(mwse::VMExecuteInterface& virtualMachine) {
		auto& stack = Stack::getInstance();
		TES3::Vector3 position(stack.popFloat(), stack.popFloat(), stack.popFloat());
		TES3::Vector3 direction(stack.popFloat(), stack.popFloat(), stack.popFloat());

		bool hit = false;
		float distance = FLT_MAX;

		mge::performRayTest(virtualMachine, position, direction, hit, distance);

		stack.pushFloat(distance);
		stack.pushLong(hit);

		return 0.0f;
	}
}