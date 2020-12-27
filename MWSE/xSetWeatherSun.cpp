/************************************************************************

	xSetWeatherSun.cpp - Copyright (c) 2008 The MWSE Project
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

#include "TES3Weather.h"
#include "TES3WeatherController.h"
#include "TES3WorldController.h"

using namespace mwse;

namespace mwse
{
	class xSetWeatherSun : mwse::InstructionInterface_t
	{
	public:
		xSetWeatherSun();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static xSetWeatherSun xSetWeatherSunInstance;

	xSetWeatherSun::xSetWeatherSun() : mwse::InstructionInterface_t(OpCode::xSetWeatherSun) {}

	void xSetWeatherSun::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}


	float xSetWeatherSun::execute(mwse::VMExecuteInterface& virtualMachine)
	{
		// Get parameter from the stack.
		auto weatherIndex = mwse::Stack::getInstance().popLong();
		auto timeEnum = mwse::Stack::getInstance().popLong();
		NI::Color color;
		color.r = mwse::Stack::getInstance().popLong() / 255.0f;
		color.g = mwse::Stack::getInstance().popLong() / 255.0f;
		color.b = mwse::Stack::getInstance().popLong() / 255.0f;

		if (weatherIndex < TES3::WeatherType::First || weatherIndex > TES3::WeatherType::Last) {
			return 0.0f;
		}

		auto weather = TES3::WorldController::get()->weatherController->arrayWeathers[weatherIndex];
		switch (timeEnum) {
		case 0:
			weather->sunSunriseCol = color;
			break;
		case 1:
			weather->sunDayCol = color;
			break;
		case 2:
			weather->sunSunsetCol = color;
			break;
		case 3:
			weather->sunNightCol = color;
			break;
		}

		return 0.0f;
	}
}