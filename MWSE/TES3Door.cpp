#include "TES3Door.h"

namespace TES3 {
	void Door::setName(const char* n) {
		auto length = strlen(n);
		if (length >= 32) {
			throw std::invalid_argument("Name cannot be 32 or more characters.");
		}
		strncpy_s(name, n, length);
	}
}

MWSE_SOL_CUSTOMIZED_PUSHER_DEFINE_TES3(TES3::Door)
