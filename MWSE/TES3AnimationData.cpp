#include "TES3AnimationData.h"
#include "TES3ActorAnimationController.h"

#include "NINode.h"
#include "NIKeyframeManager.h"

#include "LuaManager.h"

#include "LuaPlayAnimationGroupEvent.h"

namespace TES3 {
	const auto TES3_AnimationData_playAnimationGroupForIndex = reinterpret_cast<void(__thiscall*)(AnimationData*, int, int, int, int)>(0x470AE0);
	void AnimationData::playAnimationGroupForIndex(int animationGroup, int triIndex, int startFlag, int loopCount) {
		if (mwse::lua::event::PlayAnimationGroupEvent::getEventEnabled()) {
			auto stateHandle = mwse::lua::LuaManager::getInstance().getThreadSafeStateHandle();
			sol::object response = stateHandle.triggerEvent(new mwse::lua::event::PlayAnimationGroupEvent(this, animationGroup, triIndex, startFlag, loopCount));
			if (response.get_type() == sol::type::table) {
				sol::table eventData = response;

				// Allow event blocking.
				if (eventData.get_or("block", false)) {
					return;
				}

				// Allow overrides.
				animationGroup = eventData.get_or("group", animationGroup);
				startFlag = eventData.get_or("flags", startFlag);
				loopCount = eventData.get_or("loopCount", loopCount);
			}
		}

		TES3_AnimationData_playAnimationGroupForIndex(this, animationGroup, triIndex, startFlag, loopCount);
	}

	const auto TES3_AnimationData_setHeadNode = reinterpret_cast<void(__thiscall*)(AnimationData*, NI::Node*)>(0x4704B0);
	void AnimationData::setHeadNode(NI::Node* head) {
		TES3_AnimationData_setHeadNode(this, head);
	}

	Reference* AnimationData::getReference() const {
		if (actorNode) {
			return actorNode->getTes3Reference(false);
		}
		return nullptr;
	}

	void AnimationData::playAnimationGroup(int animationGroup, int startFlag, int loopCount) {
		playAnimationGroupForIndex(animationGroup, 0, startFlag, loopCount);
		playAnimationGroupForIndex(animationGroup, 1, startFlag, loopCount);
		playAnimationGroupForIndex(animationGroup, 2, startFlag, loopCount);
	}

	const auto TES3_AnimationData_setLayerKeyframes = reinterpret_cast<bool(__thiscall*)(AnimationData*, KeyframeDefinition*, int, bool)>(0x46BA30);
	const auto TES3_AnimationData_mergeAnimGroups = reinterpret_cast<void(__thiscall*)(AnimationData*, AnimationGroup*, int)>(0x4708D0);

	bool AnimationData::setOverrideLayerKeyframes(KeyframeDefinition* kfData) {
		constexpr int specialLayerIndex = 0;
		bool success = TES3_AnimationData_setLayerKeyframes(this, kfData, specialLayerIndex, true);
		if (success) {
			TES3_AnimationData_mergeAnimGroups(this, kfData->animationGroup, specialLayerIndex);
		}
		return success;
	}

	bool AnimationData::hasOverrideAnimations() const {
		return keyframeLayers[0].lower != nullptr;
	}

	const auto TES3_AnimAttachment_setLayerKeyframes = reinterpret_cast<bool(__thiscall*)(TES3::AnimationData*, TES3::KeyframeDefinition*, int, int)>(0x46BA30);
	const auto TES3_AnimAttachment_mergeAnimGroups = reinterpret_cast<bool(__thiscall*)(TES3::AnimationData*, TES3::AnimationGroup*, int)>(0x4708D0);

	struct OriginalAnimGroups {
		TES3::AnimationGroup* groups[150];
		signed char groupLayers[150];
	};
	static_assert(sizeof(OriginalAnimGroups::groups) == sizeof(AnimationData::animationGroups));
	static_assert(sizeof(OriginalAnimGroups::groupLayers) == sizeof(AnimationData::animGroupLayerIndex));

	// This is horrible but more reliable than other methods.
	static std::map<TES3::AnimationData*, OriginalAnimGroups> originalAnimGroupsCache;

	void AnimationData::setAnimationLayer(TES3::KeyframeDefinition* keyframe, int layerIndex) {
		// Keep a copy of the old anim group data.
		auto& cacheEntry = originalAnimGroupsCache[this];
		std::memcpy(cacheEntry.groups, animationGroups, sizeof(cacheEntry.groups));
		std::memcpy(cacheEntry.groupLayers, animGroupLayerIndex, sizeof(cacheEntry.groupLayers));

		// Set sequence group layer and update animation group pointers.
		TES3_AnimAttachment_setLayerKeyframes(this, keyframe, layerIndex, 1);
		TES3_AnimAttachment_mergeAnimGroups(this, keyframe->animationGroup, layerIndex);
	}

	bool AnimationData::hasSpecialAnimations() const {
		return keyframeLayers[0].lower != nullptr;
	}

	void AnimationData::clearAnimationLayer(int layerIndex) {
		// Restore old anim group data.
		const auto& cacheEntry = originalAnimGroupsCache.find(this);
		if (cacheEntry != originalAnimGroupsCache.end()) {
			std::memcpy(animationGroups, cacheEntry->second.groups, sizeof(animationGroups));
			std::memcpy(animGroupLayerIndex, cacheEntry->second.groupLayers, sizeof(animGroupLayerIndex));
		}

		// Switch out the currently running animation and free NiSequence clones.
		auto& layer = keyframeLayers[layerIndex];
		auto& baseLayer = keyframeLayers[0];
		if (layer.lower) {
			if (currentAnimGroupLayer[0] == layerIndex) {
				manager->deactivateSequence(layer.lower);
				manager->activateSequence(baseLayer.lower);
				currentAnimGroupLayer[0] = 0;
			}
			layer.lower->release();
			layer.lower = nullptr;
		}

		if (layer.upper) {
			if (currentAnimGroupLayer[1] == layerIndex) {
				manager->deactivateSequence(layer.upper);
				manager->activateSequence(baseLayer.upper);
				currentAnimGroupLayer[1] = 0;
			}
			layer.upper->release();
			layer.upper = nullptr;
		}

		if (layer.leftArm) {
			if (currentAnimGroupLayer[2] == layerIndex) {
				manager->deactivateSequence(layer.leftArm);
				manager->activateSequence(baseLayer.leftArm);
				currentAnimGroupLayer[2] = 0;
			}
			layer.leftArm->release();
			layer.leftArm = nullptr;
		}
	}

	std::reference_wrapper<decltype(AnimationData::currentAnimGroup)> AnimationData::getCurrentAnimGroups() {
		return std::ref(currentAnimGroup);
	}

	std::reference_wrapper<decltype(AnimationData::currentNodeIndices)> AnimationData::getCurrentNodeIndices() {
		return std::ref(currentNodeIndices);
	}

	std::reference_wrapper<decltype(AnimationData::loopCounts)> AnimationData::getLoopCounts() {
		return std::ref(loopCounts);
	}

	std::reference_wrapper<decltype(AnimationData::timing)> AnimationData::getTimings() {
		return std::ref(timing);
	}

	std::reference_wrapper<decltype(AnimationData::animationGroups)> AnimationData::getAnimationGroups() {
		return std::ref(animationGroups);
	}

	std::reference_wrapper<decltype(AnimationData::keyframeLayers)> AnimationData::getKeyframeLayers() {
		return std::ref(keyframeLayers);
	}

	std::reference_wrapper<decltype(AnimationData::currentAnimGroupLayer)> AnimationData::getCurrentAnimGroupLayers() {
		return std::ref(currentAnimGroupLayer);
	}

	std::reference_wrapper<decltype(AnimationData::animGroupLayerIndex)> AnimationData::getAnimGroupLayerIndicies() {
		return std::ref(animGroupLayerIndex);
	}

	std::reference_wrapper<decltype(AnimationData::approxRootTravelSpeed)> AnimationData::getApproxRootTravelSpeeds() {
		return std::ref(approxRootTravelSpeed);
	}

	std::reference_wrapper<decltype(AnimationData::currentSoundgenIndices)> AnimationData::getCurrentSoundgenIndices() {
		return std::ref(currentSoundgenIndices);
	}

	std::reference_wrapper<decltype(AnimationData::animationGroupSoundgenCounts)> AnimationData::getAnimationGroupSoundgenCounts() {
		return std::ref(animationGroupSoundgenCounts);
	}

	std::reference_wrapper<decltype(AnimationData::animationGroupSoundgens)> AnimationData::getAnimationGroupSoundgens() {
		return std::ref(animationGroupSoundgens);
	}
}
