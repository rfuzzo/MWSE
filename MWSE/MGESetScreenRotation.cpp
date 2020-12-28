/************************************************************************

	MGESetScreenRotation.cpp - Copyright (c) 2008 The MWSE Project
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

#include "MGEConfiguration.h"

using namespace mwse;

namespace mwse {
	class MGESetScreenRotation : mwse::InstructionInterface_t {
	public:
		MGESetScreenRotation();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static MGESetScreenRotation MGESetScreenRotationInstance;

	MGESetScreenRotation::MGESetScreenRotation() : mwse::InstructionInterface_t(OpCode::MGESetScreenRotation) {}

	void MGESetScreenRotation::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}

	float MGESetScreenRotation::execute(mwse::VMExecuteInterface& virtualMachine) {
		Configuration.CameraEffects.rotateUpdate = true;
		Configuration.CameraEffects.rotation = Stack::getInstance().popFloat();
		return 0.0f;
	}
}