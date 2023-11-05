#pragma once

namespace mwse {
	class Configuration {
	public:
		static bool LogWarningsWithLuaStack;
		static bool EnableLegacyLuaMods;
		static bool KeepAllNetImmerseObjectsAlive;
		static bool RunInBackground;
		static bool PatchNiFlipController;
		static bool LetterboxMovies;
		static bool EnableLogColors;
		static bool EnableDependencyChecks;
		static bool ReplaceDialogueFiltering;
		static bool EnableLuaErrorNotifications;
		static UINT BuildNumber;

		static sol::table getDefaults();

		static void bindToLua();
	};
}
