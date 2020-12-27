/************************************************************************

	xTransformVec.cpp - Copyright (c) 2008 The MWSE Project
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
	class xTransformVec : mwse::InstructionInterface_t {
	public:
		xTransformVec();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static xTransformVec xTransformVecInstance;

	xTransformVec::xTransformVec() : mwse::InstructionInterface_t(OpCode::xTransformVec) {}

	void xTransformVec::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}

	float xTransformVec::execute(mwse::VMExecuteInterface& virtualMachine) {
		auto& stack = Stack::getInstance();

		auto reference = virtualMachine.getReference();
		D3DXVECTOR3 v, t;

		v.x = stack.popFloat();
		v.y = stack.popFloat();
		v.z = stack.popFloat();

		auto node = reference->sceneNode;
		auto m = reinterpret_cast<float*>(node->localRotation);
		D3DXVec3Scale(&v, &v, node->localScale);
		t.x = m[0] * v.x + m[1] * v.y + m[2] * v.z + node->localTranslate.x;
		t.y = m[3] * v.x + m[4] * v.y + m[5] * v.z + node->localTranslate.y;
		t.z = m[6] * v.x + m[7] * v.y + m[8] * v.z + node->localTranslate.z;

		stack.pushFloat(t.z);
		stack.pushFloat(t.y);
		stack.pushFloat(t.x);

		return 0.0f;
	}
}