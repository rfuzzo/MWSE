#pragma once

#include "LuaManager.h"

#include "TES3HashMap.h"
#include "TES3MagicEffectInstance.h"

namespace mwse {
	namespace lua {
		//
		// TES3::HashMap<K, V>
		//

		template <typename K, typename V>
		struct HashMap_iteratorState {
			TES3::HashMap<K, V>* hash_map;
			typename TES3::HashMap<K, V>::Node* it;
			int index;
			int found;

			HashMap_iteratorState(TES3::HashMap<K, V>* map) {
				hash_map = map;
				index = 0;
				found = 0;
				it = nullptr;
				nextNode<K, V>();
			}

			// Generic nextNode() implementation. This only works if it->nextNode is null when it->nextNode is not valid Node*.
			template <typename K, typename V>
			void nextNode() {
				if (it == nullptr && index >= hash_map->bucketCount) {
					return;
				}
				if (it != nullptr && it->nextNode != nullptr) {
					it = it->nextNode;
					return;
				}
				do {
					it = hash_map->buckets[index];
					++index;
				} while (it == nullptr && index < hash_map->bucketCount);
			}

			// nextNode() implementation for the effects member of MagicSourceInstance. 
			// In this case, only the first node in each bucket is used, it->nextNode is garbage (not null) and hash_map->count tells us how many buckets to check.
			template <>
			void nextNode<char*, TES3::MagicEffectInstance>() {
				if (found >= hash_map->count) {
					it = nullptr;
					return;
				}
				if (it == nullptr && index >= hash_map->bucketCount) {
					return;
				}
				do {
					it = hash_map->buckets[index];
					++index;
				} while (it == nullptr && index < hash_map->bucketCount);
				if (it != nullptr) {
					++found;
				}
			}
		};

		template <typename K, typename V>
		std::tuple<sol::object, sol::object> bindHashMap_pairsIter(sol::user<HashMap_iteratorState<K, V>&> user_state, sol::this_state l) {
			HashMap_iteratorState<K, V>& state = user_state;
			if (state.it == nullptr) {
				return std::make_tuple(sol::object(sol::lua_nil), sol::object(sol::lua_nil));
			}

			auto values = std::make_tuple(sol::object(l, sol::in_place, state.it->key), sol::object(l, sol::in_place, state.it->value));
			state.nextNode<K, V>();
			return values;
		}

		template <typename K, typename V>
		void bindHashMap(const char* name) {
			auto stateHandle = LuaManager::getInstance().getThreadSafeStateHandle();
			sol::state& state = stateHandle.state;

			// Start our usertype. We must finish this with state.set_usertype.
			auto usertypeDefinition = state.create_simple_usertype<TES3::HashMap<K, V>>();
			usertypeDefinition.set("new", sol::no_constructor);

			// Metafunction access.
			usertypeDefinition.set(sol::meta_function::pairs, [](TES3::HashMap<K, V>* self) {
				HashMap_iteratorState<K, V> it_state(self);
				return std::make_tuple(&bindHashMap_pairsIter<K, V>, sol::user<HashMap_iteratorState<K, V>>(std::move(it_state)), sol::lua_nil);
				});

			// Finish up our usertype.
			state.set_usertype(name, usertypeDefinition);
		}

		//
		//
		//

		void bindTES3HashMap();
	}
}
