#pragma once

#include "LuaObjectFilteredEvent.h"
#include "LuaDisableableEvent.h"

namespace mwse::lua::event {
	class ShieldBlockedEvent : public ObjectFilteredEvent, public DisableableEvent<ShieldBlockedEvent> {
	public:
		ShieldBlockedEvent(TES3::MobileActor* mobileActor, float damage);
		sol::table createEventTable();

	protected:
		TES3::MobileActor* m_MobileActor;
		float m_ConditionDamage;
	};
}
