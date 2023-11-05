#include "CSRecordHandler.h"

#include "CSGameSetting.h"

#include "StringUtil.h"

namespace se::cs {
	size_t RecordHandler::getCellCount() const {
		const auto RecordHandler_getCellCount = reinterpret_cast<size_t(__thiscall*)(const RecordHandler*)>(0x401F7D);
		return RecordHandler_getCellCount(this);
	}

	Cell* RecordHandler::getCellByIndex(size_t index) const {
		const auto RecordHandler_getCellByIndex = reinterpret_cast<Cell*(__thiscall*)(const RecordHandler*, size_t)>(0x401230);
		return RecordHandler_getCellByIndex(this, index);
	}

	Cell* RecordHandler::getCellByID(const char* id) const {
		const auto RecordHandler_getCellByID = reinterpret_cast<Cell * (__thiscall*)(const RecordHandler*, const char*)>(0x403B66);
		return RecordHandler_getCellByID(this, id);
	}

	const char* RecordHandler::getBaseAnimation(int sex, bool firstPerson) const {
		const auto RecordHandler_getBaseAnimation = reinterpret_cast<const char* (__thiscall*)(const RecordHandler*, int, int)>(0x40236F);
		return RecordHandler_getBaseAnimation(this, sex, firstPerson);
	}

	bool RecordHandler::isBaseAnimation(const char* animation) const {
		const std::string_view animationSV = animation;
		
		const auto maleAnim = getBaseAnimation(0);
		if (maleAnim && string::iequal(maleAnim, animationSV)) {
			return true;
		}

		const auto femaleAnim = getBaseAnimation(1);
		if (femaleAnim && string::iequal(femaleAnim, animationSV)) {
			return true;
		}

		if (string::iequal("base_animKnA.nif", animationSV)) {
			return true;
		}

		if (string::iequal("argonian_swimKnA.nif", animationSV)) {
			return true;
		}

		return false;
	}

	GameSetting* RecordHandler::getGameSettingForSkill(int id) const {
		if (id == -1) {
			return nullptr;
		}

		const auto gConvertSkillToGMST = reinterpret_cast<int*>(0x6A7D58);
		const auto skillGMST = gConvertSkillToGMST[id];
		return gameSettingsHandler->gameSettings[skillGMST];
	}

	GameSetting* RecordHandler::getGameSettingForEffect(int id) const {
		if (id == -1) {
			return nullptr;
		}

		const auto gConvertEffectToGMST = reinterpret_cast<int*>(0x6A7E74);
		const auto effectGMST = gConvertEffectToGMST[id];
		return gameSettingsHandler->gameSettings[effectGMST];
	}

	void RecordHandler::getNameForEffect(char* buffer, size_t bufferSize, int effect, int attribute, int skill) const {
		if (effect == -1) {
			*buffer = '\0';
			return;
		}

		const auto gConvertEffectToGMST = reinterpret_cast<int*>(0x6A7E74);
		const auto effectGMST = gConvertEffectToGMST[effect];
		const auto gmst = gameSettingsHandler->gameSettings[effectGMST];

		// TODO: Make this actually show the correct attribute/skill stuff.
		sprintf_s(buffer, bufferSize, "%s", gmst->value.asString);
	}

	GameFile* RecordHandler::getAvailableGameFileByIndex(unsigned int index) const {
		const auto RecordHandler_getAvailableGameFileByIndex = reinterpret_cast<GameFile * (__thiscall*)(const RecordHandler*, size_t)>(0x501140);
		return RecordHandler_getAvailableGameFileByIndex(this, index);
	}
}
