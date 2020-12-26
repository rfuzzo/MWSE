
template <typename T>
T getProc(const char* lib, const char* funcname) {
    HMODULE dll = LoadLibraryA(lib);
    if (dll == NULL) {
        return NULL;
    }
    return T(GetProcAddress(dll, funcname));
}

typedef void* (_stdcall* D3DProc) (UINT);
extern "C" void* _stdcall FakeDirect3DCreate(UINT version) {
    return getProc<D3DProc>("mwse.dll", "Direct3DCreate8")(version);
}

typedef HRESULT(_stdcall* DInputProc) (HINSTANCE, DWORD, REFIID, void**, void*);
extern "C" HRESULT _stdcall FakeDirectInputCreate(HINSTANCE a, DWORD b, REFIID c, void** d, void* e) {
    return getProc<DInputProc>("mwse.dll", "DirectInput8Create")(a, b, c, d, e);
}
