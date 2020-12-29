#include "LuaUtil.h"
#include "LuaManager.h"

#include "LuaEquipEvent.h"

#include "Stack.h"

#include "ScriptUtil.h"
#include "ScriptUtilLua.h"

#include "TES3Creature.h"
#include "TES3Dialogue.h"
#include "TES3LeveledList.h"
#include "TES3Misc.h"
#include "TES3Reference.h"
#include "TES3Script.h"
#include "TES3Spell.h"

#include "BitUtil.h"

// MGE support functions.
#include "MGEConfiguration.h"
#include "MGEDistantLand.h"
#include "Log.h"
#include "MGEVersion.h"
#include "MGEPostShaders.h"
#include "MGEUserHUD.h"

namespace mwse {
	namespace lua {
		void bindScriptUtil() {
			auto stateHandle = LuaManager::getInstance().getThreadSafeStateHandle();
			sol::state& state = stateHandle.state;

			//
			// Get context on the current execution.
			//

			state["mwscript"]["getScript"] = []() {
				return LuaManager::getInstance().getCurrentScript();
			};

			state["mwscript"]["getReference"] = []() {
				return LuaManager::getInstance().getCurrentReference();
			};

			//
			// Expose base game opcodes.
			//

			state["mwscript"]["activate"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);

				mwscript::Activate(script, reference);
			};
			state["mwscript"]["addItem"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Item* item = getOptionalParamObject<TES3::Item>(params, "item");
				auto count = getOptionalParam<int>(params, "count", 1);
				if (item == NULL || count <= 0) {
					return false;
				}

				mwscript::AddItem(script, reference, item, count);
				reference->setObjectModified(true);
				reference->baseObject->setObjectModified(true);
				return true;
			};
			state["mwscript"]["addSoulGem"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Creature* creature = getOptionalParamObject<TES3::Creature>(params, "creature");
				TES3::Misc* soulGem = getOptionalParamObject<TES3::Misc>(params, "soulgem");
				if (creature == NULL || soulGem == NULL) {
					return false;
				}

				mwscript::AddSoulGem(script, reference, creature, soulGem);
				return true;
			};
			state["mwscript"]["addToLevCreature"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::LeveledCreature* list = getOptionalParamObject<TES3::LeveledCreature>(params, "list");
				TES3::Actor* actor = getOptionalParamObject<TES3::Actor>(params, "creature");
				auto level = getOptionalParam<short>(params, "level", 0);
				if (list == NULL || actor == NULL || level <= 0) {
					return false;
				}

				mwscript::AddToLevCreature(script, reference, list, actor, level);
				return true;
			};
			state["mwscript"]["addSpell"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Spell* spell = getOptionalParamSpell(params, "spell");
				if (spell == NULL) {
					return false;
				}

				mwscript::AddSpell(script, reference, spell);
				return true;
			};
			state["mwscript"]["addToLevItem"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::BaseObject* list = getOptionalParamObject<TES3::BaseObject>(params, "list");
				TES3::Item* item = getOptionalParamObject<TES3::Item>(params, "item");
				short level = getOptionalParam<short>(params, "level", 0);
				if (list == NULL || item == NULL || level <= 0) {
					return false;
				}

				mwscript::AddToLevItem(script, reference, list, item, level);
				return true;
			};
			state["mwscript"]["addTopic"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Dialogue* topic = getOptionalParamDialogue(params, "topic");
				if (topic == nullptr || topic->type != TES3::DialogueType::Topic) {
					return false;
				}

				mwscript::AddTopic(script, reference, topic);
				return true;
			};
			state["mwscript"]["aiTravel"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				auto x = getOptionalParam<float>(params, "x", 0.0f);
				auto y = getOptionalParam<float>(params, "y", 0.0f);
				auto z = getOptionalParam<float>(params, "z", 0.0f);

				mwscript::AITravel(script, reference, x, y, z);
				return true;
			};
			state["mwscript"]["disable"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				bool setModified = getOptionalParam<bool>(params, "modify", true);

				if (setModified) {
					reference->setObjectModified(true);
				}

				mwscript::Disable(script, reference);
				return true;
			};
			state["mwscript"]["drop"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Item* item = getOptionalParamObject<TES3::Item>(params, "item");
				auto count = getOptionalParam<int>(params, "count", 1);
				if (item == NULL) {
					return false;
				}

				mwscript::Drop(script, reference, item, count);
				return true;
			};
			state["mwscript"]["enable"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				bool setModified = getOptionalParam<bool>(params, "modify", true);

				if (reference == NULL) {
					return false;
				}

				if (setModified) {
					reference->setObjectModified(true);
				}

				mwscript::Enable(script, reference);
				return true;
			};
			state["mwscript"]["equip"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Item* item = getOptionalParamObject<TES3::Item>(params, "item");
				if (item == NULL || reference == NULL) {
					return false;
				}

				// Fire off the event, because script calls don't hit the same code as our hooks.
				if (event::EquipEvent::getEventEnabled()) {
					auto& luaManager = mwse::lua::LuaManager::getInstance();
					auto stateHandle = luaManager.getThreadSafeStateHandle();
					sol::object response = stateHandle.triggerEvent(new event::EquipEvent(reference, item, NULL));
					if (response.get_type() == sol::type::table) {
						sol::table eventData = response;
						if (eventData.get_or("block", false)) {
							return false;
						}
					}
				}

				mwscript::Equip(script, reference, item);
				return true;
			};
			state["mwscript"]["explodeSpell"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Spell* spell = getOptionalParamSpell(params, "spell");
				if (spell == NULL) {
					return false;
				}

				mwscript::ExplodeSpell(script, reference, spell);
				return true;
			};
			state["mwscript"]["getButtonPressed"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);

				return mwscript::GetButtonPressed(script, reference);
			};
			state["mwscript"]["hasItemEquipped"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Item* item = getOptionalParamObject<TES3::Item>(params, "item");
				if (item == NULL) {
					return false;
				}

				return mwscript::HasItemEquipped(script, reference, item);
			};
			// Obsolete. Do not document.
			state["mwscript"]["getDelete"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);

				return BITMASK_TEST(reference->objectFlags, TES3::ObjectFlag::Delete);
			};
			state["mwscript"]["getDetected"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Reference* target = getOptionalParamReference(params, "target");
				if (reference == NULL || target == NULL) {
					return false;
				}

				return mwscript::GetDetected(script, reference, target);
			};
			state["mwscript"]["getDisabled"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				return mwscript::GetDisabled(script, reference);
			};
			state["mwscript"]["getDistance"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Reference* target = getOptionalParamReference(params, "target");
				if (reference == NULL || target == NULL) {
					return -1.0f;
				}

				return mwscript::GetDistance(script, reference, target);
			};
			state["mwscript"]["getItemCount"] = [](sol::optional<sol::table> params) -> int {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Item* item = getOptionalParamObject<TES3::Item>(params, "item");
				if (item == NULL) {
					return 0;
				}

				return mwscript::GetItemCount(script, reference, item);
			};
			state["mwscript"]["getPCJumping"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				return mwscript::GetPCJumping(script);
			};
			state["mwscript"]["getPCRunning"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				return mwscript::GetPCRunning(script);
			};
			state["mwscript"]["getPCSneaking"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				return mwscript::GetPCSneaking(script);
			};
			state["mwscript"]["getSpellEffects"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Spell* spell = getOptionalParamSpell(params, "spell");
				if (spell == NULL) {
					return false;
				}

				return mwscript::GetSpellEffects(script, reference, spell);
			};
			// Obsolete. Do not document.
			state["mwscript"]["onActivate"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);

				bool result = reference->testActionFlag(TES3::ActionFlags::OnActivate);
				reference->clearActionFlag(TES3::ActionFlags::UseEnabled);
				reference->clearActionFlag(TES3::ActionFlags::OnActivate);
				return result;
			};
			// Obsolete. Do not document.
			state["mwscript"]["onDeath"] = [](sol::optional<sol::table> params) {
				TES3::Reference* reference = getOptionalParamExecutionReference(params);

				bool result = reference->testActionFlag(TES3::ActionFlags::OnDeath);
				reference->clearActionFlag(TES3::ActionFlags::OnDeath);
				return result;
			};
			// Obsolete. Do not document.
			state["mwscript"]["onKnockout"] = [](sol::optional<sol::table> params) {
				TES3::Reference* reference = getOptionalParamExecutionReference(params);

				bool result = reference->testActionFlag(TES3::ActionFlags::OnKnockout);
				reference->clearActionFlag(TES3::ActionFlags::OnKnockout);
				return result;
			};
			// Obsolete. Do not document.
			state["mwscript"]["onMurder"] = [](sol::optional<sol::table> params) {
				TES3::Reference* reference = getOptionalParamExecutionReference(params);

				bool result = reference->testActionFlag(TES3::ActionFlags::OnMurder);
				reference->clearActionFlag(TES3::ActionFlags::OnMurder);
				return result;
			};
			state["mwscript"]["placeAtPC"] = [](sol::optional<sol::table> params) -> TES3::Reference* {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::BaseObject* object = getOptionalParamObject<TES3::BaseObject>(params, "object");
				auto count = getOptionalParam<int>(params, "count", 1);
				auto distance = getOptionalParam<float>(params, "distance", 256.0f);
				auto direction = getOptionalParam<float>(params, "direction", 1.0f);
				if (object == NULL) {
					return nullptr;
				}

				mwscript::PlaceAtPC(script, reference, object, count, distance, direction);
				return mwscript::lastCreatedPlaceAtPCReference;
			};
			state["mwscript"]["playSound"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Sound* sound = getOptionalParamSound(params, "sound");
				if (sound == NULL) {
					return false;
				}

				mwscript::PlaySound(script, reference, sound);
				return true;
			};
			state["mwscript"]["position"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				auto x = getOptionalParam<float>(params, "x", 0.0f);
				auto y = getOptionalParam<float>(params, "y", 0.0f);
				auto z = getOptionalParam<float>(params, "z", 0.0f);
				auto rotation = getOptionalParam<float>(params, "rotation", 0.0f);

				mwscript::Position(script, reference, x, y, z, rotation);
				return true;
			};
			state["mwscript"]["positionCell"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				auto x = getOptionalParam<float>(params, "x", 0.0f);
				auto y = getOptionalParam<float>(params, "y", 0.0f);
				auto z = getOptionalParam<float>(params, "z", 0.0f);
				auto rotation = getOptionalParam<float>(params, "rotation", 0.0f);
				std::string cell = getOptionalParam<std::string>(params, "cell", "");
				if (cell.empty()) {
					return false;
				}

				mwscript::PositionCell(script, reference, x, y, z, rotation, cell.c_str());
				return true;
			};
			state["mwscript"]["removeItem"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Item* item = getOptionalParamObject<TES3::Item>(params, "item");
				auto count = getOptionalParam<int>(params, "count", 1);
				if (item == NULL) {
					return false;
				}

				mwscript::RemoveItem(script, reference, item, count);
				reference->setObjectModified(true);
				reference->baseObject->setObjectModified(true);
				return true;
			};
			state["mwscript"]["removeSpell"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Spell* spell = getOptionalParamSpell(params, "spell");
				if (spell == NULL) {
					return false;
				}

				mwscript::RemoveSpell(script, reference, spell);
				return true;
			};
			state["mwscript"]["scriptRunning"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Script* targetScript = getOptionalParamScript(params, "script");
				if (targetScript == NULL) {
					return false;
				}

				return mwscript::ScriptRunning(script, targetScript);
			};
			// Obsolete. Do not document.
			state["mwscript"]["setDelete"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);

				reference->setDeleted(getOptionalParam<bool>(params, "delete", true));
				reference->setObjectModified(true);

				return true;
			};
			state["mwscript"]["setLevel"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				auto level = getOptionalParam<short>(params, "level", 0);
				if (level <= 0) {
					return false;
				}

				mwscript::SetLevel(script, reference, level);
				return true;
			};
			state["mwscript"]["startCombat"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Reference* target = getOptionalParamReference(params, "target");
				if (target == NULL) {
					return false;
				}

				mwscript::StartCombat(script, reference, target);
				return true;
			};
			state["mwscript"]["startScript"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Script* targetScript = getOptionalParamScript(params, "script");
				if (targetScript == NULL) {
					return false;
				}

				mwscript::StartScript(script, reference, targetScript);
				return true;
			};
			state["mwscript"]["stopCombat"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				if (reference == NULL) {
					return false;
				}

				mwscript::StopCombat(script, reference);
				return true;
			};
			state["mwscript"]["stopScript"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Script* targetScript = getOptionalParamScript(params, "script");
				if (targetScript == NULL) {
					targetScript = script;
				}

				if (targetScript) {
					mwscript::StopScript(script, targetScript);
					return true;
				}

				return false;
			};
			state["mwscript"]["stopSound"] = [](sol::optional<sol::table> params) {
				TES3::Script* script = getOptionalParamExecutionScript(params);
				TES3::Reference* reference = getOptionalParamExecutionReference(params);
				TES3::Sound* sound = getOptionalParamSound(params, "sound");
				if (sound == NULL) {
					return false;
				}

				mwscript::StopSound(script, reference, sound);
				return true;
			};
			state["mwscript"]["wakeUpPC"] = []() {
				mwscript::RunOriginalOpCode(NULL, NULL, OpCode::WakeUpPC);
			};

			//
			// MGE opcodes.
			//

			// General functions.
			state["mge"]["getScreenHeight"] = []() {
				return mge::MGEhud::getScreenHeight();
			};
			state["mge"]["getScreenWidth"] = []() {
				return mge::MGEhud::getScreenWidth();
			};
			state["mge"]["getVersion"] = []() {
				return mge::PACKED_VERSION;
			};
			state["mge"]["log"] = [](std::string& string) {
				mwse::log::getLog() << string;
			};

			// HUD-related functions.
			state["mge"]["clearHUD"] = []() {
				mge::MGEhud::resetMWSE();
			};
			state["mge"]["disableHUD"] = [](sol::optional<sol::table> params) {
				auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
				auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;
				if (id != mge::MGEhud::invalid_hud_id) {
					mge::MGEhud::disable(id);
				}

				return true;
			};
			state["mge"]["enableHUD"] = [](sol::optional<sol::table> params) {
				auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
				auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;
				if (id != mge::MGEhud::invalid_hud_id) {
					mge::MGEhud::enable(id);
				}

				return true;
			};
			state["mge"]["freeHUD"] = [](sol::optional<sol::table> params) {
				auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
				auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;
				if (id != mge::MGEhud::invalid_hud_id) {
					mge::MGEhud::free(id);
				}

				return true;
			};
			state["mge"]["fullscreenHUD"] = [](sol::optional<sol::table> params) {
				auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
				auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;
				if (id != mge::MGEhud::invalid_hud_id) {
					mge::MGEhud::setFullscreen(id);
				}

				return true;
			};
			state["mge"]["loadHUD"] = [](sol::optional<sol::table> params) {
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
			};
			state["mge"]["positionHUD"] = [](sol::optional<sol::table> params) {
				auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
				auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;

				if (id == mge::MGEhud::invalid_hud_id) {
					return false;
				}

				auto x = getOptionalParam(params, "x", 0.0f);
				auto y = getOptionalParam(params, "y", 0.0f);
				mge::MGEhud::setPosition(id, x, y);
				return true;
			};
			state["mge"]["scaleHUD"] = [](sol::optional<sol::table> params) {
				auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
				auto id = hudName ? mge::MGEhud::resolveName(hudName) : mge::MGEhud::currentHUD;

				if (id == mge::MGEhud::invalid_hud_id) {
					return false;
				}

				auto x = getOptionalParam(params, "x", 0.0f);
				auto y = getOptionalParam(params, "y", 0.0f);
				mge::MGEhud::setScale(id, x, y);
				return true;
			};
			state["mge"]["selectHUD"] = [](sol::optional<sol::table> params) {
				auto hudName = getOptionalParam<const char*>(params, "hud", nullptr);
				auto id = mge::MGEhud::resolveName(hudName);

				mge::MGEhud::currentHUDId = hudName;
				mge::MGEhud::currentHUD = id;

				return true;
			};
			state["mge"]["setHUDEffect"] = [](sol::optional<sol::table> params) {
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
			};
			state["mge"]["setHUDEffectFloat"] = [](sol::optional<sol::table> params) {
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
			};
			state["mge"]["setHUDEffectLong"] = [](sol::optional<sol::table> params) {
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
			};
			state["mge"]["setHUDEffectVector4"] = [](sol::optional<sol::table> params) {
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
			};
			state["mge"]["setHUDTexture"] = [](sol::optional<sol::table> params) {
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
			};
			state["mge"]["unselectHUD"] = [](sol::optional<sol::table> params) {
				mge::MGEhud::currentHUDId.clear();
				mge::MGEhud::currentHUD = mge::MGEhud::invalid_hud_id;
				return true;
			};

			// Shader-related functions.
			state["mge"]["disableShader"] = [](sol::optional<sol::table> params) {
				auto shader = getOptionalParam<const char*>(params, "shader", nullptr);
				if (!shader) {
					return false;
				}

				mge::PostShaders::setShaderEnable(shader, false);

				return true;
			};
			state["mge"]["enableShader"] = [](sol::optional<sol::table> params) {
				auto shader = getOptionalParam<const char*>(params, "shader", nullptr);
				if (!shader) {
					return false;
				}

				mge::PostShaders::setShaderEnable(shader, true);

				return true;
			};
			state["mge"]["setShaderFloat"] = [](sol::optional<sol::table> params) {
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
			};
			state["mge"]["setShaderLong"] = [](sol::optional<sol::table> params) {
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
			};
			state["mge"]["setShaderVector4"] = [](sol::optional<sol::table> params) {
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
			};

			// Camera zoom functions.
			state["mge"]["disableZoom"] = []() {
				mge::Configuration.MGEFlags &= ~ZOOM_ASPECT;
			};
			state["mge"]["enableZoom"] = []() {
				mge::Configuration.MGEFlags |= ZOOM_ASPECT;
			};
			state["mge"]["toggleZoom"] = []() {
				mge::Configuration.MGEFlags ^= ZOOM_ASPECT;
			};
			state["mge"]["zoomIn"] = [](sol::optional<sol::table> params) {
				auto amount = getOptionalParam<float>(params, "amount");
				if (amount) {
					mge::Configuration.CameraEffects.zoom = std::min(mge::Configuration.CameraEffects.zoom + amount.value(), 8.0f);
				}
				else {
					mge::Configuration.CameraEffects.zoom = std::min(mge::Configuration.CameraEffects.zoom + 0.0625f, 40.0f);
				}

				return true;
			};
			state["mge"]["zoomOut"] = [](sol::optional<sol::table> params) {
				auto amount = getOptionalParam<float>(params, "amount", 0.0625f);
				mge::Configuration.CameraEffects.zoom = std::max(1.0f, mge::Configuration.CameraEffects.zoom - amount);
			};
			state["mge"]["setZoom"] = [](sol::optional<sol::table> params) {
				auto amount = getOptionalParam<float>(params, "amount", 0.0f);
				bool animate = getOptionalParam<bool>(params, "animate", false);

				if (animate) {
					mge::Configuration.CameraEffects.zoomRateTarget = amount;
					mge::Configuration.CameraEffects.zoomRate = (amount < 0) ? amount : 0;
				}
				else {
					mge::Configuration.CameraEffects.zoom = std::max(1.0f, amount);
				}
			};
			state["mge"]["getZoom"] = []() {
				return mge::Configuration.CameraEffects.zoom;
			};
			state["mge"]["stopZoom"] = []() {
				mge::Configuration.CameraEffects.zoomRateTarget = 0;
				mge::Configuration.CameraEffects.zoomRate = 0;
			};

			// Camera shake functions.
			state["mge"]["enableCameraShake"] = [](sol::optional<sol::table> params) {
				auto magnitude = getOptionalParam<float>(params, "magnitude");
				if (magnitude) {
					mge::Configuration.CameraEffects.shakeMagnitude = magnitude.value();
				}

				auto acceleration = getOptionalParam<float>(params, "acceleration");
				if (acceleration) {
					mge::Configuration.CameraEffects.shakeAccel = acceleration.value();
				}

				mge::Configuration.CameraEffects.shake = true;
			};
			state["mge"]["disableCameraShake"] = []() {
				mge::Configuration.CameraEffects.shake = false;
			};
			state["mge"]["setCameraShakeMagnitude"] = [](sol::optional<sol::table> params) {
				auto magnitude = getOptionalParam<float>(params, "magnitude");
				if (magnitude) {
					mge::Configuration.CameraEffects.shakeMagnitude = magnitude.value();
				}
			};
			state["mge"]["setCameraShakeAcceleration"] = [](sol::optional<sol::table> params) {
				auto acceleration = getOptionalParam<float>(params, "acceleration");
				if (acceleration) {
					mge::Configuration.CameraEffects.shakeAccel = acceleration.value();
				}
			};

			// Camera rotation functions.
			state["mge"]["getScreenRotation"] = []() {
				return mge::Configuration.CameraEffects.rotation;
			};
			state["mge"]["modScreenRotation"] = [](sol::optional<sol::table> params) {
				auto rotation = getOptionalParam<float>(params, "rotation");
				if (rotation) {
					mge::Configuration.CameraEffects.rotateUpdate = true;
					mge::Configuration.CameraEffects.rotation += rotation.value();
				}
			};
			state["mge"]["setScreenRotation"] = [](sol::optional<sol::table> params) {
				auto rotation = getOptionalParam<float>(params, "rotation");
				if (rotation) {
					mge::Configuration.CameraEffects.rotateUpdate = true;
					mge::Configuration.CameraEffects.rotation = rotation.value();
				}
			};
			state["mge"]["startScreenRotation"] = []() {
				mge::Configuration.CameraEffects.rotateUpdate = true;
			};
			state["mge"]["stopScreenRotation"] = []() {
				mge::Configuration.CameraEffects.rotateUpdate = false;
			};

			// MGE XE rendering functions.
			state["mge"]["setWeatherScattering"] = [](sol::optional<sol::table> params) {
				auto outscatter = getOptionalParamVector3(params, "outscatter");
				auto inscatter = getOptionalParamVector3(params, "inscatter");

				if (!outscatter || !inscatter) {
					return false;
				}

				RGBVECTOR outer(outscatter.value().x, outscatter.value().y, outscatter.value().z);
				RGBVECTOR inner(inscatter.value().x, inscatter.value().y, inscatter.value().z);
				mge::DistantLand::setScattering(outer, inner);

				return true;
			};
			state["mge"]["getWeatherScattering"] = [](sol::this_state ts) {
				auto stateHandle = LuaManager::getInstance().getThreadSafeStateHandle();
				sol::state_view state = ts;

				sol::table inner = state.create_table_with(1, mge::DistantLand::atmInscatter.r, 2, mge::DistantLand::atmInscatter.g, 3, mge::DistantLand::atmInscatter.b);
				sol::table outer = state.create_table_with(1, mge::DistantLand::atmOutscatter.r, 2, mge::DistantLand::atmOutscatter.g, 3, mge::DistantLand::atmOutscatter.b);

				return std::make_tuple(inner, outer);
			};
			state["mge"]["getWeatherDLFog"] = [](int weatherID) {
				return std::make_tuple(mge::Configuration.DL.FogD[weatherID], mge::Configuration.DL.FgOD[weatherID]);
			};
			state["mge"]["setWeatherDLFog"] = [](int weatherID, float fogDistMult, float fogOffset) {
				mge::Configuration.DL.FogD[weatherID] = fogDistMult;
				mge::Configuration.DL.FgOD[weatherID] = fogOffset;
			};
			state["mge"]["getWeatherPPLLight"] = [](int weatherID) {
				return std::make_tuple(mge::Configuration.Lighting.SunMult[weatherID], mge::Configuration.Lighting.AmbMult[weatherID]);
			};
			state["mge"]["setWeatherPPLLight"] = [](int weatherID, float sunMult, float ambMult) {
				mge::Configuration.Lighting.SunMult[weatherID] = sunMult;
				mge::Configuration.Lighting.AmbMult[weatherID] = ambMult;
			};
		}
	}
}
