#include "stdafx.h"

typedef void* (_stdcall* Direct3DCreate8_t) (UINT);
static Direct3DCreate8_t MWSE_Direct3DCreate8 = nullptr;

extern "C" BOOL _stdcall DllMain(HANDLE hModule, DWORD reason, void* unused) {
    if (reason != DLL_PROCESS_ATTACH) {
        return true;
    }

    // Ensure that we attach mwse.dll immediately. Using the entry point isn't good enough.
    auto MWSE = LoadLibraryA("mwse.dll");
    if (!MWSE) {
        return false;
    }

    MWSE_Direct3DCreate8 = Direct3DCreate8_t(GetProcAddress(MWSE, "Direct3DCreate8"));

    return true;
}

extern "C" void* __stdcall FakeDirect3DCreate8(UINT version) {
    return MWSE_Direct3DCreate8(version);
}
