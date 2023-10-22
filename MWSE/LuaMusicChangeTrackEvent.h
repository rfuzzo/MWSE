#pragma once

#include "LuaGenericEvent.h"
#include "LuaDisableableEvent.h"

namespace mwse::lua::event {
	class MusicChangeTrackEvent : public GenericEvent, public DisableableEvent<MusicChangeTrackEvent> {
	public:
		MusicChangeTrackEvent(const char* music, float volume, int crossfadeMS, int situation);
		sol::table createEventTable();

		static const char* ms_Context;

	protected:
		const char* m_Music;
		float m_Volume;
		int m_CrossfadeMS;
		int m_Situation;
	};
}
