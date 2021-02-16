#include "stdafx.h"

typedef HRESULT(__stdcall* DirectInput8Create_t)(HINSTANCE, DWORD, REFIID, LPVOID*, void*);
static DirectInput8Create_t MWSE_DirectInput8Create = nullptr;

extern "C" BOOL _stdcall DllMain(HANDLE hModule, DWORD reason, void* unused) {
    if (reason != DLL_PROCESS_ATTACH) {
        return true;
    }

    // Ensure that we attach mwse.dll immediately. Using the entry point isn't good enough.
    auto MWSE = LoadLibraryA("mwse.dll");
    if (!MWSE) {
        return false;
    }

    MWSE_DirectInput8Create = DirectInput8Create_t(GetProcAddress(MWSE, "DirectInput8Create"));

    return true;
}

extern "C" HRESULT __stdcall FakeDirectInput8Create(HINSTANCE a, DWORD b, REFIID c, void** d, void* e) {
    return MWSE_DirectInput8Create(a, b, c, d, e);
}
