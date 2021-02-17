/************************************************************************
	
	main.cpp - Copyright (c) 2008 The MWSE Project
	https://github.com/MWSE/MWSE/

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

**************************************************************************/

#include "mwAdapter.h"
#include "Log.h"

#include "TES3Util.h"
#include "CodePatchUtil.h"
#include "PatchUtil.h"
#include "MWSEDefs.h"
#include "BuildDate.h"

#include "LuaManager.h"
#include "LuaGenericEvent.h"

#include "TES3Game.h"
#include "TES3DataHandler.h"
#include "TES3WorldController.h"

#include "NIDX8Renderer.h"

// MGE headers
#include "MGEConfiguration.h"
#include "MGEVersion.h"
#include "MGEMWInitPatch.h"
#include "MGEDistantLand.h"
#include "MGEStatusOverlay.h"
#include "MGEMWBridge.h"
#include "MGED3D8Device.h"

const auto TES3_Game_ctor = reinterpret_cast<TES3::Game*(__thiscall*)(TES3::Game*)>(0x417280);
TES3::Game* __fastcall OnGameStructCreated(TES3::Game * game) {
	if (~mge::Configuration.MGEFlags & MWSE_DISABLED) {
		// Install necessary patches.
		mwse::patch::installPatches();
	}

	// Call overloaded function.
	return TES3_Game_ctor(game);
}

// This is technically a this-call function, but it doesn't make any use of member data.
const auto TES3_LoadLanguageFromINI = reinterpret_cast<void(__stdcall*)()>(0x467850);

bool __fastcall OnGameStructInitialized(TES3::Game* game) {
	if (~mge::Configuration.MGEFlags & MWSE_DISABLED) {
		// Force language recognition early so pre-initialization mods can make use of it.
		// We want this to run before mwse_init.lua but after MO2 has had a chance to do its thing.
		TES3_LoadLanguageFromINI();

		// Setup our lua interface before initializing.
		mwse::lua::LuaManager::getInstance().hook();

		// Install our later patches.
		mwse::patch::installPostLuaPatches();
	}

	// Call overloaded function.
	return game->initialize();
}

const auto TES3_UI_UpdateLoadingLabel = reinterpret_cast<void(__cdecl*)(const char*)>(0x5DEEF0);
void __fastcall FinishInitialization(TES3::IteratedList<void*>* itt) {
	// Call overwritten code.
	itt->clear();

	// Set up distant land.
	if (!(mge::Configuration.MGEFlags & MGE_DISABLED)) {
		TES3_UI_UpdateLoadingLabel("Initializing DistantLand");
		// Set scaling on Morrowind's UI system
		if (mge::DistantLand::init(TES3::Game::get()->renderer->device->realDevice)) {
			// Initially force view distance to max, required for full extent shadows and grass
			if (mge::Configuration.MGEFlags & USE_DISTANT_LAND) {
				mge::MWBridge::get()->SetViewDistance(7168.0);
			}
		}
		else {
			mge::Configuration.MGEFlags &= ~USE_DISTANT_LAND;
			mge::StatusOverlay::setStatus("MGE XE serious error condition. Check mgeXE.log for details.");
		}
	}

	// Let lua modders know the game is initialized.
	if (~mge::Configuration.MGEFlags & MWSE_DISABLED && ~mge::Configuration.MGEFlags & MGE_DISABLED) {
		TES3_UI_UpdateLoadingLabel("Initializing lua mods");

		// Hook up shorthand access to data handler, world controller, and game.
		auto stateHandle = mwse::lua::LuaManager::getInstance().getThreadSafeStateHandle();
		sol::state& state = stateHandle.state;

		state["tes3"]["dataHandler"] = TES3::DataHandler::get();
		state["tes3"]["worldController"] = TES3::WorldController::get();
		state["tes3"]["game"] = TES3::Game::get();

		stateHandle.triggerEvent(new mwse::lua::event::GenericEvent("initialized"));
	}
}


//
// MGE XE
//

namespace mge {
	extern void* CreateD3DWrapper(UINT);
	extern void* CreateInputWrapper(void*);
}

static FARPROC GetSystemLibrary(const char* lib, const char* funcname);
static void setDPIScalingAware();

static bool isMW = false;
static bool isCS = false;

extern "C" BOOL _stdcall DllMain(HANDLE hModule, DWORD reason, void* unused) {
	if (reason == DLL_PROCESS_DETACH) {
		// Unhook Lua interface.
		if (~mge::Configuration.MGEFlags & MWSE_DISABLED && ~mge::Configuration.MGEFlags & MGE_DISABLED) {
			mwse::lua::LuaManager::getInstance().cleanup();
		}
		return true;
	}
	else if (reason != DLL_PROCESS_ATTACH) {
		return true;
	}

	// Check if MW is in-process, avoid hooking the CS
	isMW = bool(GetModuleHandle("Morrowind.exe"));
	isCS = bool(GetModuleHandle("TES Construction Set.exe"));

	if (isMW) {
		// Initialize log file.
		mwse::log::open("MWSE.log");
#ifdef APPVEYOR_BUILD_NUMBER
		mwse::log::getLog() << "Morrowind Script Extender v" << MWSE_VERSION_MAJOR << "." << MWSE_VERSION_MINOR << "." << MWSE_VERSION_PATCH << "-" << APPVEYOR_BUILD_NUMBER << " (built " << __DATE__ << ") hooked." << std::endl;
#else
		mwse::log::getLog() << "Morrowind Script Extender v" << MWSE_VERSION_MAJOR << "." << MWSE_VERSION_MINOR << "." << MWSE_VERSION_PATCH << " (built " << __DATE__ << ") hooked." << std::endl;
#endif

		// Clear out legacy logs.
		if (std::filesystem::exists("mwselog.txt")) {
			std::filesystem::remove("mwselog.txt");
		}
		if (std::filesystem::exists("mgeXE.log")) {
			std::filesystem::remove("mgeXE.log");
		}

		// Before we do anything else, ensure that we can make minidumps.
		if (!mwse::patch::installMiniDumpHook()) {
			mwse::log::getLog() << "Warning: Unable to hook minidump! Crash dumps will be unavailable." << std::endl;
		}

		// Legacy support for old updater exe swap method.
		if (std::filesystem::exists("MWSE-Update.tmp")) {
			if (std::filesystem::exists("MWSE-Update.exe")) {
				std::filesystem::remove("MWSE-Update.exe");
			}
			std::filesystem::rename("MWSE-Update.tmp", "MWSE-Update.exe");
		}

		// List of temporary files that the updater couldn't update, and so need to be swapped out.
		std::vector<std::string> updaterTempFiles;
		updaterTempFiles.push_back("MWSE-Update.exe");
		updaterTempFiles.push_back("Newtonsoft.Json.dll");

		// Look to see if an update to the MWSE Updater was downloaded. If so, swap the temp files.
		for (const std::string& destFile : updaterTempFiles) {
			const std::string tempFile = destFile + ".tmp";
			if (std::filesystem::exists(tempFile)) {
				if (std::filesystem::exists(destFile)) {
					std::filesystem::remove(destFile);
				}
				std::filesystem::rename(tempFile, destFile);
			}
		}

		// Delete any old crash dumps.
		if (std::filesystem::exists("MWSE_MiniDump.dmp")) {
			std::filesystem::remove("MWSE_MiniDump.dmp");
		}

		// Parse and load the features installed by the Morrowind Code Patch.
		if (mwse::mcp::loadFeatureList()) {
			auto& log = mwse::log::getLog();
			log << "Morrowind Code Patch installed features: ";

			// Get a sorted list of enabled features.
			std::vector<long> enabledFeatures;
			for (const auto& itt : mwse::mcp::featureStore) {
				if (itt.second) {
					enabledFeatures.push_back(itt.first);
				}
			}
			std::sort(enabledFeatures.begin(), enabledFeatures.end());

			// Print them to the log.
			log << std::dec;
			for (auto i = 0U; i < enabledFeatures.size(); i++) {
				if (i != 0) log << ", ";
				log << enabledFeatures[i];
			}
			log << std::endl;
		}
		else {
			mwse::log::getLog() << "Failed to detect Morrowind Code Patch installed features. MCP may not be installed, or the mcpatch\\installed file may have been deleted. Mods will be unable to detect MCP feature support." << std::endl;
		}

		setDPIScalingAware();

		if (!mge::Configuration.LoadSettings()) {
			mwse::log::logLine("Error: MGE XE is not configured. MGE XE will be disabled for this session.");
			isMW = false;
			return true;
		}

		if (mge::Configuration.MGEFlags & MGE_DISABLED) {
			// Signal that DirectX proxies should not load
			isMW = false;

			// Make Morrowind apply UI scaling, as the D3D proxy is not available to do it
			mge::MWInitPatch::patchUIScale();
		}

		if (~mge::Configuration.MGEFlags & MWSE_DISABLED && ~mge::Configuration.MGEFlags & MGE_DISABLED) {
			// Initialize our main mwscript hook.
			mwse::mwAdapter::Hook();
		}
		else {
			mwse::log::logLine("MWSE is disabled. Lua scripts and MWScript VM extensions are disabled.");
		}

		if (mge::Configuration.MGEFlags & SKIP_INTRO) {
			mge::MWInitPatch::disableIntroMovies();
		}

		mge::MWInitPatch::patchFrameTimer();

		// Install patches.
		mwse::genCallEnforced(0x417169, 0x417280, reinterpret_cast<DWORD>(OnGameStructCreated));

		// Delay our lua hook until later, to ensure that Mod Organizer's VFS is hooked up.
		if (!mwse::genCallEnforced(0x417195, 0x417880, reinterpret_cast<DWORD>(OnGameStructInitialized))) {
			mwse::log::getLog() << "Could not hook MWSE-Lua initialization point!" << std::endl;
			exit(1);
		}

		// Setup more things when initialization is finished.
		mwse::genCallEnforced(0x4BB440, 0x47E280, reinterpret_cast<DWORD>(FinishInitialization));
		mwse::genCallEnforced(0x4BBC07, 0x47E280, reinterpret_cast<DWORD>(FinishInitialization));
	}

	return true;
}

extern "C" void* _stdcall FakeDirect3DCreate(UINT version) {
	// Wrap Morrowind only, not TESCS
	if (isMW) {
		return mge::CreateD3DWrapper(version);
	}
	else {
		// Use system D3D8
		typedef void* (_stdcall* D3DProc) (UINT);
		D3DProc func = (D3DProc)GetSystemLibrary("d3d8.dll", "Direct3DCreate8");
		return (func)(version);
	}
}

extern "C" HRESULT _stdcall FakeDirectInputCreate(HINSTANCE a, DWORD b, REFIID c, void** d, void* e) {
	typedef HRESULT(_stdcall* DInputProc) (HINSTANCE, DWORD, REFIID, void**, void*);
	DInputProc func = (DInputProc)GetSystemLibrary("dinput8.dll", "DirectInput8Create");

	void* dinput = 0;
	HRESULT hr = (func)(a, b, c, &dinput, e);

	if (hr == S_OK) {
		if (isMW) {
			*d = mge::CreateInputWrapper(dinput);
		}
		else {
			*d = dinput;
		}
	}

	return hr;
}

FARPROC GetSystemLibrary(const char* lib, const char* funcname) {
	// Get the address of a single function from a dll
	char syspath[MAX_PATH], path[MAX_PATH];
	GetSystemDirectoryA(syspath, sizeof(syspath));

	int str_sz = std::snprintf(path, sizeof(path), "%s\\%s", syspath, lib);
	if (str_sz >= sizeof(path)) {
		return NULL;
	}

	HMODULE dll = LoadLibraryA(path);
	if (dll == NULL) {
		return NULL;
	}

	return GetProcAddress(dll, funcname);
}

void setDPIScalingAware() {
	// Prevent DPI scaling from affecting chosen window size
	typedef BOOL(WINAPI* dpiProc)();
	dpiProc SetProcessDPIAware = (dpiProc)GetSystemLibrary("user32.dll", "SetProcessDPIAware");
	if (SetProcessDPIAware) {
		SetProcessDPIAware();
	}
}
