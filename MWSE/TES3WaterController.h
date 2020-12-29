#pragma once

#include "NIFlipController.h"
#include "NIProperty.h"

namespace TES3 {
	struct WaterController {
		struct Ripple {
			NI::Pointer<NI::TriShape> shape; // 0x0
			NI::Pointer<NI::TimeController> alphaController; // 0x4
			int unknown_0x8;
		};
		void* nvLake; // 0x0
		bool pixelShaderEnabled; // 0x4
		bool waterShown; // 0x5
		const char* rippleTexturePath; // 0x8
		NI::Pointer<NI::FlipController> flipController; // 0xC
		NI::Pointer<NI::TexturingProperty> texturingProperty; // 0x10
		NI::Pointer<NI::AlphaProperty> alphaProperty; // 0x14
		int flipTextureCount; // 0x18
		int rippleFrameCount; // 0x1C
		float unknown_0x20;
		float unknown_0x24;
		float unknown_0x28;
		int surfaceFPS; // 0x30
		float unknown_0x30;
		float rippleLifetime; // 0x34
		float rippleScaleX; // 0x38
		float rippleScaleY; // 0x3C
		float rippleAlphas[3]; // 0x40
		float rippleRotationSpeed; // 0x4C
		unsigned int rippleCount; // 0x50
		Ripple* ripples; // 0x54
		int nearWaterRadius; // 0x58
		int nearWaterPoints; // 0x5C
		float nearWaterUnderwaterFrequency; // 0x60
		float nearWaterUnderwaterVolume; // 0x64
		float nearWaterIndoorTolerance; // 0x68
		float nearWaterOutdoorTolerance; // 0x6C
		char nearWaterIndoorId[32]; // 0x70
		char nearWaterOutdoorId[32]; // 0x90
		NI::Pointer<NI::Object> unknown_0xB0;
		NI::Pointer<NI::Node> waterNode; // 0xB4
		NI::Pointer<NI::Node>* surfaceTiles; // 0xB8
		char* texture_0xBC;
		int surfaceTileCount; // 0xC0
		int tileTextureDivisor; // 0xC4
	};
	static_assert(sizeof(WaterController) == 0xC8, "TES3::WaterController failed size validation");
}
