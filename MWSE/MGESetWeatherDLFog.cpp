/************************************************************************

	MGESetWeatherDLFog.cpp - Copyright (c) 2008 The MWSE Project
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

#include "TES3WeatherController.h"

#include "MGEConfiguration.h"

using namespace mwse;
using namespace mge;

namespace mwse
{
	class MGESetWeatherDLFog : mwse::InstructionInterface_t
	{
	public:
		MGESetWeatherDLFog();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static MGESetWeatherDLFog MGESetWeatherDLFogInstance;

	MGESetWeatherDLFog::MGESetWeatherDLFog() : mwse::InstructionInterface_t(OpCode::MGESetWeatherDLFog) {}

	void MGESetWeatherDLFog::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}


	float MGESetWeatherDLFog::execute(mwse::VMExecuteInterface& virtualMachine)
	{
		// Get parameter from the stack.
		auto weatherIndex = mwse::Stack::getInstance().popLong();
		auto distance = mwse::Stack::getInstance().popFloat();
		auto offset = mwse::Stack::getInstance().popFloat();
		if (weatherIndex < TES3::WeatherType::First || weatherIndex > TES3::WeatherType::Last) {
			Stack::getInstance().pushFloat(0.0f);
			Stack::getInstance().pushFloat(0.0f);
			return 0.0f;
		}

		Configuration.DL.FogD[weatherIndex] = distance;
		Configuration.DL.FgOD[weatherIndex] = offset;

		return 0.0f;
	}
}