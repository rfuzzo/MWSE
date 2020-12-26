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
#include "MgeTes3Machine.h"

#include "TES3Util.h"
#include "CodePatchUtil.h"
#include "PatchUtil.h"
#include "MWSEDefs.h"
#include "BuildDate.h"

#include "LuaManager.h"
#include "TES3Game.h"

// MGE headers
#include "configuration.h"
#include "mgeversion.h"
#include "mwinitpatch.h"
#include "mgebridge.h"
#include "mge_log.h"

TES3MACHINE* mge_virtual_machine = NULL;

struct VersionStruct {
	BYTE major;
	BYTE minor;
	BYTE patch;
	BYTE build;
};

VersionStruct GetMGEVersion() {
	DWORD dwSize = GetFileVersionInfoSize("MGEXEgui.exe", NULL);
	if (dwSize == 0) {
		return VersionStruct{};
	}

	BYTE * pbVersionInfo = new BYTE[dwSize];
	if (!GetFileVersionInfo("MGEXEgui.exe", 0, dwSize, pbVersionInfo)) {
		delete[] pbVersionInfo;
		return VersionStruct{};
	}

	VS_FIXEDFILEINFO * pFileInfo = NULL;
	UINT puLenFileInfo = 0;
	if (!VerQueryValue(pbVersionInfo, TEXT("\\"), (LPVOID*)&pFileInfo, &puLenFileInfo)) {
		delete[] pbVersionInfo;
		return VersionStruct{};
	}

	VersionStruct version;
	version.major = BYTE(HIWORD(pFileInfo->dwProductVersionMS));
	version.minor = BYTE(LOWORD(pFileInfo->dwProductVersionMS));
	version.patch = BYTE(LOWORD(pFileInfo->dwProductVersionLS >> 16));
	version.build = BYTE(HIWORD(pFileInfo->dwProductVersionLS >> 16));
	delete[] pbVersionInfo;

	return version;
}

const auto TES3_Game_ctor = reinterpret_cast<TES3::Game*(__thiscall*)(TES3::Game*)>(0x417280);
TES3::Game* __fastcall OnGameStructCreated(TES3::Game * game) {
	// Install necessary patches.
	mwse::patch::installPatches();

	// Call overloaded function.
	return TES3_Game_ctor(game);
}

bool __fastcall OnGameStructInitialized(TES3::Game* game) {
	// Setup our lua interface before initializing.
	mwse::lua::LuaManager::getInstance().hook();

	// Install our later patches.
	mwse::patch::installPostLuaPatches();

	// Call overloaded function.
	return game->initialize();
}

void MWSE_DllAttach() {
	// Initialize log file.
	mwse::log::OpenLog("MWSE.log");
#ifdef APPVEYOR_BUILD_NUMBER
	mwse::log::getLog() << "Morrowind Script Extender v" << MWSE_VERSION_MAJOR << "." << MWSE_VERSION_MINOR << "." << MWSE_VERSION_PATCH << "-" << APPVEYOR_BUILD_NUMBER << " (built " << __DATE__ << ") hooked." << std::endl;
#else
	mwse::log::getLog() << "Morrowind Script Extender v" << MWSE_VERSION_MAJOR << "." << MWSE_VERSION_MINOR << "." << MWSE_VERSION_PATCH << " (built " << __DATE__ << ") hooked." << std::endl;
#endif

	// Before we do anything else, ensure that we can make minidumps.
	if (!mwse::patch::installMiniDumpHook()) {
		mwse::log::getLog() << "Warning: Unable to hook minidump! Crash dumps will be unavailable." << std::endl;
	}

	// Make sure we have the right version of MGE XE installed.
	VersionStruct mgeVersion = GetMGEVersion();
	if (mgeVersion.major == 0 && mgeVersion.minor == 0) {
		mwse::log::getLog() << "Error: Could not determine MGE XE version." << std::endl;
		MessageBox(NULL, "MGE XE does not seem to be installed. Please install MGE XE v0.10.0.0 or later.", "MGE XE Check Failed", MB_ICONERROR | MB_OK);
		exit(0);
	}
	else if (mgeVersion.major == 0 && mgeVersion.minor < 10) {
		mwse::log::getLog() << "Invalid MGE XE version: " << (int)mgeVersion.major << "." << (int)mgeVersion.minor << "." << (int)mgeVersion.patch << "." << (int)mgeVersion.build << std::endl;

		std::stringstream ss;
		ss << "Invalid MGE XE version found. Minimum version is 0.10.0.0.\nFound version: ";
		ss << "Found MGE XE v" << (int)mgeVersion.major << "." << (int)mgeVersion.minor << "." << (int)mgeVersion.patch << "." << (int)mgeVersion.build;
		MessageBox(NULL, ss.str().c_str(), "MGE XE Check Failed", MB_ICONERROR | MB_OK);
		exit(0);
	}
	else {
		mwse::log::getLog() << "Found MGE XE. Version: " << (int)mgeVersion.major << "." << (int)mgeVersion.minor << "." << (int)mgeVersion.patch << "." << (int)mgeVersion.build << std::endl;
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

	// Initialize our main mwscript hook.
	mwse::mwAdapter::Hook();

	// Install patches.
	mwse::genCallEnforced(0x417169, 0x417280, reinterpret_cast<DWORD>(OnGameStructCreated));

	// Create MGE VM interface.
	mge_virtual_machine = new TES3MACHINE();

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

	// Delay our lua hook until later, to ensure that Mod Organizer's VFS is hooked up.
	if (!mwse::genCallEnforced(0x417195, 0x417880, reinterpret_cast<DWORD>(OnGameStructInitialized))) {
		mwse::log::getLog() << "Could not hook MWSE-Lua initialization point!" << std::endl;
		exit(1);
	}
}

//
// MGE XE
//

extern void* CreateD3DWrapper(UINT);
extern void* CreateInputWrapper(void*);

static FARPROC GetSystemLibrary(const char* lib, const char* funcname);
static void setDPIScalingAware();

static const char* welcomeMessage = XE_VERSION_STRING;
static bool isMW;
static bool isCS;

extern "C" BOOL _stdcall DllMain(HANDLE hModule, DWORD reason, void* unused) {
	if (reason == DLL_PROCESS_DETACH) {
		// Unhook Lua interface.
		mwse::lua::LuaManager::getInstance().cleanup();
		return true;
	}
	else if (reason != DLL_PROCESS_ATTACH) {
		return true;
	}

	// Check if MW is in-process, avoid hooking the CS
	isMW = bool(GetModuleHandle("Morrowind.exe"));
	isCS = bool(GetModuleHandle("TES Construction Set.exe"));

	if (isMW) {
		LOG::open("mgeXE.log");
		LOG::logline(welcomeMessage);

		setDPIScalingAware();

		if (!Configuration.LoadSettings()) {
			LOG::logline("Error: MGE XE is not configured. MGE XE will be disabled for this session.");
			isMW = false;
			return true;
		}

		if (Configuration.MGEFlags & MGE_DISABLED) {
			// Signal that DirectX proxies should not load
			isMW = false;

			// Make Morrowind apply UI scaling, as the D3D proxy is not available to do it
			MWInitPatch::patchUIScale();
		}

		if (~Configuration.MGEFlags & MWSE_DISABLED && ~Configuration.MGEFlags & MGE_DISABLED) {
			MWSE_DllAttach();
			MWSE_MGEPlugin::init(HMODULE(hModule));
			LOG::logline("MWSE.dll injected.");
		}
		else {
			LOG::logline("MWSE is disabled.");
		}

		if (Configuration.MGEFlags & SKIP_INTRO) {
			MWInitPatch::disableIntroMovies();
		}

		MWInitPatch::patchFrameTimer();
	}

	return true;
}

// MGE XE exports
extern "C"
{
	__declspec(dllexport) TES3MACHINE* MWSEGetVM();
	__declspec(dllexport) bool MWSEAddInstruction(OPCODE op, INSTRUCTION *ins);
}

TES3MACHINE* MWSEGetVM()
{
	return mge_virtual_machine;
}

bool MWSEAddInstruction(OPCODE op, INSTRUCTION *ins)
{
	return mge_virtual_machine->AddInstruction(op, ins);
}

extern "C" void* _stdcall FakeDirect3DCreate(UINT version) {
	// Wrap Morrowind only, not TESCS
	if (isMW) {
		return CreateD3DWrapper(version);
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
			*d = CreateInputWrapper(dinput);
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
