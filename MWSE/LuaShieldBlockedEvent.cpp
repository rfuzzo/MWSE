#include "LuaShieldBlockedEvent.h"

#include "LuaManager.h"
#include "LuaUtil.h"

#include "TES3MobileActor.h"
#include "TES3Reference.h"

namespace mwse::lua::event {
	ShieldBlockedEvent::ShieldBlockedEvent(TES3::MobileActor* mobileActor, float damage) :
		ObjectFilteredEvent("shieldBlocked", mobileActor->reference),
		m_MobileActor(mobileActor),
		m_ConditionDamage(damage)
	{

	}

	sol::table ShieldBlockedEvent::createEventTable() {
		auto stateHandle = LuaManager::getInstance().getThreadSafeStateHandle();
		auto& state = stateHandle.state;
		auto eventData = state.create_table();

		eventData["conditionDamage"] = m_ConditionDamage;
		eventData["mobile"] = m_MobileActor;
		eventData["reference"] = m_MobileActor->reference;

		return eventData;
	}

	bool ShieldBlockedEvent::m_EventEnabled = false;
}
