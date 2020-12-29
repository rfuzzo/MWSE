#include "MGEPostShadersLua.h"

#include "LuaManager.h"

#include "MGEPostShaders.h"

namespace mwse::lua {
	void bindMGEPostShaders() {
		// Get our lua state.
		auto stateHandle = LuaManager::getInstance().getThreadSafeStateHandle();
		sol::state& state = stateHandle.state;

		// mge::ShaderHandle
		{
			// Start our usertype. We must finish this with state.set_usertype.
			auto usertypeDefinition = state.new_usertype<mge::ShaderHandle>("tes3ShaderHandle");
			usertypeDefinition["new"] = sol::no_constructor;

			usertypeDefinition[sol::meta_function::to_string] = &mge::ShaderHandle::getName;
			usertypeDefinition["__tojson"] = &mge::ShaderHandle::toJson;

			// Allow variables to be get/set using their variable name.
			usertypeDefinition[sol::meta_function::index] = &mge::ShaderHandle::getVariable;
			usertypeDefinition[sol::meta_function::new_index] = &mge::ShaderHandle::setVariable;

			// 
			usertypeDefinition["enabled"] = sol::property(&mge::ShaderHandle::getEnabled, &mge::ShaderHandle::setEnabled);
			usertypeDefinition["legacyFlags"] = sol::readonly_property(&mge::ShaderHandle::getLegacyFlags);
			usertypeDefinition["name"] = sol::readonly_property(&mge::ShaderHandle::getName);
			usertypeDefinition["timestamp"] = sol::readonly_property(&mge::ShaderHandle::getTimestamp);
		}
	}
}
