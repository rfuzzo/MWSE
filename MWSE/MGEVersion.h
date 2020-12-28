#pragma once

namespace mge {
	// Main MGE XE version.
	static constexpr auto VERSION_STRING = "MGE XE 0.12.0";
	static constexpr auto MGE_MAJOR_VERSION = 4u;
	static constexpr auto MGE_MINOR_VERSION = 12u;
	static constexpr auto MGE_BUILD_VERSION = 0u;

	// Enforce version packing space.
	static_assert(MGE_MAJOR_VERSION <= 255);
	static_assert(MGE_MINOR_VERSION <= 255);
	static_assert(MGE_BUILD_VERSION <= 255);

	// Distant land version. Changing this invalidates DL previously generated.
	static constexpr auto DISTANT_LAND_VERSION = 6;

	// Version exposed to MWSE interface.
	static constexpr auto PACKED_VERSION = ((MGE_MAJOR_VERSION * 0x10000u) + (MGE_MINOR_VERSION * 0x100u) + MGE_BUILD_VERSION);
}

