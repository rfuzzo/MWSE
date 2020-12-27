/************************************************************************

	xSetName.cpp - Copyright (c) 2008 The MWSE Project
	https://github.com/MWSE/MWSE/

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

**************************************************************************/

#include "VMExecuteInterface.h"
#include "Stack.h"
#include "InstructionInterface.h"
#include "MemoryUtil.h"

#include "TES3Apparatus.h"
#include "TES3Door.h"
#include "TES3Ingredient.h"
#include "TES3Reference.h"

using namespace mwse;

namespace mwse
{
	class xSetName : mwse::InstructionInterface_t
	{
	public:
		xSetName();
		virtual float execute(VMExecuteInterface &virtualMachine);
		virtual void loadParameters(VMExecuteInterface &virtualMachine);
	};

	static xSetName xSetNameInstance;

	xSetName::xSetName() : mwse::InstructionInterface_t(OpCode::xSetName) {}

	void xSetName::loadParameters(mwse::VMExecuteInterface &virtualMachine) {}

	float xSetName::execute(mwse::VMExecuteInterface &virtualMachine)
	{
		// Get parameter from the stack.
		mwseString& name = virtualMachine.getString(mwse::Stack::getInstance().popLong());

		// Enforce name length.
		if (name.length() > 31) {
#if _DEBUG
			mwse::log::getLog() << "xSetName: Given name length must be 31 characters or less." << std::endl;
#endif
			mwse::Stack::getInstance().pushShort(false);
			return 0.0f;
		}

		// Get reference.
		TES3::Reference* reference = virtualMachine.getReference();
		if (reference == nullptr) {
#if _DEBUG
			mwse::log::getLog() << "xSetName: No reference provided." << std::endl;
#endif
			mwse::Stack::getInstance().pushShort(false);
			return 0.0f;
		}
		
		// Get the base record.
		auto baseObject = static_cast<TES3::PhysicalObject*>(reference->getBaseObject());
		if (baseObject == nullptr) {
#if _DEBUG
			mwse::log::getLog() << "xSetName: No record found for reference." << std::endl;
#endif
			mwse::Stack::getInstance().pushShort(false);
			return 0.0f;
		}

		// Get string pointer based on record type.
		switch (baseObject->objectType) {
		case TES3::ObjectType::Apparatus:
			static_cast<TES3::Apparatus*>(baseObject)->setName(name.c_str());
			break;
		case TES3::ObjectType::Door:
			static_cast<TES3::Door*>(baseObject)->setName(name.c_str());
			break;
			// These all happen to have the same offset.
		case TES3::ObjectType::Ingredient:
		case TES3::ObjectType::Lockpick:
		case TES3::ObjectType::Probe:
		case TES3::ObjectType::Repair:
			static_cast<TES3::Ingredient*>(baseObject)->setName(name.c_str());
			break;
		default:
			baseObject->setName(name.c_str());
			break;
		}

		mwse::Stack::getInstance().pushShort(true);
		return 0.0f;
	}
}