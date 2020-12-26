// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"

typedef HRESULT(__stdcall* DirectInput8Create_t)(HINSTANCE, DWORD, REFIID, LPVOID*, LPUNKNOWN);

extern "C" HRESULT __stdcall FakeDirectInput8Create(HINSTANCE a, DWORD b, REFIID c, void** d, LPUNKNOWN e) {
    HMODULE FakeD3Ddll = LoadLibrary("d3d8.dll");
    if (FakeD3Ddll == nullptr) {
        return DIERR_BETADIRECTINPUTVERSION;
    }
    return DirectInput8Create_t(GetProcAddress(FakeD3Ddll, "DirectInput8Create"))(a, b, c, d, e);
}
