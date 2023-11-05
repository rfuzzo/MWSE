#include "LuaMouseButtonDownEvent.h"

#include "LuaManager.h"

namespace mwse::lua::event {
	MouseButtonDownEvent::MouseButtonDownEvent(int button, bool controlDown, bool shiftDown, bool altDown, bool superDown) :
		KeyEvent(button, true, controlDown, shiftDown, altDown, superDown)
	{
		m_EventName = "mouseButtonDown";
	}

	sol::table MouseButtonDownEvent::createEventTable() {
		auto stateHandle = LuaManager::getInstance().getThreadSafeStateHandle();
		auto& state = stateHandle.state;
		auto eventData = state.create_table();

		eventData["button"] = m_KeyCode;
		eventData["isControlDown"] = m_ControlDown;
		eventData["isShiftDown"] = m_ShiftDown;
		eventData["isAltDown"] = m_AltDown;
		eventData["isSuperDown"] = m_SuperDown;

		return eventData;
	}

	bool MouseButtonDownEvent::m_EventEnabled = false;
}
