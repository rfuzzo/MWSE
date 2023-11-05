#pragma once

#include "TES3Defines.h"
#include "TES3Vectors.h"

#include "NIDefines.h"
#include "NIPointer.h"

namespace TES3 {
	struct AnimationData {
		struct SequenceGroup {
			NI::Sequence* lower;
			NI::Sequence* upper;
			NI::Sequence* leftArm;

			SequenceGroup() = delete;
			~SequenceGroup() = delete;
		};
		static_assert(sizeof(SequenceGroup) == 0xC, "TES3::AnimationAttachment::SequenceGroup failed size validation");

		struct SoundGenKey {
			int startFrame;
			float startTime;
			unsigned char volume;
			float pitch;
			Sound* sound;

			SoundGenKey() = delete;
			~SoundGenKey() = delete;
		};
		static_assert(sizeof(SoundGenKey) == 0x14, "TES3::AnimationAttachment::SoundGenKey failed size validation");

		NI::Node * actorNode; // 0x0
		NI::Node * modelRootNode; // 0x4
		TES3::Vector3 positionDeltaModelRoot; // 0x8
		NI::Node * spine1Node; // 0x14
		NI::Node * spine2Node; // 0x18
		float spineAngle; // 0x1C
		NI::Node * headNode; // 0x20
		float headLookTargetAngleX; // 0x24
		float headLookTargetAngleZ; // 0x28
		float headLookAngleX; // 0x2C
		float headLookAngleZ; // 0x30
		float headLookClosestDistance; // 0x34
		unsigned char currentAnimGroup[3]; // 0x38
		int currentNodeIndices[3]; // 0x3C
		int loopCounts[3]; // 0x48
		unsigned int flags; // 0x54
		float timing[3]; // 0x58
		float deltaTime; // 0x5C
		AnimationGroup * animationGroups[150]; // 0x68
		NI::KeyframeManager * manager; // 0x2C0
		SequenceGroup keyframeLayers[3]; // 0x2C4
		NI::Geometry* headGeometry; // 0x2E8
		float lipsyncLevel; // 0x2EC
		float timeToNextBlink; // 0x2F0
		float headMorphTiming; // 0x2F4
		float talkMorphStartTime; // 0x2F8
		float talkMorphEndTime; // 0x2FC
		float blinkMorphStartTime; // 0x300
		float blinkMorphEndTime; // 0x304
		int currentAnimGroupLayer[3];
		signed char animGroupLayerIndex[150]; // 0x314
		short approxRootTravelSpeed[150]; // 0x3AA
		unsigned short patchedCastSpeed; // 0x4D6 (8.8 fixed point format)
		float movementSpeed; // 0x4D8
		float weaponSpeed; // 0x4DC
		int currentSoundgenIndices[3]; // 0x4E0
		unsigned char animationGroupSoundgenCounts[150]; // 0x4EC
		SoundGenKey** animationGroupSoundgens[150]; // 0x584
		unsigned char nextAnimGroup; // 0x7DC
		int nextLoopCounts; // 0x7E0

		AnimationData() = delete;
		~AnimationData() = delete;

		//
		// Other related this-call functions.
		//

		AnimationData* ctor();

		void playAnimationGroupForIndex(int animationGroup, int triIndex, int startFlag = 0, int loopCount = -1);
		void setHeadNode(NI::Node* head);

		//
		// Custom functions.
		//

		Reference* getReference() const;

		void playAnimationGroup(int animationGroup, int startFlag = 0, int loopCount = -1);
		bool setOverrideLayerKeyframes(KeyframeDefinition* animData);
		bool hasOverrideAnimations() const;

		float AnimationData::getCastSpeed() const;
		void AnimationData::setCastSpeed(float speed);

		std::reference_wrapper<decltype(currentAnimGroup)> getCurrentAnimGroups();
		std::reference_wrapper<decltype(currentNodeIndices)> getCurrentNodeIndices();
		std::reference_wrapper<decltype(loopCounts)> getLoopCounts();
		std::reference_wrapper<decltype(timing)> getTimings();
		std::reference_wrapper<decltype(animationGroups)> getAnimationGroups();
		std::reference_wrapper<decltype(keyframeLayers)> getKeyframeLayers();
		std::reference_wrapper<decltype(currentAnimGroupLayer)> getCurrentAnimGroupLayers();
		std::reference_wrapper<decltype(animGroupLayerIndex)> getAnimGroupLayerIndicies();
		std::reference_wrapper<decltype(approxRootTravelSpeed)> getApproxRootTravelSpeeds();
		std::reference_wrapper<decltype(currentSoundgenIndices)> getCurrentSoundgenIndices();
		std::reference_wrapper<decltype(animationGroupSoundgenCounts)> getAnimationGroupSoundgenCounts();
		std::reference_wrapper<decltype(animationGroupSoundgens)> getAnimationGroupSoundgens();

	};
	static_assert(sizeof(AnimationData) == 0x7E4, "TES3::AnimationData failed size validation");
}
