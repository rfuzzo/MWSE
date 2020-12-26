// pch.h: This is a precompiled header file.
// Files listed below are compiled only once, improving build performance for future builds.
// This also affects IntelliSense performance, including code completion and many code browsing features.
// However, files listed here are ALL re-compiled if any one of them is updated between builds.
// Do not add files here that you will be updating frequently as this negates the performance advantage.

#ifndef PCH_H
#define PCH_H

#define _CRT_SECURE_NO_WARNINGS
#define WIN32_LEAN_AND_MEAN
#include <windows.h>

#ifdef DEBUG
#define D3D_DEBUG_INFO
#endif

#define D3DXFX_LARGEADDRESS_HANDLE

//#include <d3d9.h>
//#include <d3dx9.h>

#include <d3d9.h>
#include <d3d9types.h>
#include <d3dx9math.h>

// Remove annoying defines from windows.h
#undef near
#undef far
#undef NEAR
#undef FAR
#define NEAR
#define FAR

#define DIRECTINPUT_VERSION 0x0800
#include <dinput.h>

#include <algorithm>
#include <array>
#include <basetyps.h>
#include <cassert>
#include <cctype>
#include <cmath>
#include <cstdarg>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <deque>
#include <map>
#include <sstream>
#include <stdlib.h>
#include <string>
#include <unordered_map>
#include <vector>
#include <wtypes.h>

#endif //PCH_H
