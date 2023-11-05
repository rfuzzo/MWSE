#pragma once

#include "LuaUtil.h"
#include "TES3Util.h"

#include "TES3Activator.h"
#include "TES3Alchemy.h"
#include "TES3Container.h"
#include "TES3Misc.h"
#include "TES3Sound.h"
#include "TES3Spell.h"
#include "TES3Static.h"
#include "TES3Enchantment.h"
#include "TES3Weapon.h"
#include "TES3Book.h"
#include "TES3WorldController.h"

#include "LuaManager.h"

#include "LuaSpellCreatedEvent.h"

namespace mwse::lua {

	class ObjectCreatorBase {
	public:
		virtual TES3::BaseObject* create(sol::table, bool) const = 0;
	};

	template<typename ObjectType>
	class ObjectCreator : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table, bool) const override {
			throw std::runtime_error{ "tes3.createObject: Cannot create an object of that type." };
		}
	};

	using InvalidObjectCreator = ObjectCreator<void>;

	template<>
	class ObjectCreator<TES3::Activator> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});

			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->resolveObject(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Activator) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not an activator." };
				}
			}

			std::string name = getOptionalParam<std::string>(params, "name", "Activator");
			if (name.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'name' parameter must be less than 32 character long." };
			}

			auto mesh = getOptionalParam<std::string>(params, "mesh", {});
			if (mesh.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'mesh' parameter must be less than 32 character long." };
			}

			auto activator = new TES3::Activator();

			activator->setID(id.c_str());
			activator->setName(name.c_str());
			activator->setModelPath(mesh.c_str());

			auto script = getOptionalParamScript(params, "script");

			if (script != nullptr) {
				activator->script = script;
			}

			activator->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", 0);

			activator->objectFlags |= TES3::ObjectFlag::Modified;
			activator->objectFlags |= TES3::ObjectFlag::LinksResolved;

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(activator)) {
				delete activator;
				activator = nullptr;
				throw std::runtime_error("tes3.createObject: could not add the newly created activator to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(activator);
			}

			return activator;
		}
	};

	template<>
	class ObjectCreator<TES3::Alchemy> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});

			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->resolveObject(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Alchemy) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not an alchemy item." };
				}
			}

			std::string name = getOptionalParam<std::string>(params, "name", {});
			if (name.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'name' parameter must be less than 32 character long." };
			}

			std::string mesh = getOptionalParam<std::string>(params, "mesh", "m\\Misc_Potion_Bargain_01.nif");
			if (mesh.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'mesh' parameter must be less than 32 character long." };
			}

			std::string icon = getOptionalParam<std::string>(params, "icon", "m\\Tx_potion_bargain_01.tga");
			if (icon.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'icon' parameter must be less than 32 character long." };
			}

			auto alchemy = new TES3::Alchemy();
			alchemy->setID(id.c_str());
			alchemy->setName(name.c_str());
			alchemy->setModelPath(mesh.c_str());
			alchemy->setIconPath(icon.c_str());
			alchemy->setAutoCalc(getOptionalParam<bool>(params, "autoCalc", alchemy->getAutoCalc()));
			alchemy->script = getOptionalParamScript(params, "script");
			alchemy->flags = getOptionalParam<unsigned short>(params, "flags", 0u);
			alchemy->weight = getOptionalParam<float>(params, "weight", 0.0f);
			alchemy->value = getOptionalParam<unsigned short>(params, "value", 0u);
			alchemy->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", 0u);
			alchemy->objectFlags |= TES3::ObjectFlag::Modified;
			alchemy->objectFlags |= TES3::ObjectFlag::LinksResolved;

			// Set the first effect just so that there is something? TODO: Why?
			tes3::setEffect(alchemy->effects, 1, TES3::EffectID::WaterBreathing, TES3::SkillID::Invalid, int(TES3::EffectRange::Self), 0, 1, 0, 0);

			auto maybeEffects = getOptionalParam<sol::table>(params, "effects");
			if (maybeEffects) {
				auto& effects = maybeEffects.value();
				for (auto i = 0; i < 8; ++i) {
					sol::optional<sol::table> maybeEffect = effects[i + 1];
					if (maybeEffect) {
						alchemy->effects[i] = maybeEffect.value();
					}
				}
			}

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(alchemy)) {
				delete alchemy;
				alchemy = nullptr;
				throw std::runtime_error("tes3.createObject: Could not add the newly created alchemy item to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(alchemy);
			}

			return alchemy;
		}
	};

	template<>
	class ObjectCreator<TES3::Armor> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});
			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->resolveObject(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Armor) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not an armor item." };
				}
			}

			std::string name = getOptionalParam<std::string>(params, "name", "Armor");
			if (name.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'name' parameter must be less than 32 character long." };
			}

			std::string mesh = getOptionalParam<std::string>(params, "mesh", {});
			if (mesh.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'mesh' parameter must be less than 32 character long." };
			}

			auto armor = new TES3::Armor();

			armor->setID(id.c_str());
			armor->setName(name.c_str());
			armor->setModelPath(mesh.c_str());

			auto script = getOptionalParamScript(params, "script");
			if (script != nullptr) {
				armor->script = script;
			}

			auto enchantment = getOptionalParamObject<TES3::Enchantment>(params, "enchantment");
			if (enchantment && enchantment->objectType == TES3::ObjectType::Enchantment) {
				armor->enchantment = enchantment;
			}

			std::string icon = getOptionalParam<std::string>(params, "icon", {});
			if (!icon.empty() && icon.size() < 31) {
				armor->setIconPath(icon.c_str());
			}

			armor->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", 0);
			armor->weight = getOptionalParam<float>(params, "weight", 1.0f);
			armor->value = getOptionalParam<int>(params, "value", 1);
			armor->slot = getOptionalParam<unsigned int>(params, "slot", TES3::ArmorSlot::Cuirass);
			armor->maxCondition = getOptionalParam<unsigned short>(params, "maxCondition", 100);
			armor->armorRating = getOptionalParam<int>(params, "armorRating", 0);
			armor->enchantCapacity = getOptionalParam<unsigned short>(params, "enchantCapacity", 100);

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(armor)) {
				delete armor;
				armor = nullptr;
				throw std::runtime_error("tes3.createObject: could not add the newly created armor to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(armor);
			}

			return armor;
		}
	};

	template<>
	class ObjectCreator<TES3::Book> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});
			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->resolveObject(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Book) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not a book." };
				}
			}

			std::string name = getOptionalParam<std::string>(params, "name", "Book");
			if (name.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'name' parameter must be less than 32 character long." };
			}

			std::string mesh = getOptionalParam<std::string>(params, "mesh", {});
			if (mesh.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'mesh' parameter must be less than 32 character long." };
			}

			std::string icon = getOptionalParam<std::string>(params, "icon", {});
			if (icon.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'icon' parameter must be less than 32 character long." };
			}

			auto book = new TES3::Book();

			book->setID(id.c_str());
			book->setName(name.c_str());
			book->setModelPath(mesh.c_str());
			book->setIconPath(icon.c_str());

			auto script = getOptionalParamScript(params, "script");
			if (script != nullptr) {
				book->script = script;
			}

			auto enchantment = getOptionalParamObject<TES3::Enchantment>(params, "enchantment");
			auto enchantCapacity = getOptionalParam<unsigned short>(params, "enchantCapacity", 0);
			auto bookType = getOptionalParam<TES3::BookType>(params, "type", TES3::BookType::Book);
			if (enchantment && enchantment->objectType == TES3::ObjectType::Enchantment) {
				book->enchantment = enchantment;
			}
			else if (enchantCapacity > 0 && bookType == TES3::BookType::Scroll) {
				// Prevent creation of books that the player could enchant.
				// The game crashes if trying to enchant books that aren't from an esp/esm plugin.
				delete book;
				book = nullptr;
				throw std::invalid_argument{ "tes3.createObject: 'enchantCapacity' parameter must be zero if creating an unenchanted scroll (the game will crash if player tries to enchant it)." };
			}

			// The LinksResolved flag is set by the vanilla book create function, don't overwrite it.
			book->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", book->objectFlags);

			book->weight = getOptionalParam<float>(params, "weight", 0.0f);
			book->value = getOptionalParam<int>(params, "value", 0);
			book->bookType = bookType;
			book->skillToRaise = getOptionalParam<signed char>(params, "skill", -1);
			book->enchantCapacity = enchantCapacity;

			book->objectFlags |= TES3::ObjectFlag::Modified;
			book->objectFlags |= TES3::ObjectFlag::LinksResolved;

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(book)) {
				delete book;
				book = nullptr;
				throw std::runtime_error("tes3.createObject: could not add the newly created book to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(book);
			}

			return book;
		}
	};

	template<>
	class ObjectCreator<TES3::Clothing> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});
			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->resolveObject(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Clothing) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not a clothing item." };
				}
			}

			std::string name = getOptionalParam<std::string>(params, "name", "Clothing");
			if (name.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'name' parameter must be less than 32 character long." };
			}

			std::string mesh = getOptionalParam<std::string>(params, "mesh", {});
			if (mesh.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'mesh' parameter must be less than 32 character long." };
			}

			auto clothing = new TES3::Clothing();

			clothing->setID(id.c_str());
			clothing->setName(name.c_str());
			clothing->setModelPath(mesh.c_str());

			auto script = getOptionalParamScript(params, "script");
			if (script != nullptr) {
				clothing->script = script;
			}

			auto enchantment = getOptionalParamObject<TES3::Enchantment>(params, "enchantment");
			if (enchantment && enchantment->objectType == TES3::ObjectType::Enchantment) {
				clothing->enchantment = enchantment;
			}

			std::string icon = getOptionalParam<std::string>(params, "icon", {});
			if (!icon.empty() && icon.size() < 31) {
				clothing->setIconPath(icon.c_str());
			}

			clothing->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", 0);
			clothing->weight = getOptionalParam<float>(params, "weight", 1.0f);
			clothing->value = getOptionalParam<int>(params, "value", 1);
			clothing->slot = getOptionalParam<unsigned int>(params, "slot", TES3::ClothingSlot::Robe);
			clothing->enchantCapacity = getOptionalParam<unsigned short>(params, "enchantCapacity", 100);

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(clothing)) {
				delete clothing;
				clothing = nullptr;
				throw std::runtime_error("tes3.createObject: could not add the newly created clothing to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(clothing);
			}

			return clothing;
		}
	};

	template<>
	class ObjectCreator<TES3::Enchantment> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});

			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->resolveObject(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Enchantment) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not an enchantment." };
				}
			}

			auto castType = getOptionalParam(params, "castType", TES3::EnchantmentCastType::Invalid);
			if (castType >= TES3::EnchantmentCastType::Invalid) {
				throw std::invalid_argument{ "tes3.createObject: 'castType' parameter as an incorrect value. Use values in tes3.enchantmentType" };
			}

			unsigned short chargeCost = getOptionalParam<unsigned short>(params, "chargeCost", 0);
			if (castType != TES3::EnchantmentCastType::Constant && chargeCost == 0) {
				throw std::invalid_argument{ "tes3.createObject: 'chargeCost' parameter must be greater than 0." };
			}

			unsigned short maxCharge = getOptionalParam<unsigned short>(params, "maxCharge", 0);
			if (castType != TES3::EnchantmentCastType::Constant && maxCharge == 0) {
				throw std::invalid_argument{ "tes3.createObject: 'maxCharge' parameter must be greater than 0." };
			}

			auto enchantment = new TES3::Enchantment();

			enchantment->setID(id.c_str());
			enchantment->castType = castType;
			enchantment->chargeCost = chargeCost;
			enchantment->maxCharge = maxCharge;
			enchantment->flags = getOptionalParam<unsigned int>(params, "flags", 0);
			enchantment->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", 0);
			enchantment->objectFlags |= TES3::ObjectFlag::Modified;
			enchantment->objectFlags |= TES3::ObjectFlag::LinksResolved;

			auto maybeEffects = getOptionalParam<sol::table>(params, "effects");
			if (maybeEffects) {
				auto& effects = maybeEffects.value();
				for (auto i = 0; i < 8; ++i) {
					sol::optional<sol::table> maybeEffect = effects[i + 1];
					if (maybeEffect) {
						enchantment->effects[i] = maybeEffect.value();
					}
				}
			}

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(enchantment)) {
				delete enchantment;
				enchantment = nullptr;
				throw std::runtime_error("tes3.createObject: could not add the newly created enchantment to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(enchantment);
			}

			return enchantment;
		}
	};

	template<>
	class ObjectCreator<TES3::Container> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});

			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->resolveObject(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Container) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not a container." };
				}
			}

			std::string name = getOptionalParam<std::string>(params, "name", "Container");
			if (name.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'name' parameter must be less than 32 character long." };
			}

			std::string mesh = getOptionalParam<std::string>(params, "mesh", {});
			if (mesh.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'mesh' parameter must be less than 32 character long." };
			}

			auto container = new TES3::Container();

			container->setID(id.c_str());
			container->setName(name.c_str());
			container->setModelPath(mesh.c_str());

			auto script = getOptionalParamScript(params, "script");
			if (script != nullptr) {
				container->script = script;
			}

			container->capacity = getOptionalParam(params, "capacity", 0.0f);
			container->objectFlags = getOptionalParam(params, "objectFlags", 0u);
			container->setIsOrganic(getOptionalParam(params, "isOrganic", container->getIsOrganic()));
			container->setRespawns(getOptionalParam(params, "respawns", container->getRespawns()));
			container->actorFlags = getOptionalParam(params, "actorFlags", 0u);
			container->objectFlags |= TES3::ObjectFlag::Modified;
			container->objectFlags |= TES3::ObjectFlag::LinksResolved;

			// Ensure is base actor.
			container->actorFlags |= TES3::ActorFlag::IsBase;

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(container)) {
				delete container;
				container = nullptr;
				throw std::runtime_error("tes3.createObject: could not add the newly created container to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(container);
			}

			return container;
		}
	};

	template<>
	class ObjectCreator<TES3::Misc> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});

			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->resolveObject(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Misc) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not a misc. item." };
				}
			}

			std::string name = getOptionalParam<std::string>(params, "name", "Miscellaneous item");
			if (name.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'name' parameter must be less than 32 character long." };
			}

			std::string mesh = getOptionalParam<std::string>(params, "mesh", {});
			if (mesh.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'mesh' parameter must be less than 32 character long." };
			}

			auto miscItem = new TES3::Misc();

			miscItem->setID(id.c_str());
			miscItem->setName(name.c_str());
			miscItem->setModelPath(mesh.c_str());

			auto script = getOptionalParamScript(params, "script");

			if (script != nullptr) {
				miscItem->script = script;
			}

			std::string icon = getOptionalParam<std::string>(params, "icon", {});

			if (!icon.empty() && icon.size() < 31) {
				tes3::setDataString(&miscItem->icon, icon.c_str());
			}

			miscItem->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", 0);
			miscItem->weight = getOptionalParam<float>(params, "weight", 0.0f);
			miscItem->value = getOptionalParam<int>(params, "value", 0);
			miscItem->flags = getOptionalParam<unsigned int>(params, "flags", 0);

			miscItem->objectFlags |= TES3::ObjectFlag::Modified;
			miscItem->objectFlags |= TES3::ObjectFlag::LinksResolved;

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(miscItem)) {
				delete miscItem;
				miscItem = nullptr;
				throw std::runtime_error("tes3.createObject: could not add the newly created misc item to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(miscItem);
			}

			return miscItem;
		}
	};

	template<>
	class ObjectCreator<TES3::Sound> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});

			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->findSound(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Sound) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not a sound." };
				}
			}

			std::string filename = getOptionalParam<std::string>(params, "filename", {});
			if (filename.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'filename' parameter must be less than 32 character long." };
			}

			auto soundObject = new TES3::Sound();
			soundObject->setObjectID(id.c_str());
			soundObject->setFilename(filename.c_str());
			soundObject->setVolume(getOptionalParam<float>(params, "volume", 1.0f));
			soundObject->setMinDistance_lua(getOptionalParam<double>(params, "minDistance", 0.0));
			soundObject->setMaxDistance_lua(getOptionalParam<double>(params, "maxDistance", 0.0));

			soundObject->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", 0);
			soundObject->objectFlags |= TES3::ObjectFlag::Modified;
			soundObject->objectFlags |= TES3::ObjectFlag::LinksResolved;

			if (!TES3::DataHandler::get()->nonDynamicData->addSound(soundObject)) {
				delete soundObject;
				soundObject = nullptr;
				throw std::runtime_error("tes3.createObject: Could not add the newly created sound to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(soundObject);
			}

			return soundObject;
		}
	};

	template<>
	class ObjectCreator<TES3::Spell> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});

			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->getSpellById(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Spell) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not a spell." };
				}
			}

			std::string name = getOptionalParam<std::string>(params, "name", {});
			if (name.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'name' parameter must be less than 32 character long." };
			}

			auto spell = new TES3::Spell();
			spell->setID(id.c_str());
			spell->setName(name.c_str());
			spell->magickaCost = getOptionalParam<unsigned short>(params, "magickaCost", 1);
			spell->castType = getOptionalParam<unsigned char>(params, "castType", TES3::SpellCastType::Spell);
			spell->spellFlags = getOptionalParam<unsigned int>(params, "flags", spell->spellFlags);
			spell->setAlwaysSucceeds(getOptionalParam<bool>(params, "alwaysSucceeds", spell->getAlwaysSucceeds()));
			spell->setAutoCalc(getOptionalParam<bool>(params, "autoCalc", spell->getAutoCalc()));
			spell->setPlayerStart(getOptionalParam<bool>(params, "playerStart", spell->getPlayerStart()));
			spell->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", 0u);
			spell->objectFlags |= TES3::ObjectFlag::Modified;
			spell->objectFlags |= TES3::ObjectFlag::LinksResolved;

			// Set the first effect just so that there is something? TODO: Why?
			tes3::setEffect(spell->effects, 1, TES3::EffectID::WaterBreathing, TES3::SkillID::Invalid, int(TES3::EffectRange::Self), 0, 1, 0, 0);

			auto maybeEffects = getOptionalParam<sol::table>(params, "effects");
			if (maybeEffects) {
				auto& effects = maybeEffects.value();
				for (auto i = 0; i < 8; ++i) {
					sol::optional<sol::table> maybeEffect = effects[i + 1];
					if (maybeEffect) {
						spell->effects[i] = maybeEffect.value();
					}
				}
			}

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(spell)) {
				delete spell;
				spell = nullptr;
				throw std::runtime_error("tes3.createObject: Could not add the newly created spell to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(spell);
			}

			// Fire off spell created event.
			if (event::SpellCreatedEvent::getEventEnabled()) {
				LuaManager::getInstance().getThreadSafeStateHandle().triggerEvent(new event::SpellCreatedEvent(spell, "script"));
			}

			return spell;
		}
	};

	template<>
	class ObjectCreator<TES3::Static> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});

			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->resolveObject(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == TES3::ObjectType::Static) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not a static object." };
				}
			}

			std::string mesh = getOptionalParam<std::string>(params, "mesh", {});
			if (mesh.size() > 31)
				throw std::invalid_argument{ "tes3.createObject: 'mesh' parameter must be less than 32 character long." };

			auto staticObject = new TES3::Static();

			staticObject->setID(id.c_str());
			staticObject->setModelPath(mesh.c_str());

			staticObject->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", 0);

			staticObject->objectFlags |= TES3::ObjectFlag::Modified;
			staticObject->objectFlags |= TES3::ObjectFlag::LinksResolved;

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(staticObject)) {
				delete staticObject;
				staticObject = nullptr;
				throw std::runtime_error("tes3.createObject: could not add the newly created static to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(staticObject);
			}

			return staticObject;
		}
	};

	template<>
	class ObjectCreator<TES3::Weapon> : public ObjectCreatorBase {
	public:
		TES3::BaseObject* create(sol::table params, bool getIfExists) const override {
			std::string id = getOptionalParam<std::string>(params, "id", {});
			auto objectType = getOptionalParam<unsigned int>(params, "objectType", TES3::ObjectType::Invalid);
			if (id.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'id' parameter must be less than 32 character long." };
			}
			else if (!id.empty()) {
				if (auto existingObject = TES3::DataHandler::get()->nonDynamicData->resolveObject(id.c_str()); existingObject != nullptr) {
					if (getIfExists && existingObject->objectType == objectType) {
						return existingObject;
					}
					throw std::invalid_argument{ "tes3.createObject: 'id' parameter already assigned to an existing object that is not a weapon." };
				}
			}

			std::string name = getOptionalParam<std::string>(params, "name", "Miscellaneous item");
			if (name.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'name' parameter must be less than 32 character long." };
			}

			std::string mesh = getOptionalParam<std::string>(params, "mesh", {});
			if (mesh.size() > 31) {
				throw std::invalid_argument{ "tes3.createObject: 'mesh' parameter must be less than 32 character long." };
			}

			auto weapon = new TES3::Weapon();

			if (objectType == TES3::ObjectType::Ammo) {
				weapon->objectType = TES3::ObjectType::Ammo;
			}

			weapon->setID(id.c_str());
			weapon->setName(name.c_str());
			weapon->setModelPath(mesh.c_str());

			auto script = getOptionalParamScript(params, "script");

			if (script != nullptr) {
				weapon->script = script;
			}

			auto enchantment = getOptionalParamObject<TES3::Enchantment>(params, "enchantment");
			if (enchantment && enchantment->objectType == TES3::ObjectType::Enchantment) {
				weapon->enchantment = enchantment;
			}

			std::string icon = getOptionalParam<std::string>(params, "icon", {});
			if (!icon.empty() && icon.size() < 31) {
				tes3::setDataString(&weapon->icon, icon.c_str());
			}

			weapon->objectFlags = getOptionalParam<unsigned int>(params, "objectFlags", 0);
			weapon->weight = getOptionalParam<float>(params, "weight", 1.0f);
			weapon->value = getOptionalParam<int>(params, "value", 1);
			weapon->weaponType = getOptionalParam<unsigned char>(params, "type", TES3::WeaponType::ShortBlade1H);
			weapon->maxCondition = getOptionalParam<unsigned short>(params, "maxCondition", 100);
			weapon->speed = getOptionalParam<float>(params, "speed", 1.0f);
			weapon->reach = getOptionalParam<float>(params, "reach", 1.0f);
			weapon->enchantCapacity = getOptionalParam<unsigned short>(params, "enchantCapacity", 100);
			weapon->chopMin = getOptionalParam<unsigned char>(params, "chopMin", 1);
			weapon->chopMax = getOptionalParam<unsigned char>(params, "chopMax", 5);
			weapon->slashMin = getOptionalParam<unsigned char>(params, "slashMin", 1);
			weapon->slashMax = getOptionalParam<unsigned char>(params, "slashMax", 5);
			weapon->thrustMin = getOptionalParam<unsigned char>(params, "thrustMin", 1);
			weapon->thrustMax = getOptionalParam<unsigned char>(params, "thrustMax", 5);
			weapon->materialFlags = getOptionalParam<unsigned int>(params, "materialFlags", 0);

			weapon->setIgnoresNormalWeaponResistance(getOptionalParam<bool>(params, "ignoresNormalWeaponResistance", weapon->getIgnoresNormalWeaponResistance()));

			weapon->objectFlags |= TES3::ObjectFlag::Modified;
			weapon->objectFlags |= TES3::ObjectFlag::LinksResolved;

			if (!TES3::DataHandler::get()->nonDynamicData->addNewObject(weapon)) {
				delete weapon;
				weapon = nullptr;
				throw std::runtime_error("tes3.createObject: could not add the newly created weapon to its proper collection.");
			}

			// If created outside of a save game, mark the object as sourceless.
			if (getOptionalParam<bool>(params, "sourceless", false) || TES3::WorldController::get()->getMobilePlayer() == nullptr) {
				TES3::BaseObject::setSourcelessObject(weapon);
			}

			return weapon;
		}
	};

	std::unique_ptr<ObjectCreatorBase> makeObjectCreator(TES3::ObjectType::ObjectType objectType);

}
