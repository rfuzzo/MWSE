#pragma once

namespace mge {
	class MWInitPatch {
	public:
		static void disableIntroMovies();
		static void patchUIScale();
		static void patchFrameTimer();
	};
}
