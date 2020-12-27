/************************************************************************

	MGEUIHide.cpp - Copyright (c) 2008 The MWSE Project
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

#include "TES3UIElement.h"
#include "TES3UIManager.h"

using namespace mwse;

namespace mwse
{
	class MGEUIHide : mwse::InstructionInterface_t
	{
	public:
		MGEUIHide();
		virtual float execute(VMExecuteInterface& virtualMachine);
		virtual void loadParameters(VMExecuteInterface& virtualMachine);
	};

	static MGEUIHide MGEUIHideInstance;

	MGEUIHide::MGEUIHide() : mwse::InstructionInterface_t(OpCode::MGEUIHide) {}

	void MGEUIHide::loadParameters(mwse::VMExecuteInterface& virtualMachine) {}

	const auto TES3_UI_Address_MenuMulti = reinterpret_cast<TES3::UI::UI_ID*>(0x7d4ab0);
	const auto TES3_UI_Address_MenuMulti_bottom_row = reinterpret_cast<TES3::UI::UI_ID*>(0x7d4a38);
	const auto TES3_UI_Address_MenuMulti_fillbars_layout = reinterpret_cast<TES3::UI::UI_ID*>(0x7d4b3e);
	const auto TES3_UI_Address_MenuMulti_npc_health_bar = reinterpret_cast<TES3::UI::UI_ID*>(0x7d4b20);
	const auto TES3_UI_Address_MenuMulti_weapon_layout = reinterpret_cast<TES3::UI::UI_ID*>(0x7d49fc);
	const auto TES3_UI_Address_MenuMulti_magic_layout = reinterpret_cast<TES3::UI::UI_ID*>(0x7d4a74);
	const auto TES3_UI_Address_MenuMulti_magic_icons_layout = reinterpret_cast<TES3::UI::UI_ID*>(0x7d4a28);
	const auto TES3_UI_Address_MenuMap_panel = reinterpret_cast<TES3::UI::UI_ID*>(0x7d45ae);

	float MGEUIHide::execute(mwse::VMExecuteInterface& virtualMachine)
	{
		// Get parameter from the stack.
		auto index = mwse::Stack::getInstance().popLong();
		if (index < 0 || index > 6) {
			return 0.0f;
		}

		auto menuMulti = TES3::UI::findMenu(*TES3_UI_Address_MenuMulti);
		if (menuMulti) {
			const TES3::UI::UI_ID* sel[] = {
				TES3_UI_Address_MenuMulti_bottom_row,
				TES3_UI_Address_MenuMulti_fillbars_layout,
				TES3_UI_Address_MenuMulti_npc_health_bar,
				TES3_UI_Address_MenuMulti_weapon_layout,
				TES3_UI_Address_MenuMulti_magic_layout,
				TES3_UI_Address_MenuMulti_magic_icons_layout,
				TES3_UI_Address_MenuMap_panel
			};
			auto element = menuMulti->findChild(*sel[index]);
			if (element) {
				element->setVisible(false);
			}
		}

		return 0.0f;
	}
}