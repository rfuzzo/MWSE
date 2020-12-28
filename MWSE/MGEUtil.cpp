#include "MGEUtil.h"

#include "TES3Game.h"
#include "TES3Reference.h"

#include "NITriShape.h"

#include "NIUtil.h"

namespace mge {
	void performRayTest(VMExecuteInterface& vm, TES3::Vector3& position, TES3::Vector3& direction, bool& out_hit, float& out_distance) {
		auto reference = vm.getReference();
		if (!reference) {
			return;
		}

		// Hide reference's NiNode to avoid self-collision
		auto cullNode = reference->sceneNode;
		if (cullNode && !cullNode->getAppCulled()) {
			cullNode->setAppCulled(true);
		}
		else {
			cullNode = nullptr;
		}

		auto pick = NI::getGlobalPick();
		pick->root = TES3::Game::get()->worldRoot;

		auto directionAsDXVec3 = reinterpret_cast<const D3DXVECTOR3*>(&direction);
		float inv_length = 1.0f / D3DXVec3Length(directionAsDXVec3);
		D3DXVECTOR3 directionNormal;
		D3DXVec3Scale(&directionNormal, directionAsDXVec3, inv_length);

		if (pick->pickObjects(&position, reinterpret_cast<const TES3::Vector3*>(&directionNormal))) {
			// Copy hit data to return later
			lastHit = *pick->results.storage[0];

			out_hit = true;
			out_distance = lastHit.distance * inv_length;

			// Fix hit data for skinned meshes
			if (lastHit.object->isOfType(NI::RTTIStaticPtr::NiTriShape) && static_cast<NI::TriShape*>(lastHit.object)->skinInstance) {
				// Use reference origin if possible, as actors consist of several skinned meshes
				auto hitRef = NI::getAssociatedReference(lastHit.object);
				TES3::Vector3& origin = hitRef ? hitRef->position : lastHit.object->worldBoundOrigin;

				lastHit.intersection.x = position.x + out_distance * direction.x;
				lastHit.intersection.y = position.y + out_distance * direction.y;
				lastHit.intersection.z = position.z + out_distance * direction.z;

				// Use cylindrical bounds to calculate normal
				D3DXVECTOR3 radial;
				radial.x = lastHit.intersection.x - origin.x;
				radial.y = lastHit.intersection.y - origin.y;
				radial.z = 1e-5;
				D3DXVec3Normalize(reinterpret_cast<D3DXVECTOR3*>(&lastHit.normal), &radial);
			}
		}

		// Clean up pick.
		pick->clearResults();
		pick->root = nullptr;

		// Restore cull state.
		if (cullNode) {
			cullNode->setAppCulled(false);
		}
	}
}
