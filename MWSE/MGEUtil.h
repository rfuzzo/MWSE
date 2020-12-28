#pragma once

#include "NIPick.h"
#include "VirtualMachine.h"

namespace mge {
	void performRayTest(VMExecuteInterface& vm, TES3::Vector3& position, TES3::Vector3& direction, bool& out_hit, float& out_distance);
	static NI::PickRecord lastHit;
}
