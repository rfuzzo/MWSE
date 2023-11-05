#pragma once

#include "CSDefines.h"

#include "NIIteratedList.h"
#include "NIProperty.h"

#include "StlList.h"
#include "LinkedObjectsList.h"

namespace se::cs {
	struct Skill_dummy {
		BYTE padding[0x30];
	};
	struct MagicEffect_dummy {
		BYTE padding[0x10C];
	};

	struct RecordHandler {
		struct GameSettingsContainer {
			HWND hFilteredSettingsList;
			HWND hSettingsTabs;
			int currentTabLParam;
			int unknown_0xC;
			GameSetting* gameSettings[1520]; // 0x10
			int unknown_0x17D0;
		};
		struct Substructure_9B10 {
			BYTE padding[0x960];
		};
		struct Substructure_A490 {
			BYTE padding[0x708];
		};
		int activeModCount; // 0x0
		GameFile* activeFile; // 0x4
		LinkedObjectList<Object>* allObjects; // 0x8
		int unknown_0xC;
		ModelLoader* modelLoader; // 0x10
		GameSettingsContainer* gameSettingsHandler; // 0x14
		NI::IteratedList<Race*>* races; // 0x18
		NI::IteratedList<LandTexture*>* landTextures; // 0x1C
		NI::IteratedList<Class*>* classes; // 0x20
		NI::IteratedList<Faction*>* factions; // 0x24
		NI::IteratedList<Script*>* scripts; // 0x28
		int unknown_0x2C;
		int unknown_0x30;
		int unknown_0x34;
		NI::IteratedList<Dialogue*>* dialogues; // 0x38
		NI::IteratedList<Region*>* regions; // 0x3C
		NI::IteratedList<BaseObject*>* birthsigns; // 0x40
		NI::IteratedList<BaseObject*>* startScripts; // 0x44
		Skill_dummy skills[27]; // 0x48
		MagicEffect_dummy magicEffects[143]; // 0x558
		StlList<Light*>* lights; // 0x9B0C
		Substructure_9B10 unknown_0x9B10;
		int unknown_0xA470;
		int unknown_0xA474;
		int unknown_0xA478;
		int unknown_0xA47C;
		int unknown_0xA480;
		int unknown_0xA484;
		int unknown_0xA488;
		int unknown_0xA48C;
		Substructure_A490 unknown_0xA490;
		int unknown_0xAB98;
		int unknown_0xAB9C;
		int unknown_0xABA0;
		int unknown_0xABA4;
		int unknown_0xABA8;
		int unknown_0xABAC;
		NI::Pointer<NI::Property> handlerCollisionWireframeProperty; // 0xABB0
		StlList<GameFile*>* availableDataFiles; // 0x1BB4
		GameFile* activeGameFiles[256]; // 0xABB8
		StlList<Cell*>* cells; // 0xAFB8
		int unknown_0xAFBC;
		int unknown_0xAFC0;
		char unknown_0xAFC4[260];
		BYTE unknown_0xB0C8;
		BYTE unknown_0xB0C9;
		BYTE unknown_0xB0CA;
		BYTE unknown_0xB0CB;
		BYTE unknown_0xB0CC;
		BYTE unknown_0xB0CD;
		BYTE unknown_0xB0CE;
		BYTE unknown_0xB0CF;
		int unknown_0xB0D0;
		int unknown_0xB0D4;
		int unknown_0xB0D8;
		int unknown_0xB0DC;
		int unknown_0xB0E0;
		int unknown_0xB0E4;
		int unknown_0xB0E8;
		int unknown_0xB0EC;
		int unknown_0xB0F0;
		int unknown_0xB0F4;

		size_t getCellCount() const;
		Cell* getCellByIndex(size_t index) const;
		Cell* getCellByID(const char* id) const;

		const char* getBaseAnimation(int sex, bool firstPerson = false) const;
		bool isBaseAnimation(const char* animation) const;

		GameSetting* getGameSettingForSkill(int id) const;
		GameSetting* getGameSettingForEffect(int id) const;

		void getNameForEffect(char* buffer, size_t bufferSize, int effect, int attribute, int skill) const;

		GameFile* getAvailableGameFileByIndex(unsigned int index) const;
	};
	static_assert(sizeof(RecordHandler) == 0xB0F8, "RecordHandler failed size validation");
	static_assert(sizeof(RecordHandler::GameSettingsContainer) == 0x17D4, "RecordHandler::GameSettingsContainer failed size validation");
}
