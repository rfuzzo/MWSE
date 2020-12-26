
template <typename T>
T getProc(const char* lib, const char* funcname) {
    HMODULE dll = LoadLibraryA(lib);
    if (dll == NULL) {
        return NULL;
    }
    return T(GetProcAddress(dll, funcname));
}

typedef void* (_stdcall* Direct3DCreate8_t) (UINT);
extern "C" void* __stdcall FakeDirect3DCreate8(UINT version) {
    return getProc<Direct3DCreate8_t>("mwse.dll", "Direct3DCreate8")(version);
}
