/************************************************************************

	xGetWeatherScattering.cpp - Copyright (c) 2008 The MWSE Project
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

#include "MGEDistantLand.h"

using namespace mwse;
using namespace mge;

namespace mwse
{
	class xGetWeatherScattering : mwse::InstructionInterface_t
	{
	public:
		xGetWeatherScattering();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static xGetWeatherScattering xGetWeatherScatteringInstance;

	xGetWeatherScattering::xGetWeatherScattering() : mwse::InstructionInterface_t(OpCode::xGetWeatherScattering) {}

	void xGetWeatherScattering::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}


	float xGetWeatherScattering::execute(mwse::VMExecuteInterface& virtualMachine)
	{
		auto& stack = Stack::getInstance();

		stack.pushFloat(DistantLand::atmOutscatter.r);
		stack.pushFloat(DistantLand::atmOutscatter.g);
		stack.pushFloat(DistantLand::atmOutscatter.b);
		stack.pushFloat(DistantLand::atmInscatter.r);
		stack.pushFloat(DistantLand::atmInscatter.g);
		stack.pushFloat(DistantLand::atmInscatter.b);

		return 0.0f;
	}
}