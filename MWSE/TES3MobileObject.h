#pragma once

#include "TES3Defines.h"

#include "NINode.h"
#include "TES3Object.h"
#include "TES3Vectors.h"

// Must be added to header files that declare types that can be derived.
#define MWSE_SOL_CUSTOMIZED_PUSHER_DECLARE_TES3_MOBILEOBJECT(T) \
int sol_lua_push(sol::types<T>, lua_State* L, const T& obj); \
int sol_lua_push(sol::types<T*>, lua_State* L, const T* obj);

// Must be added to source files that declare types that can be derived.
#define MWSE_SOL_CUSTOMIZED_PUSHER_DEFINE_TES3_MOBILEOBJECT(T) \
int sol_lua_push(sol::types<T>, lua_State* L, const T& obj) { return obj.getOrCreateLuaObject(L).push(L); } \
int sol_lua_push(sol::types<T*>, lua_State* L, const T* obj) { return obj->getOrCreateLuaObject(L).push(L); }

namespace TES3 {
	namespace MobileActorFlag {
		typedef unsigned int value_type;

		enum Flag : value_type {
			ActiveInSimulation = 0x4,
			AffectedByGravity = 0x10,
			CollisionActive = 0x20,
			UsesUnionBV = 0x100,
			Werewolf = 0x400,
			Underwater = 0x800,
			TalkedTo = 0x1000,
			WeaponDrawn = 0x2000,
			SpellReadied = 0x4000,
			InCombat = 0x10000,
			Attacked = 0x20000,
			StuntedMagicka = 0x40000,
			GroundCollision = 0x200000,
			StatsLoaded = 0x4000000,
			IsCrittable = 0x8000000,
			IdleAnim = 0x10000000,
			PCHidden = 0x20000000,
			PCDetected = 0x40000000,
			BodypartsChanged = 0x80000000
		};

		enum FlagBit {
			ActiveInSimulationBit = 2,
			CollisionActiveBit = 5,
			UsesUnionBVBit = 8,
			WerewolfBit = 10,
			UnderwaterBit = 11,
			TalkedToBit = 12,
			WeaponDrawnBit = 13,
			SpellReadiedBit = 14,
			InCombatBit = 16,
			AttackedBit = 17,
			StuntedMagickaBit = 18,
			GroundCollisionBit = 21,
			StatsLoadedBit = 26,
			IsCrittableBit = 27,
			IdleAnimBit = 28,
			PCHiddenBit = 29,
			PCDetectedBit = 30,
			BodypartsChangedBit = 31
		};
	}

	namespace ActorMovement {
		typedef unsigned short value_type;

		enum Flag : value_type {
			Forward = 0x1,
			Back = 0x2,
			Left = 0x4,
			Right = 0x8,
			TurnLeft = 0x10,
			TurnRight = 0x20,
			Walking = 0x100,
			Running = 0x200,
			Sneaking = 0x400,
			Swimming = 0x800,
			Jumping = 0x1000,
			Flying = 0x2000,
			Falling = 0x4000,
			Unknown = 0x8000
		};

		enum FlagBit {
			ForewardBit = 0,
			BackBit = 1,
			LeftBit = 2,
			RightBit = 3,
			TurnLeftBit = 4,
			TurnRightBit = 5,
			WalkingBit = 8,
			RunningBit = 9,
			CrouchingBit = 10,
			SwimmingBit = 11,
			JumpingBit = 12,
			FlyingBit = 13,
			FallingBit = 14
		};
	}

	struct MobileObject_vTable {
		void (__thiscall* destructor)(MobileObject*, char); // 0x0
		void (__thiscall* save)(MobileObject*, GameFile*); // 0x4
		void (__thiscall* physics_8)(MobileObject*, float); // 0x8
		void (__thiscall* physics_C)(MobileObject*); // 0xC
		void (__thiscall* processMovement)(MobileObject*, float); // 0x10
		void (__thiscall* gatherCollisions)(MobileObject*, float); // 0x14
		void (__thiscall* resolveCollisions)(MobileObject*); // 0x18
		void (__thiscall* updateVisuals)(MobileObject*); // 0x1C
		void (__thiscall* simulate)(MobileObject*); // 0x20
		bool (__thiscall* isActor)(const MobileObject*); // 0x24
		void (__thiscall* handleMovementCollision)(MobileObject*, bool); // 0x28
		void (__thiscall* setUseAirPhysicsFlag)(MobileObject*); // 0x2C
		void (__thiscall* clearUseAirPhysicsFlag)(MobileObject*); // 0x30
		void (__thiscall* setCollisionActive)(MobileObject*); // 0x34
		void (__thiscall* clearCollisionActive)(MobileObject*); // 0x38
		void (__thiscall* setupCollision)(MobileObject*); // 0x3C
		void (__thiscall* setPosition)(MobileObject*, Vector3*); // 0x40
		void (__thiscall* setFacing)(MobileObject*, float); // 0x44
		Matrix33* (__thiscall* getOrientation)(MobileObject*, Matrix33*); // 0x48
		void (__thiscall* setReference)(MobileObject*); // 0x4C
		void (__thiscall* jumpingFalling)(MobileObject*, bool); // 0x50
		void (__thiscall* setSlopeSliding)(MobileObject*, bool); // 0x54
		void (__thiscall* setCrouching)(MobileObject*, bool); // 0x58
		void (__thiscall* setWalking)(MobileObject*, bool); // 0x5C
		void (__thiscall* setRunning)(MobileObject*, bool); // 0x60
		void (__thiscall* setJumping)(MobileObject*, bool); // 0x64
		void (__thiscall* setLevitating)(MobileObject*, bool); // 0x68
		void (__thiscall* waterImpact)(MobileObject*, bool); // 0x6C
		void (__thiscall* enterLeaveSimulation)(MobileObject*, bool); // 0x70
		void (__thiscall* setActorFlag8)(MobileObject*, bool); // 0x74
		void (__thiscall* setActorFlag40)(MobileObject*, bool); // 0x78
		bool (__thiscall* findDropPointOnCollider)(MobileObject*, float, NI::AVObject*, float*, Vector3*); // 0x7C
		bool (__thiscall* onActorCollision)(MobileProjectile*, int); // 0x80
		bool (__thiscall* onObjectCollision)(MobileProjectile*, int, bool); // 0x84
		bool (__thiscall* onTerrainCollision)(MobileProjectile*, int); // 0x88
		bool (__thiscall* onWaterCollision)(MobileProjectile*, int); // 0x8C
		bool (__thiscall* onActivatorCollision)(MobileProjectile*, int); // 0x90
		void (__thiscall* createSceneLight)(MobileObject*); // 0x94
	};
	static_assert(sizeof(MobileObject_vTable) == 0x98, "TES3::MobileObject_vTable failed size validation");

	struct MobileActor_vTable : MobileObject_vTable {
		void (__thiscall* initializeStats)(MobileActor*, void*); // 0x98
		void (__thiscall* getDispositionRaw)(MobileActor*); // 0x9C
		void (__thiscall* calculateNPCWidth)(MobileActor*); // 0xA0
		void (__thiscall* calculateNPCHeight)(MobileActor*); // 0xA4
		void (__thiscall* decideActionAI)(MobileActor*); // 0xA8
		bool (__thiscall* is3rdPerson)(MobileActor*); // 0xAC
		void (__thiscall* changeWerewolf)(MobileActor*, bool); // 0xB0
		void (__thiscall* calculateWalkSpeed)(MobileActor*); // 0xB4
		void (__thiscall* onDeath)(MobileActor*); // 0xB8
		int (__thiscall* getWeaponAttackMin)(MobileActor*); // 0xBC
		int (__thiscall* getWeaponAttackMax)(MobileActor*); // 0xC0
		void (__thiscall* calculateWeaponDamage)(MobileActor*); // 0xC4
		float (__thiscall* getWeaponSwingWeightProduct)(MobileActor*); // 0xC8
		AnimationData* (__thiscall* getAnimationAttachment)(const MobileActor*); // 0xCC
		SkillStatistic * (__thiscall* getSkillStatistic)(MobileActor*, int); // 0xD0
		float (__thiscall* getSkillValue)(const MobileActor*, int); // 0xD4
		void (__thiscall* getVampire)(MobileActor*);
		void (__thiscall* setVampire)(MobileActor*);
		float (__thiscall* applyArmorRating)(MobileActor*, float, float, bool); // 0xE0
		float (__thiscall* calculateArmorRating)(const MobileActor*, int*); // 0xE4
		float (__thiscall* getReadiedWeaponCurrentSkill)(MobileActor*); // 0xE8
		unsigned char (__thiscall* getReadiedWeaponAnimationGroup)(MobileActor*); // 0xEC
		void (__thiscall* onWeaponEquip)(MobileActor*); // 0xF0
		void (__thiscall* onReleaseProjectile)(MobileActor*); // 0xF4
		void (__thiscall* onNewProjectile)(MobileActor*); // 0xF8
		void (__thiscall* resolveArrowBone)(MobileActor*); // 0xFC
		void (__thiscall* setArrowBone)(MobileActor*, NI::Node*); // 0x100
		bool (__thiscall* dropObjectRayTests)(MobileActor*, float, NI::Node*, float*, Vector3*, unsigned char*); // 0x104
	};
	static_assert(sizeof(MobileActor_vTable) == 0x108, "TES3::MobileActor_vTable failed size validation");

	struct MobileNPC_vTable : MobileActor_vTable {
		void (__thiscall* unpackSkillValues)(MobileNPC*, int*); // 0x108
		int (__thiscall* getDisposition)(MobileNPC*); // 0x10C
	};
	static_assert(sizeof(MobileNPC_vTable) == 0x110, "TES3::MobileNPC_vTable failed size validation");

	struct MobileObject {
		struct Collision {
			enum class CollisionType : unsigned char {
				Actor = 0,
				Static = 1,
				Terrain = 2,
				Water = 3,
				Activator = 4,
				Static_AvoidNode = 5,
				None = 6,
			};

			bool valid; // 0x0
			float time; // 0x4
			TES3::Vector3 point; // 0x8
			TES3::Vector3 objectPosAtCollision; // 0x14
			TES3::Vector3 velocity; // 0x20
			NI::Pointer<NI::Node> colliderRoot; // 0x2C
			TES3::Reference * colliderRef; // 0x30
			NI::Pointer<NI::Node> node_34; // 0x34
			short quantizedNormal[3]; // 0x38
			CollisionType collisionType; // 0x3E
			unsigned char processingState; // 0x3F

			//
			//
			//

			static constexpr float QUANTIZER = 1.0f / 32767.0f;

			Vector3 getNormal() const;

			void clone(Collision* from);

		};

		struct LightData {
			NI::PointLight * light; // 0x0
			float radius; // 0x4
			float unknown_0x8;
		};

		union {
			MobileObject_vTable * mobileObject;
			MobileActor_vTable * mobileActor;
			MobileNPC_vTable * mobileNPC;
		} vTable; // 0x0
		ObjectType::ObjectType objectType; // 0x4
		ActorMovement::value_type movementFlags; // 0x8
		ActorMovement::value_type prevMovementFlags; // 0xA
		short unknown_0xC;
		short unknown_0xE; // Undefined.
		MobileActorFlag::value_type actorFlags; // 0x10
		Reference * reference; // 0x14
		Collision * arrayCollisionResults; // 0x18 // Exactly 30 elements.
		short cellX; // 0x1C
		short cellY; // 0x1E
		short collisionSubCellX; // 0x20
		short collisionSubCellY; // 0x22
		short collision_related_0x24;
		short unknown_0x26;
		float collisionDeltaTime; // 0x28
		float height; // 0x2C
		Vector2 boundSize; // 0x30
		float simulationDistance; // 0x38
		Vector3 velocity; // 0x3C
		Vector3 impulseVelocity; // 0x48
		Vector3 positionAtLastLightUpdate; // 0x54
		NI::CollisionGroup * collisionGroup; // 0x60
		float thisFrameDistanceMoved; // 0x64
		Vector3 thisFrameDeltaPosition; // 0x68
		float lastCollidePointZ; // 0x74
		LightData * lightMagicEffectData; // 0x78
		unsigned char countCollisionResults; // 0x7C

		MobileObject() = delete;
		~MobileObject() = delete;

		//
		// vTable accessor functions.
		//

		void setFacing(float facingInRadians);

		bool onActorCollision(int collisionIndex);
		bool onObjectCollision(int collisionIndex, bool flag);
		bool onTerrainCollision(int collisionIndex);
		bool onWaterCollision(int collisionIndex);
		bool onActivatorCollision(int collisionIndex);

		bool isActor() const;

		// Enters/leaves the simulation state and executes related cleanup/initialization logic.
		// If executed on a MobileActor the reference must not be disabled before calling this function, as it blocks execution.
		void enterLeaveSimulation(bool entering);

		//
		// Other related this-call functions.
		//

		void setFootPoint(const Vector3* point);
		void setInstantVelocity(const Vector3* velocity);
		void updateConstantVelocity(const Vector3* velocity);
		void resetCollisionGroup();
		void enterLeaveSimulationByDistance();
		IteratedList<ItemStack*>* getInventory() const;
		bool getBasePositionIsUnderwater() const;

		//
		// Lua interface functions.
		//

		Vector3 getBoundSize() const;
		void setBoundSize(const Vector3&);
		Vector3* getImpulseVelocity();
		void setImpulseVelocityFromLua(sol::stack_object);
		Vector3* getPosition();
		void setPositionFromLua(sol::stack_object);
		Vector3* getVelocity();
		void setVelocityFromLua(sol::stack_object);

		bool getMobileObjectFlag(MobileActorFlag::Flag flag) const;
		void setMobileObjectFlag(MobileActorFlag::Flag flag, bool set);
		bool getAffectedByGravityFlag() const;
		void setAffectedByGravityFlag(bool value);
		bool getMovementCollisionFlag() const;
		void setMovementCollisionFlag(bool value);
		sol::table getCollisions_lua(sol::this_state ts) const;

		// Storage for cached userdata.
		sol::object getOrCreateLuaObject(lua_State* L) const;
		static void clearCachedLuaObject(const MobileObject* object);
		static void clearCachedLuaObjects();

	};
	static_assert(sizeof(MobileObject) == 0x80, "TES3::MobileObject failed size validation");
	static_assert(sizeof(MobileObject::Collision) == 0x40, "TES3::MobileObject::Collision failed size validation");
	static_assert(sizeof(MobileObject::LightData) == 0xC, "TES3::MobileObject::LightData failed size validation");
}

MWSE_SOL_CUSTOMIZED_PUSHER_DECLARE_TES3_MOBILEOBJECT(TES3::MobileObject)
