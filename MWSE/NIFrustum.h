#pragma once

namespace NI {
	struct Frustum {
        float left; // 0x0
        float right; // 0x4
        float top; // 0x8
        float bottom; // 0xC
        float near; // 0x10
        float far; // 0x14
	};
    static_assert(sizeof(Frustum) == 0x18, "NI::Frustum failed size validation");
}
