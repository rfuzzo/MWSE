#include "TES3HashMapLua.h"
#include "TES3MagicEffectInstance.h"

namespace mwse {
	namespace lua {
		void bindTES3HashMap() {
			bindHashMap<char*, TES3::MagicEffectInstance>("tes3magicEffectHashMap");
		}
	}
}
