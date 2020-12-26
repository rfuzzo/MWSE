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

typedef HRESULT(__stdcall* DirectInput8Create_t)(HINSTANCE, DWORD, REFIID, LPVOID*, void*);
extern "C" HRESULT __stdcall FakeDirectInput8Create(HINSTANCE a, DWORD b, REFIID c, void** d, void* e) {
    return DirectInput8Create_t(GetProcAddress(mwseDLL, "DirectInput8Create"))(a, b, c, d, e);
}
