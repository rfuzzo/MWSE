#include "stdafx.h"

static HMODULE mwseDLL = 0;

extern "C" BOOL _stdcall DllMain(HANDLE hModule, DWORD reason, void* unused) {
    if (reason != DLL_PROCESS_ATTACH) {
        return true;
    }

    // Ensure that we attach mwse.dll immediately. Using the entry point isn't good enough.
    mwseDLL = LoadLibraryA("mwse.dll");
    return true;
}

typedef void* (_stdcall* Direct3DCreate8_t) (UINT);
extern "C" void* __stdcall FakeDirect3DCreate8(UINT version) {
    return Direct3DCreate8_t(GetProcAddress(mwseDLL, "Direct3DCreate8"))(version);
}
