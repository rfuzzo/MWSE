#include "LuaObject.h"

namespace mwse::lua {
	std::unique_ptr<ObjectCreatorBase> makeObjectCreator(TES3::ObjectType::ObjectType objectType) {
		switch (objectType) {
		case TES3::ObjectType::Activator:
			return std::make_unique<ObjectCreator<TES3::Activator>>();
		case TES3::ObjectType::Alchemy:
			return std::make_unique<ObjectCreator<TES3::Alchemy>>();
		case TES3::ObjectType::Ammo:
			return std::make_unique<ObjectCreator<TES3::Weapon>>();
		case TES3::ObjectType::Armor:
			return std::make_unique<ObjectCreator<TES3::Armor>>();
		case TES3::ObjectType::Book:
			return std::make_unique<ObjectCreator<TES3::Book>>();
		case TES3::ObjectType::Clothing:
			return std::make_unique<ObjectCreator<TES3::Clothing>>();
		case TES3::ObjectType::Container:
			return std::make_unique<ObjectCreator<TES3::Container>>();
		case TES3::ObjectType::Enchantment:
			return std::make_unique<ObjectCreator<TES3::Enchantment>>();
		case TES3::ObjectType::Light:
			return std::make_unique<ObjectCreator<TES3::Light>>();
		case TES3::ObjectType::Misc:
			return std::make_unique<ObjectCreator<TES3::Misc>>();
		case TES3::ObjectType::Sound:
			return std::make_unique<ObjectCreator<TES3::Sound>>();
		case TES3::ObjectType::Spell:
			return std::make_unique<ObjectCreator<TES3::Spell>>();
		case TES3::ObjectType::Static:
			return std::make_unique<ObjectCreator<TES3::Static>>();
		case TES3::ObjectType::Weapon:
			return std::make_unique<ObjectCreator<TES3::Weapon>>();
		default:
			return std::make_unique<InvalidObjectCreator>();
		}
	}
}