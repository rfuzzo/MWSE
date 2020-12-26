// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"

template <typename T>
T getProc(const char* lib, const char* funcname) {
    HMODULE dll = LoadLibraryA(lib);
    if (dll == NULL) {
        return NULL;
    }
    return T(GetProcAddress(dll, funcname));
}

typedef HRESULT(__stdcall* DirectInput8Create_t)(HINSTANCE, DWORD, REFIID, LPVOID*, void*);
extern "C" HRESULT __stdcall FakeDirectInput8Create(HINSTANCE a, DWORD b, REFIID c, void** d, void* e) {
    return getProc<DirectInput8Create_t>("mwse.dll", "DirectInput8Create")(a, b, c, d, e);
}
