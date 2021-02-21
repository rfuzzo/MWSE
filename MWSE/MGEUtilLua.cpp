#include "MGEUtilLua.h"

#include "LuaManager.h"
#include "LuaUtil.h"

#include "MGEMacroFunctionDefs.h"
#include "MGEConfiguration.h"
#include "MGEDistantLand.h"
#include "Log.h"
#include "MGEVersion.h"
#include "MGEPostShaders.h"
#include "MGEUserHUD.h"

namespace mwse::lua {

	//
	// General functions.
	//

	auto mge_getVersion() {
		return mge::PACKED_VERSION;
	}

	void mge_log(std::string& string) {
		mwse::log::getLog() << string;
	}

	//
	// HUD-related functions.
	//

	auto mge_disableHUD(sol::optional<sol::table> params) {
		auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
		auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;
		if (id != mge::MGEhud::invalid_hud_id) {
			mge::MGEhud::disable(id);
		}

		return true;
	}

	auto mge_enableHUD(sol::optional<sol::table> params) {
		auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
		auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;
		if (id != mge::MGEhud::invalid_hud_id) {
			mge::MGEhud::enable(id);
		}

		return true;
	}

	auto mge_freeHUD(sol::optional<sol::table> params) {
		auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
		auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;
		if (id != mge::MGEhud::invalid_hud_id) {
			mge::MGEhud::free(id);
		}

		return true;
	}

	auto mge_fullscreenHUD(sol::optional<sol::table> params) {
		auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
		auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;
		if (id != mge::MGEhud::invalid_hud_id) {
			mge::MGEhud::setFullscreen(id);
		}

		return true;
	}

	auto mge_loadHUD(sol::optional<sol::table> params) {
		auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
		auto texture = getOptionalParam<const char*>(params, "hud", nullptr);
		if (!hudName || !texture) {
			return false;
		}

		mge::MGEhud::load(hudName, texture);

		if (getOptionalParam<bool>(params, "enable", false)) {
			mge::MGEhud::enable(mge::MGEhud::resolveName(hudName));
		}

		return true;
	}

	auto mge_positionHUD(sol::optional<sol::table> params) {
		auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
		auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;

		if (id == mge::MGEhud::invalid_hud_id) {
			return false;
		}

		auto x = getOptionalParam(params, "x", 0.0f);
		auto y = getOptionalParam(params, "y", 0.0f);
		mge::MGEhud::setPosition(id, x, y);
		return true;
	}

	auto mge_scaleHUD(sol::optional<sol::table> params) {
		auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
		auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;

		if (id == mge::MGEhud::invalid_hud_id) {
			return false;
		}

		auto x = getOptionalParam(params, "x", 0.0f);
		auto y = getOptionalParam(params, "y", 0.0f);
		mge::MGEhud::setScale(id, x, y);
		return true;
	}

	auto mge_selectHUD(sol::optional<sol::table> params) {
		auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
		auto id = mge::MGEhud::resolveName(hudName);

		mge::MGEhud::currentHUDId = hudName;
		mge::MGEhud::currentHUD = id;

		return true;
	}

	auto mge_setHUDEffect(sol::optional<sol::table> params) {
		auto hud = getOptionalParam<const char*>(params, "hud", nullptr);
		auto effect = getOptionalParam<const char*>(params, "effect", nullptr);
		auto id = hud ? mge::MGEhud::resolveName(hud) : mge::MGEhud::currentHUD;

		if (!effect) {
			return false;
		}

		if (id == mge::MGEhud::invalid_hud_id) {
			return false;
		}

		mge::MGEhud::setEffect(id, effect);
		return true;
	}

	auto mge_setHUDEffectFloat(sol::optional<sol::table> params) {
		auto hud = getOptionalParam<const char*>(params, "hud", nullptr);
		auto variable = getOptionalParam<const char*>(params, "variable", nullptr);
		auto id = hud ? mge::MGEhud::resolveName(hud) : mge::MGEhud::currentHUD;

		if (id != mge::MGEhud::invalid_hud_id) {
			auto value = getOptionalParam<float>(params, "value");
			if (value) {
				mge::MGEhud::setEffectFloat(id, variable, value.value());
				return true;
			}
		}

		return false;
	}

	auto mge_setHUDEffectLong(sol::optional<sol::table> params) {
		auto hud = getOptionalParam<const char*>(params, "hud", nullptr);
		auto variable = getOptionalParam<const char*>(params, "variable", nullptr);
		auto id = hud ? mge::MGEhud::resolveName(hud) : mge::MGEhud::currentHUD;

		if (id != mge::MGEhud::invalid_hud_id) {
			auto value = getOptionalParam<int>(params, "value");
			if (value) {
				mge::MGEhud::setEffectInt(id, variable, value.value());
				return true;
			}
		}

		return false;
	}

	auto mge_setHUDEffectVector4(sol::optional<sol::table> params) {
		auto hud = getOptionalParam<const char*>(params, "hud", nullptr);
		auto variable = getOptionalParam<const char*>(params, "variable", nullptr);
		auto id = hud ? mge::MGEhud::resolveName(hud) : mge::MGEhud::currentHUD;

		if (id != mge::MGEhud::invalid_hud_id) {
			sol::table values = getOptionalParam<sol::table>(params, "value", sol::nil);
			if (values != sol::nil && values.size() == 4) {
				float valueBuffer[4];
				for (size_t i = 0; i < 4; i++) {
					valueBuffer[i] = values[i];
				}
				mge::MGEhud::setEffectVec4(id, variable, valueBuffer);
				return true;
			}
		}

		return false;
	}

	auto mge_setHUDTexture(sol::optional<sol::table> params) {
		auto hud = getOptionalParam<const char*>(params, "hud", nullptr);
		auto texture = getOptionalParam<const char*>(params, "texture", nullptr);
		auto id = hud ? mge::MGEhud::resolveName(hud) : mge::MGEhud::currentHUD;

		if (!texture) {
			return false;
		}

		if (id == mge::MGEhud::invalid_hud_id) {
			return false;
		}

		mge::MGEhud::setTexture(id, texture);
		return true;
	}

	auto mge_unselectHUD(sol::optional<sol::table> params) {
		mge::MGEhud::currentHUDId.clear();
		mge::MGEhud::currentHUD = mge::MGEhud::invalid_hud_id;
		return true;
	}

	//
	// Shader related functions.
	//

	auto mge_disableShader(sol::optional<sol::table> params) {
		auto shader = getOptionalParam<const char*>(params, "shader", nullptr);
		if (!shader) {
			return false;
		}

		mge::PostShaders::setShaderEnable(shader, false);

		return true;
	}

	auto mge_enableShader(sol::optional<sol::table> params) {
		auto shader = getOptionalParam<const char*>(params, "shader", nullptr);
		if (!shader) {
			return false;
		}

		mge::PostShaders::setShaderEnable(shader, true);

		return true;
	}

	auto mge_setShaderFloat(sol::optional<sol::table> params) {
		auto shader = getOptionalParam<const char*>(params, "shader", nullptr);
		auto variable = getOptionalParam<const char*>(params, "variable", nullptr);
		if (!shader || !variable) {
			return false;
		}

		auto value = getOptionalParam<float>(params, "value");
		if (!value) {
			return false;
		}

		mge::PostShaders::setShaderVar(shader, variable, value.value());

		return true;
	}

	auto mge_setShaderLong(sol::optional<sol::table> params) {
		auto shader = getOptionalParam<const char*>(params, "shader", nullptr);
		auto variable = getOptionalParam<const char*>(params, "variable", nullptr);
		if (!shader || !variable) {
			return false;
		}

		auto value = getOptionalParam<int>(params, "value");
		if (!value) {
			return false;
		}

		mge::PostShaders::setShaderVar(shader, variable, value.value());

		return true;
	}

	auto mge_setShaderVector4(sol::optional<sol::table> params) {
		auto shader = getOptionalParam<const char*>(params, "shader", nullptr);
		auto variable = getOptionalParam<const char*>(params, "variable", nullptr);
		if (!shader || !variable) {
			return false;
		}

		float values[4];
		sol::table valuesTable = getOptionalParam<sol::table>(params, "value", sol::nil);
		if (valuesTable == sol::nil && valuesTable.size() != 4) {
			for (size_t i = 0; i < 4; i++) {
				values[i] = valuesTable[i];
			}
		}

		mge::PostShaders::setShaderVar(shader, variable, values);

		return true;
	}

	//
	// Zoom-related functions.
	//

	auto mge_disableZoom() {
		mge::Configuration.MGEFlags &= ~ZOOM_ASPECT;
	}

	auto mge_enableZoom() {
		mge::Configuration.MGEFlags |= ZOOM_ASPECT;
	}

	auto mge_toggleZoom() {
		mge::Configuration.MGEFlags ^= ZOOM_ASPECT;
	}

	auto mge_zoomIn(sol::optional<sol::table> params) {
		auto amount = getOptionalParam<float>(params, "amount");
		if (amount) {
			mge::Configuration.CameraEffects.zoom = std::min(mge::Configuration.CameraEffects.zoom + amount.value(), 8.0f);
		}
		else {
			mge::Configuration.CameraEffects.zoom = std::min(mge::Configuration.CameraEffects.zoom + 0.0625f, 40.0f);
		}

		return true;
	}

	auto mge_zoomOut(sol::optional<sol::table> params) {
		auto amount = getOptionalParam<float>(params, "amount", 0.0625f);
		mge::Configuration.CameraEffects.zoom = std::max(1.0f, mge::Configuration.CameraEffects.zoom - amount);
	}

	auto mge_setZoom(sol::optional<sol::table> params) {
		auto amount = getOptionalParam<float>(params, "amount", 0.0f);
		bool animate = getOptionalParam<bool>(params, "animate", false);

		if (animate) {
			mge::Configuration.CameraEffects.zoomRateTarget = amount;
			mge::Configuration.CameraEffects.zoomRate = (amount < 0) ? amount : 0;
		}
		else {
			mge::Configuration.CameraEffects.zoom = std::max(1.0f, amount);
		}
	}

	auto mge_getZoom() {
		return mge::Configuration.CameraEffects.zoom;
	}

	auto mge_stopZoom() {
		mge::Configuration.CameraEffects.zoomRateTarget = 0;
		mge::Configuration.CameraEffects.zoomRate = 0;
	}

	auto mge_enableCameraShake(sol::optional<sol::table> params) {
		auto magnitude = getOptionalParam<float>(params, "magnitude");
		if (magnitude) {
			mge::Configuration.CameraEffects.shakeMagnitude = magnitude.value();
		}

		auto acceleration = getOptionalParam<float>(params, "acceleration");
		if (acceleration) {
			mge::Configuration.CameraEffects.shakeAccel = acceleration.value();
		}

		mge::Configuration.CameraEffects.shake = true;
	}

	auto mge_disableCameraShake() {
		mge::Configuration.CameraEffects.shake = false;
	}

	auto mge_setCameraShakeMagnitude(sol::optional<sol::table> params) {
		auto magnitude = getOptionalParam<float>(params, "magnitude");
		if (magnitude) {
			mge::Configuration.CameraEffects.shakeMagnitude = magnitude.value();
		}
	}

	auto mge_setCameraShakeAcceleration(sol::optional<sol::table> params) {
		auto acceleration = getOptionalParam<float>(params, "acceleration");
		if (acceleration) {
			mge::Configuration.CameraEffects.shakeAccel = acceleration.value();
		}
	}

	auto mge_getScreenRotation() {
		return mge::Configuration.CameraEffects.rotation;
	}

	auto mge_modScreenRotation(sol::optional<sol::table> params) {
		auto rotation = getOptionalParam<float>(params, "rotation");
		if (rotation) {
			mge::Configuration.CameraEffects.rotateUpdate = true;
			mge::Configuration.CameraEffects.rotation += rotation.value();
		}
	}

	auto mge_setScreenRotation(sol::optional<sol::table> params) {
		auto rotation = getOptionalParam<float>(params, "rotation");
		if (rotation) {
			mge::Configuration.CameraEffects.rotateUpdate = true;
			mge::Configuration.CameraEffects.rotation = rotation.value();
		}
	}

	auto mge_startScreenRotation() {
		mge::Configuration.CameraEffects.rotateUpdate = true;
	}

	auto mge_stopScreenRotation() {
		mge::Configuration.CameraEffects.rotateUpdate = false;
	}

	//
	// Other MGE XE rendering functions.
	//

	auto mge_setWeatherScattering(sol::optional<sol::table> params) {
		auto outscatter = getOptionalParamVector3(params, "outscatter");
		auto inscatter = getOptionalParamVector3(params, "inscatter");

		if (!outscatter || !inscatter) {
			return false;
		}

		RGBVECTOR outer(outscatter.value().x, outscatter.value().y, outscatter.value().z);
		RGBVECTOR inner(inscatter.value().x, inscatter.value().y, inscatter.value().z);
		mge::DistantLand::setScattering(outer, inner);

		return true;
	}

	auto mge_getWeatherScattering(sol::this_state ts) {
		auto stateHandle = LuaManager::getInstance().getThreadSafeStateHandle();
		sol::state_view state = ts;

		sol::table inner = state.create_table_with(1, mge::DistantLand::atmInscatter.r, 2, mge::DistantLand::atmInscatter.g, 3, mge::DistantLand::atmInscatter.b);
		sol::table outer = state.create_table_with(1, mge::DistantLand::atmOutscatter.r, 2, mge::DistantLand::atmOutscatter.g, 3, mge::DistantLand::atmOutscatter.b);

		return std::make_tuple(inner, outer);
	}

	auto mge_getWeatherDLFog(int weatherID) {
		return std::make_tuple(mge::Configuration.DL.FogD[weatherID], mge::Configuration.DL.FgOD[weatherID]);
	}

	auto mge_setWeatherDLFog(int weatherID, float fogDistMult, float fogOffset) {
		mge::Configuration.DL.FogD[weatherID] = fogDistMult;
		mge::Configuration.DL.FgOD[weatherID] = fogOffset;
	}

	auto mge_getWeatherPPLLight(int weatherID) {
		return std::make_tuple(mge::Configuration.Lighting.SunMult[weatherID], mge::Configuration.Lighting.AmbMult[weatherID]);
	}

	auto mge_setWeatherPPLLight(int weatherID, float sunMult, float ambMult) {
		mge::Configuration.Lighting.SunMult[weatherID] = sunMult;
		mge::Configuration.Lighting.AmbMult[weatherID] = ambMult;
	}

	//
	// Expose it all to lua.
	//

	void bindMGEUtil() {
		auto stateHandle = LuaManager::getInstance().getThreadSafeStateHandle();
		sol::state& state = stateHandle.state;

		sol::table lua_mge = state["mge"];

		// General functions.
		lua_mge["decreaseFOV"] = mge::MacroFunctions::DecreaseFOV;
		lua_mge["decreaseViewRange"] = mge::MacroFunctions::DecreaseViewRange;
		lua_mge["decreaseZoom"] = mge::MacroFunctions::DecreaseZoom;
		lua_mge["disableMusic"] = mge::MacroFunctions::DisableMusic;
		lua_mge["getScreenHeight"] = mge::MGEhud::getScreenHeight;
		lua_mge["getScreenWidth"] = mge::MGEhud::getScreenWidth;
		lua_mge["getVersion"] = mge_getVersion;
		lua_mge["haggleLess1"] = mge::MacroFunctions::HaggleLess1;
		lua_mge["haggleLess10"] = mge::MacroFunctions::HaggleLess10;
		lua_mge["haggleLess100"] = mge::MacroFunctions::HaggleLess100;
		lua_mge["haggleLess1000"] = mge::MacroFunctions::HaggleLess1000;
		lua_mge["haggleLess10000"] = mge::MacroFunctions::HaggleLess10000;
		lua_mge["haggleMore1"] = mge::MacroFunctions::HaggleMore1;
		lua_mge["haggleMore10"] = mge::MacroFunctions::HaggleMore10;
		lua_mge["haggleMore100"] = mge::MacroFunctions::HaggleMore100;
		lua_mge["haggleMore1000"] = mge::MacroFunctions::HaggleMore1000;
		lua_mge["haggleMore10000"] = mge::MacroFunctions::HaggleMore10000;
		lua_mge["increaseFOV"] = mge::MacroFunctions::IncreaseFOV;
		lua_mge["increaseViewRange"] = mge::MacroFunctions::IncreaseViewRange;
		lua_mge["increaseZoom"] = mge::MacroFunctions::IncreaseZoom;
		lua_mge["log"] = mge_log;
		lua_mge["moveBack3PCam"] = mge::MacroFunctions::MoveBack3PCam;
		lua_mge["moveDown3PCam"] = mge::MacroFunctions::MoveDown3PCam;
		lua_mge["moveForward3PCam"] = mge::MacroFunctions::MoveForward3PCam;
		lua_mge["moveLeft3PCam"] = mge::MacroFunctions::MoveLeft3PCam;
		lua_mge["moveRight3PCam"] = mge::MacroFunctions::MoveRight3PCam;
		lua_mge["moveUp3PCam"] = mge::MacroFunctions::MoveUp3PCam;
		lua_mge["nextTrack"] = mge::MacroFunctions::NextTrack;
		lua_mge["resetEnableZoom"] = mge::MacroFunctions::ResetEnableZoom;
		lua_mge["showLastMessage"] = mge::MacroFunctions::ShowLastMessage;
		lua_mge["takeScreenshot"] = mge::MacroFunctions::TakeScreenshot;
		lua_mge["toggleBlending"] = mge::MacroFunctions::ToggleBlending;
		lua_mge["toggleCrosshair"] = mge::MacroFunctions::ToggleCrosshair;
		lua_mge["toggleDistantLand"] = mge::MacroFunctions::ToggleDistantLand;
		lua_mge["toggleFpsCounter"] = mge::MacroFunctions::ToggleFpsCounter;
		lua_mge["toggleGrass"] = mge::MacroFunctions::ToggleGrass;
		lua_mge["toggleLightingMode"] = mge::MacroFunctions::ToggleLightingMode;
		lua_mge["toggleShaders"] = mge::MacroFunctions::ToggleShaders;
		lua_mge["toggleShadows"] = mge::MacroFunctions::ToggleShadows;
		lua_mge["toggleStatusText"] = mge::MacroFunctions::ToggleStatusText;
		lua_mge["toggleTransparencyAA"] = mge::MacroFunctions::ToggleTransparencyAA;
		lua_mge["toggleZoom"] = mge::MacroFunctions::ToggleZoom;

		// HUD-related functions.
		lua_mge["clearHUD"] = mge::MGEhud::resetMWSE;
		lua_mge["disableHUD"] = mge_disableHUD;
		lua_mge["enableHUD"] = mge_enableHUD;
		lua_mge["freeHUD"] = mge_freeHUD;
		lua_mge["fullscreenHUD"] = mge_fullscreenHUD;
		lua_mge["loadHUD"] = mge_loadHUD;
		lua_mge["positionHUD"] = mge_positionHUD;
		lua_mge["scaleHUD"] = mge_scaleHUD;
		lua_mge["selectHUD"] = mge_selectHUD;
		lua_mge["setHUDEffect"] = mge_setHUDEffect;
		lua_mge["setHUDEffectFloat"] = mge_setHUDEffectFloat;
		lua_mge["setHUDEffectLong"] = mge_setHUDEffectLong;
		lua_mge["setHUDEffectVector4"] = mge_setHUDEffectVector4;
		lua_mge["setHUDTexture"] = mge_setHUDTexture;
		lua_mge["unselectHUD"] = mge_unselectHUD;

		// Shader-related functions.
		lua_mge["disableShader"] = mge_disableShader;
		lua_mge["enableShader"] = mge_enableShader;
		lua_mge["setShaderFloat"] = mge_setShaderFloat;
		lua_mge["setShaderLong"] = mge_setShaderLong;
		lua_mge["setShaderVector4"] = mge_setShaderVector4;

		// Camera zoom functions.
		lua_mge["disableZoom"] = mge_disableZoom;
		lua_mge["enableZoom"] = mge_enableZoom;
		lua_mge["toggleZoom"] = mge_toggleZoom;
		lua_mge["zoomIn"] = mge_zoomIn;
		lua_mge["zoomOut"] = mge_zoomOut;
		lua_mge["setZoom"] = mge_setZoom;
		lua_mge["getZoom"] = mge_getZoom;
		lua_mge["stopZoom"] = mge_stopZoom;
		lua_mge["enableCameraShake"] = mge_enableCameraShake;
		lua_mge["disableCameraShake"] = mge_disableCameraShake;
		lua_mge["setCameraShakeMagnitude"] = mge_setCameraShakeMagnitude;
		lua_mge["setCameraShakeAcceleration"] = mge_setCameraShakeAcceleration;
		lua_mge["getScreenRotation"] = mge_getScreenRotation;
		lua_mge["modScreenRotation"] = mge_modScreenRotation;
		lua_mge["setScreenRotation"] = mge_setScreenRotation;
		lua_mge["startScreenRotation"] = mge_startScreenRotation;
		lua_mge["stopScreenRotation"] = mge_stopScreenRotation;

		// MGE XE rendering functions.
		lua_mge["setWeatherScattering"] = mge_setWeatherScattering;
		lua_mge["getWeatherScattering"] = mge_getWeatherScattering;
		lua_mge["getWeatherDLFog"] = mge_getWeatherDLFog;
		lua_mge["setWeatherDLFog"] = mge_setWeatherDLFog;
		lua_mge["getWeatherPPLLight"] = mge_getWeatherPPLLight;
		lua_mge["setWeatherPPLLight"] = mge_setWeatherPPLLight;
	}
}