#include "MGEPostShaders.h"

#include "MGEApi.h"
#include "TES3Vectors.h"

#include "Log.h"

namespace mge {
	//
	// Shader handler.
	//

	ShaderHandleLua::ShaderHandleLua(ShaderHandle h) :
		handle(h)
	{
		initialize();
	}

	ShaderHandleLua::~ShaderHandleLua() {
	}

	bool ShaderHandleLua::reload() {
		//auto wasEnabled = getEnabled();

		//if (api->shaderReload(handle)) {
		//	// Update variables map
		//	initialize();
		//	api->shaderSetEnabled(handle, wasEnabled);
		//	return true;
		//}
		//else {
			return false;
		//}
	}

	std::string ShaderHandleLua::toJson() const {
		std::ostringstream ss;
		//ss << "\"" << api->shaderGetName(handle) << "\"";
		return std::move(ss.str());
	}

	sol::table ShaderHandleLua::listVariables(sol::this_state ts) const {
		sol::state_view state(ts);
		auto table = state.create_table();

		for (auto& v : variableTypes) {
			table[v.first] = v.second;
		}

		return table;
	}

	sol::object ShaderHandleLua::getVariable(sol::this_state ts, const char* varName) const {
		sol::state_view state(ts);
		auto v = variableTypes.find(varName);
		if (v == variableTypes.end()) {
			return sol::nil;
		}

		//switch (v->second) {
		//case 'b':
		//	{
		//		bool result;
		//		if (api->shaderGetBool(handle, varName, &result)) {
		//			return sol::make_object(state, result);
		//		}
		//	}
		//	break;
		//case 'i':
		//	{
		//		int result;
		//		if (api->shaderGetInt(handle, varName, &result)) {
		//			return sol::make_object(state, result);
		//		}
		//	}
		//	break;
		//case 'f':
		//	{
		//		float result;
		//		if (api->shaderGetFloat(handle, varName, &result)) {
		//			return sol::make_object(state, result);
		//		}
		//	}
		//	break;
		//case 's':
		//	{
		//		const char* result;
		//		if (api->shaderGetString(handle, varName, &result)) {
		//			return sol::make_object(state, result);
		//		}
		//	}
		//	break;
		//case 'a':
		//	{
		//		// Array of floats.
		//		const size_t max_count = 256;
		//		float result[max_count];
		//		size_t count = max_count;
		//		// Count is set to the actual length, if the call is successful.
		//		if (api->shaderGetFloatArray(handle, varName, &result[0], &count)) {
		//			auto table = state.create_table(count, 0);

		//			for (auto i = 0u; i < count; ++i) {
		//				table[i + 1] = result[i];
		//			}
		//			return table;
		//		}
		//	}
		//	break;
		//case '2':
		//	{
		//		// Float vectors of length 2.
		//		TES3::Vector2 vec;
		//		if (api->shaderGetVector(handle, varName, &vec.x, 2)) {
		//			return sol::make_object(state, vec);
		//		}
		//	}
		//	break;
		//case '3':
		//	{
		//		// Float vectors of length 3.
		//		TES3::Vector3 vec;
		//		if (api->shaderGetVector(handle, varName, &vec.x, 3)) {
		//			return sol::make_object(state, vec);
		//		}
		//	}
		//	break;
		//case '4':
		//	{
		//		// Float vectors of length 4.
		//		TES3::Vector4 vec;
		//		if (api->shaderGetVector(handle, varName, &vec.x, 4)) {
		//			return sol::make_object(state, vec);
		//		}
		//	}
		//	break;
		//case 'm':
		//	{
		//		// TODO: Matrix get
		//	}
		//	break;
		//}

		return sol::nil;
	}

	void ShaderHandleLua::setVariable(const char* varName, sol::stack_object value) {
		//auto v = variableTypes.find(varName);
		//if (v == variableTypes.end()) {
		//	return;
		//}

		//switch (v->second) {
		//case 'b':
		//	api->shaderSetBool(handle, varName, value.as<bool>());
		//	break;
		//case 'i':
		//	api->shaderSetInt(handle, varName, value.as<int>());
		//	break;
		//case 'f':
		//	api->shaderSetFloat(handle, varName, value.as<float>());
		//	break;
		//case 's':
		//	api->shaderSetString(handle, varName, value.as<const char*>());
		//	break;
		//case 'a':
		//	{
		//		// Array of floats.
		//		auto values = value.as<sol::table>();
		//		if (values != sol::nil) {
		//			size_t count = values.size();
		//			std::vector<float> valueBuffer(count);
		//			for (auto i = 0u; i < count; ++i) {
		//				valueBuffer[i] = values[i+1];
		//			}
		//			api->shaderSetFloatArray(handle, varName, valueBuffer.data(), &count);
		//		}
		//		break;
		//	}
		//case '2':
		//	{
		//		// Float vectors of length 2.
		//		TES3::Vector2 vec;

		//		if (value.is<TES3::Vector2*>()) {
		//			vec = *value.as<TES3::Vector2*>();
		//			api->shaderSetVector(handle, varName, &vec.x, 2);
		//		}
		//		else if (value.is<sol::table>()) {
		//			auto table = value.as<sol::table>();
		//			vec.x = table[1];
		//			vec.y = table[2];
		//			api->shaderSetVector(handle, varName, &vec.x, 2);
		//		}
		//	}
		//break;
		//case '3':
		//	{
		//		// Float vectors of length 3.
		//		TES3::Vector3 vec;

		//		if (value.is<TES3::Vector3*>()) {
		//			vec = *value.as<TES3::Vector3*>();
		//			api->shaderSetVector(handle, varName, &vec.x, 3);
		//		}
		//		else if (value.is<sol::table>()) {
		//			auto table = value.as<sol::table>();
		//			vec.x = table[1];
		//			vec.y = table[2];
		//			vec.z = table[3];
		//			api->shaderSetVector(handle, varName, &vec.x, 3);
		//		}
		//	}
		//break;
		//case '4':
		//	{
		//		// Float vectors of length 4.
		//		TES3::Vector4 vec;

		//		if (value.is<TES3::Vector4*>()) {
		//			vec = *value.as<TES3::Vector4*>();
		//			api->shaderSetVector(handle, varName, &vec.x, 4);
		//		}
		//		else if (value.is<sol::table>()) {
		//			auto table = value.as<sol::table>();
		//			vec.x = table[1];
		//			vec.y = table[2];
		//			vec.z = table[3];
		//			vec.w = table[4];
		//			api->shaderSetVector(handle, varName, &vec.x, 4);
		//		}
		//	}
		//	break;
		//case 'm':
		//	{
		//		// TODO: Matrix set
		//	}
		//	break;
		//}
	}

	void ShaderHandleLua::initialize() {
		//name = api->shaderGetName(handle);

		// Load all variables.
		ShaderVariableInfo info;
		variableTypes.clear();

		//for (auto i = 0u; true; ++i) {
		//	if (api->shaderGetVariableInfo(handle, i, &info)) {
		//		// Skip variables with unknown type.
		//		if (info.valueType != 'x') {
		//			variableTypes[info.name] = info.valueType;
		//		}
		//	}
		//	else {
		//		break;
		//	}
		//}
	}
}
