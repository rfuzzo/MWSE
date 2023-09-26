#pragma once

#include "LuaGenericEvent.h"
#include "LuaDisableableEvent.h"

#include "TES3Defines.h"

namespace mwse::lua::event {
	class MagicSelectionChangedEvent : public GenericEvent, public DisableableEvent<MagicSelectionChangedEvent> {
	public:
		MagicSelectionChangedEvent(TES3::Spell* spell);
		MagicSelectionChangedEvent(TES3::Enchantment* enchantment, TES3::Object* item);
		sol::table createEventTable();

	protected:
		bool isSpell;
		TES3::Spell* m_Spell;
		TES3::Enchantment* m_Enchantment;
		TES3::Object* m_Item;
	};
}
