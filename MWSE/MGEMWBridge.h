#pragma once

#include "d3d8header.h"



//-----------------------------------------------------------------------------

class MWBridge {
public:
	~MWBridge();

	// Singleton access
	static MWBridge* get();

	// Connect to Morrowind memory
	void Load();

	// Used to determine whether we have connected to Morrowind's dynamic memory yet
	inline bool IsLoaded();
	bool CanLoad();

	void SetCrosshairEnabled(bool enabled);
	void ToggleCrosshair();
	bool IsExterior();
	bool IsMenu();
	bool IsLoadScreen();

	void SkipToNextTrack();
	void DisableMusic();

	DWORD GetCurrentWeather();
	DWORD GetNextWeather();
	float GetWeatherRatio();
	const RGBVECTOR* getCurrentWeatherSkyCol();
	const RGBVECTOR* getCurrentWeatherFogCol();
	DWORD getScenegraphFogCol();
	void setScenegraphFogCol(DWORD c);
	float getScenegraphFogDensity();
	bool CellHasWeather();
	float* GetWindVector();
	DWORD GetWthrStruct(int wthr);
	bool CellHasWater();
	bool IsUnderwater(float eyeZ);
	float simulationTime();
	float frameTime();

	float* getMouseSensitivityYX();
	float GetViewDistance();
	void SetViewDistance(float dist);

	void SetFOV(float screenFOV);

	void GetSunDir(float& x, float& y, float& z);
	BYTE GetSunVis();

	DWORD IntCurCellAddr();
	bool IntLikeExterior();
	float WaterLevel();

	const char* getInteriorName();
	const BYTE* getInteriorSun();
	float getInteriorFogDens();

	DWORD PlayerPositionPointer();
	float PlayerHeight();
	D3DXVECTOR3* PCam3Offset();
	DWORD getPlayerMACP();
	bool is3rdPerson();
	DWORD getPlayerTarget();
	int getPlayerWeapon();
	bool isPlayerCasting();
	bool isPlayerAimingWeapon();

	void HaggleMore(DWORD num);
	void HaggleLess(DWORD num);

	void toggleRipples(BOOL enabled);
	void markWaterNode(float k);
	void markMoonNodes(float k);
	void disableScreenshotFunc();
	void disableSunglare();
	void disableIntroMovies();
	bool isIntroDone();
	bool isLoadingSplash();
	void redirectMenuBackground(void (__stdcall* func)(int));
	void setUIScale(float scale);
	void patchUIConfigure(void (__stdcall* newfunc)());
	void patchFrameTimer(int (__cdecl* newfunc)());

	void* getGMSTPointer(DWORD id);
	DWORD getKeybindCode(DWORD action);
	const char* getPlayerName();
	float getGameHour();
	int getDaysPassed();
	int getFrameBeginMillis();

	MWBridge();

protected:
	DWORD m_version;
	bool m_loaded;
};

//-----------------------------------------------------------------------------
// Inline Functions
//-----------------------------------------------------------------------------

inline bool MWBridge::IsLoaded() {
	return m_loaded;
}

//-----------------------------------------------------------------------------
