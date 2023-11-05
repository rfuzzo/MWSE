#include "DialogObjectWindow.h"

#include "LogUtil.h"
#include "MemoryUtil.h"
#include "StringUtil.h"
#include "WindowsUtil.h"
#include "WinUIUtil.h"

#include "NIIteratedList.h"

#include "CSBook.h"
#include "CSFaction.h"
#include "CSNPC.h"
#include "CSScript.h"

#include "EditBasicExtended.h"

#include "ObjectWindowTabData.h"

#include "WindowMain.h"

#include "Settings.h"

namespace se::cs::dialog::object_window {
	using memory::ExternalGlobal;

	constexpr auto REPLACE_TAB_COLUMN_LOGIC = true;

	using ghWndTabControl = ExternalGlobal<HWND, 0x6CF08C>;
	using ghWndObjectList = ExternalGlobal<HWND, 0x6CEFD0>;
	static HWND objectWindowSearchControl = NULL;

	using gCurrentTab = ExternalGlobal<int, 0x6CEFFC>;
	auto gTabControllers = reinterpret_cast<TabController**>(0x6CEF38);

	namespace Tab {
		enum Tab_t {
			Activator,
			Apparatus,
			Armor,
			BodyPart,
			Book,
			Clothing,
			Container,
			Door,
			Ingredient,
			Light,
			Lockpick,
			MiscItem,
			Probe,
			RepairItem,
			Static,
			Weapon,
			NPC,
			Creature,
			LeveledCreature,
			Spellmaking,
			Enchanting,
			Alchemy,
			LeveledItem,

			COUNT,
		};
	}

	//
	// Patch: Optimize displaying of objects dialog tabs.
	//

	const auto NI_IteratedList_Begin = reinterpret_cast<NI::IteratedList<BaseObject*>::Node * (__thiscall*)(NI::IteratedList<BaseObject*>*)>(0x401E29);
	NI::IteratedList<BaseObject*>::Node* __fastcall PatchSpeedUpObjectWindow_PauseRedraws(NI::IteratedList<BaseObject*>* list) {
		auto result = NI_IteratedList_Begin(list);

		if (result) {
			const auto listView = ghWndObjectList::get();
			SendMessageA(listView, WM_SETREDRAW, FALSE, NULL);
		}

		return result;
	}

	const auto NI_IteratedList_Next = reinterpret_cast<NI::IteratedList<BaseObject*>::Node * (__thiscall*)(NI::IteratedList<BaseObject*>*)>(0x403D8C);
	NI::IteratedList<BaseObject*>::Node* __fastcall PatchSpeedUpObjectWindow_ResumeRedraws(NI::IteratedList<BaseObject*>* list) {
		auto result = NI_IteratedList_Next(list);

		if (result == nullptr) {
			const auto listView = ghWndObjectList::get();
			SendMessageA(listView, WM_SETREDRAW, TRUE, NULL);
		}

		return result;
	}

	//
	// Patch: Replace column logic so we can add columns wherever we want.
	//

	TabController* __fastcall PatchColumnLogic_ctor(TabController* controller, DWORD _EDX_, ObjectType::ObjectType objectType) {
		memory::_delete(controller);

		return new TabController(objectType);
	}

	void __fastcall PatchColumnLogic_TearDownColumns(TabController* controller, DWORD _EDX_, HWND hWnd) {
		ListView_DeleteAllItems(hWnd);

		bool settingsChanged = false;

		char buffer[64] = {};

		LV_COLUMN lvColumnData = {};
		lvColumnData.pszText = buffer;
		lvColumnData.cchTextMax = 64;
		lvColumnData.mask = LVCF_TEXT | LVCF_WIDTH | LVCF_SUBITEM;
		while (ListView_GetColumn(hWnd, 0, &lvColumnData)) {
			auto column = controller->getColumnByTitle(lvColumnData.pszText);
			if (column) {
				auto& settings = column->getSettings();
				if (settings.width != lvColumnData.cx) {
					settings.width = lvColumnData.cx;
					settingsChanged = true;
				}
			}
			ListView_DeleteColumn(hWnd, 0);
		}
		controller->columnsActive = 0;
		if (!controller->columns.empty()) {
			controller->columns.clear();
		}

		if (settingsChanged) {
			settings.save();
		}
	}

	void __fastcall PatchColumnLogic_SetupColumns(TabController* controller, DWORD _EDX_, HWND hWnd) {
		controller->setupColumns(hWnd);
	}

	void __fastcall PatchColumnLogic_GetDisplayInfo(TabController* controller, DWORD _EDX_, LPNMLVDISPINFOA displayInfo) {
		const auto column = controller->columns.at(displayInfo->item.iSubItem);
		column->getDisplayInfo(displayInfo);
	}

	int __stdcall PatchColumnLogic_Sort(Object* a, Object* b, LPARAM lParam) {
		const auto currentTab = gCurrentTab::get();
		const auto controller = gTabControllers[currentTab];
		const auto columnIndex = lParam >> 1;
		const auto sortOrderAsc = (lParam & 1) != 0;

		const auto column = controller->columns.at(columnIndex);
		return column->sortObject(a, b, sortOrderAsc);
	}

	//
	// Patch: Allow filtering of object window.
	//

	static std::string currentSearchText;
	static std::optional<std::regex> currentSearchRegex;
	static bool modeShowModifiedOnly = false;

	bool matchDispatcher(const std::string_view& haystack) {
		if (currentSearchRegex) {
			return std::regex_search(haystack.data(), currentSearchRegex.value());
		}
		else if (settings.object_window.case_sensitive) {
			return string::contains(haystack, currentSearchText);
		}
		else {
			return string::cicontains(haystack, currentSearchText);
		}
	}

	bool PatchFilterObjectWindow_ObjectMatchesSearchText(const Object* object) {
		if (modeShowModifiedOnly && !object->getModified()) {
			return false;
		}

		// If we have no search text, always allow.
		if (currentSearchText.empty()) {
			return true;
		}

		// Allow filtering by object ID.
		if (settings.object_window.filter_by_id) {
			if (matchDispatcher(object->getObjectID())) {
				return true;
			}
		}

		// Allow filtering by object name.
		if (settings.object_window.filter_by_name) {
			if (matchDispatcher(object->getName())) {
				return true;
			}
		}

		// Allow filtering by model path.
		if (settings.object_window.filter_by_model_path) {
			if (matchDispatcher(object->getModel())) {
				return true;
			}
		}

		// Allow filtering by icon path.
		if (settings.object_window.filter_by_icon_path) {
			if (matchDispatcher(object->getIcon())) {
				return true;
			}
		}

		// Allow filtering by enchantment id.
		if (settings.object_window.filter_by_enchantment_id) {
			auto enchantment = object->getEnchantment();
			if (enchantment && matchDispatcher(enchantment->getObjectID())) {
				return true;
			}
		}

		// Allow filtering by script id.
		if (settings.object_window.filter_by_script_id) {
			auto script = object->getScript();
			if (script && matchDispatcher(script->getObjectID())) {
				return true;
			}
		}

		// Allow filtering by book text.
		if (settings.object_window.filter_by_book_text && object->objectType == ObjectType::Book) {
			auto asBook = static_cast<const Book*>(object);
			if (asBook->text && matchDispatcher(asBook->text)) {
				return true;
			}
		}

		// Allow filtering by faction.
		if (settings.object_window.filter_by_faction && object->objectType == ObjectType::NPC) {
			const auto asNPC = static_cast<const NPC*>(object);
			auto faction = asNPC->getFaction();
			if (faction) {
				// Basic ID check.
				if (matchDispatcher(faction->getObjectID())) {
					return true;
				}

				// Also check rank.
				if (matchDispatcher(asNPC->getFactionRankName())) {
					return true;
				}
			}
		}

		return false;
	}

	void CALLBACK PatchFilterObjectWindow(LPARAM index, const Object* object) {
		if (PatchFilterObjectWindow_ObjectMatchesSearchText(object)) {
			const auto CS_AddObjectToWindow = reinterpret_cast<void(__stdcall*)(LPARAM, const BaseObject*)>(0x43C260);
			CS_AddObjectToWindow(index, object);
		}
	}

	//
	// Patch: Extend Object Window message handling.
	//

	std::optional<LRESULT> forcedReturnType = {};

	void CALLBACK PatchDialogProc_BeforeSize(HWND hDlg, UINT msg, WPARAM wParam, LPARAM lParam) {
		using winui::GetRectHeight;
		using winui::GetRectWidth;
		using winui::TabCtrl_GetInteriorRect;

		// Update view menu.
		auto mainWindow = GetMenu(window::main::ghWnd::get());
		if (wParam) {
			if (wParam == SIZE_MINIMIZED) {
				CheckMenuItem(mainWindow, 40199u, MF_BYCOMMAND);
			}
		}
		else {
			CheckMenuItem(mainWindow, 40199u, MF_CHECKED);
		}

		auto tabControl = GetDlgItem(hDlg, CONTROL_ID_TABS);
		auto objectListView = GetDlgItem(hDlg, CONTROL_ID_LIST_VIEW);
		auto showModifiedButton = GetDlgItem(hDlg, CONTROL_ID_SHOW_MODIFIED_ONLY_BUTTON);
		auto searchLabel = GetDlgItem(hDlg, CONTROL_ID_FILTER_LABEL);
		auto searchEdit = GetDlgItem(hDlg, CONTROL_ID_FILTER_EDIT);

		// Update globals.
		ghWndTabControl::set(tabControl);
		ghWndObjectList::set(objectListView);
		objectWindowSearchControl = searchEdit;

		const auto mainWidth = LOWORD(lParam);
		const auto mainHeight = HIWORD(lParam);

		constexpr auto BASIC_PADDING = 2;
		constexpr auto STATIC_HEIGHT = 13;
		constexpr auto EDIT_HEIGHT = 21;
		constexpr auto STATIC_COMBO_OFFSET = (EDIT_HEIGHT - STATIC_HEIGHT) / 2;

		// Make room for our new search bar.
		MoveWindow(tabControl, 0, 0, mainWidth, mainHeight - EDIT_HEIGHT - BASIC_PADDING * 2, TRUE);

		// Update list view area.
		RECT tabContentRect = {};
		TabCtrl_GetInteriorRect(tabControl, &tabContentRect);
		MoveWindow(objectListView, tabContentRect.left, tabContentRect.top, GetRectWidth(&tabContentRect), GetRectHeight(&tabContentRect), TRUE);

		// Update the search bar placement.
		int currentY = mainHeight - EDIT_HEIGHT - BASIC_PADDING;
		auto searchEditWidth = std::min<int>(mainWidth - BASIC_PADDING * 2, 300);
		MoveWindow(showModifiedButton, BASIC_PADDING, currentY, 160, EDIT_HEIGHT, TRUE);
		MoveWindow(searchLabel, mainWidth - BASIC_PADDING - searchEditWidth - 54 - BASIC_PADDING, currentY + STATIC_COMBO_OFFSET, 54, STATIC_HEIGHT, TRUE);
		MoveWindow(objectWindowSearchControl, mainWidth - BASIC_PADDING - searchEditWidth, currentY, searchEditWidth, EDIT_HEIGHT, FALSE);

		RedrawWindow(hDlg, NULL, NULL, RDW_ERASE | RDW_FRAME | RDW_INVALIDATE | RDW_ALLCHILDREN);
	}

	void CALLBACK PatchDialogProc_AfterCreate(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
		auto hInstance = (HINSTANCE)GetWindowLongA(hWnd, GWLP_HINSTANCE);

		// Change the tabs to be button-based so that they don't have the selected tab stack always on the bottom.
		const auto hDlgTabControl = GetDlgItem(hWnd, CONTROL_ID_TABS);
		if (settings.object_window.use_button_style_tabs) {
			winui::AddStyles(hDlgTabControl, TCS_BUTTONS);
		}

		// Ensure our custom filter box is added.
		auto hDlgFilterEdit = GetDlgItem(hWnd, CONTROL_ID_FILTER_EDIT);
		if (objectWindowSearchControl == NULL) {

			auto hDlgShowModifiedOnly = CreateWindowExA(NULL, WC_BUTTON, "Show modified only", BS_AUTOCHECKBOX | BS_PUSHLIKE | WS_CHILD | WS_VISIBLE | WS_GROUP, 0, 0, 0, 0, hWnd, (HMENU)CONTROL_ID_SHOW_MODIFIED_ONLY_BUTTON, hInstance, NULL);
			auto hDlgFilterStatic = CreateWindowExA(NULL, WC_STATIC, "Filter:", SS_RIGHT | WS_CHILD | WS_VISIBLE | WS_GROUP, 0, 0, 0, 0, hWnd, (HMENU)CONTROL_ID_FILTER_LABEL, hInstance, NULL);
			hDlgFilterEdit = CreateWindowExA(WS_EX_CLIENTEDGE, WC_EDIT, "", ES_LEFT | ES_AUTOHSCROLL | WS_CHILD | WS_VISIBLE | WS_BORDER | WS_TABSTOP, 0, 0, 0, 0, hWnd, (HMENU)CONTROL_ID_FILTER_EDIT, hInstance, NULL);
			if (hDlgFilterEdit) {
				SetWindowSubclass(hDlgFilterEdit, ui_subclass::edit::BasicExtendedProc, NULL, NULL);

				auto font = SendMessageA(hWnd, WM_GETFONT, FALSE, FALSE);
				SendMessageA(hDlgShowModifiedOnly, WM_SETFONT, font, MAKELPARAM(TRUE, FALSE));
				SendMessageA(hDlgFilterStatic, WM_SETFONT, font, MAKELPARAM(TRUE, FALSE));
				SendMessageA(hDlgFilterEdit, WM_SETFONT, font, MAKELPARAM(TRUE, FALSE));
			}
			else {
				log::stream << "ERROR: Could not create search control!" << std::endl;
			}
		}
	}

	inline void OnNotifyFromMainListView(HWND hWnd, UINT msg, WPARAM id, LPARAM lParam) {
		using windows::isKeyDown;

		const auto hdr = (NMHDR*)lParam;

		if (hdr->code == LVN_KEYDOWN) {
			const auto keydownHDR = (LV_KEYDOWN*)hdr;
			if (keydownHDR->wVKey == 'F' && isKeyDown(VK_CONTROL)) {
				SetFocus(objectWindowSearchControl);
			}
		}
		else if (hdr->code == LVN_MARQUEEBEGIN) {
			// I've tried DWLP_MSGRESULT, subclassing, blocking this notification, changing styles, and so much else.
			// Somehow, this is the only thing that has worked...
			Sleep(20);
			forcedReturnType = TRUE;
		}
		else if (hdr->code == NM_CUSTOMDRAW && settings.object_window.highlight_modified_items) {
			LPNMLVCUSTOMDRAW lplvcd = (LPNMLVCUSTOMDRAW)lParam;
			if (lplvcd->nmcd.dwDrawStage == CDDS_PREPAINT) {
				SetWindowLongA(hWnd, DWLP_MSGRESULT, CDRF_NOTIFYITEMDRAW);
			}
			else if (lplvcd->nmcd.dwDrawStage == CDDS_ITEMPREPAINT) {
				auto object = (BaseObject*)lplvcd->nmcd.lItemlParam;
				if (object) {
					// Background color highlighting.
					if (object->getDeleted()) {
						lplvcd->clrTextBk = settings.color_theme.highlight_deleted_object_packed_color;
						SetWindowLongA(hWnd, DWLP_MSGRESULT, CDRF_NEWFONT);
					}
					else if (object->getModified()) {
						// Modified color highlighting. Different colors for modified-master or mod-added object.
						lplvcd->clrTextBk = object->isFromMaster() ? settings.color_theme.highlight_modified_from_master_packed_color : settings.color_theme.highlight_modified_new_object_packed_color;
						SetWindowLongA(hWnd, DWLP_MSGRESULT, CDRF_NEWFONT);
					}
				}
			}
			forcedReturnType = TRUE;
		}
		else if (hdr->code == LVN_COLUMNCLICK) {
			if constexpr (!REPLACE_TAB_COLUMN_LOGIC) {
				return;
			}

			forcedReturnType = 0;

			auto notifyColumnClick = (LPNMLISTVIEW)lParam;

			char buffer[64] = {};

			// Get the clicked column data.
			auto listView = notifyColumnClick->hdr.hwndFrom;
			LV_COLUMN lvColumnData = {};
			lvColumnData.mask = LVCF_TEXT;
			lvColumnData.pszText = buffer;
			lvColumnData.cchTextMax = 64;
			if (!ListView_GetColumn(listView, notifyColumnClick->iSubItem, &lvColumnData)) {
				return;
			}

			// Set sort flags.
			const auto& currentTab = gCurrentTab::get();
			auto controller = gTabControllers[currentTab];
			auto columnIndex = controller->getColumnIndexByTitle(lvColumnData.pszText);
			auto& param = TabColumnParam::get(currentTab);
			if (param.getSortColumn() == columnIndex) {
				param.toggleSortOrder();
			}
			else {
				param.setSortAsc(true);
			}
			param.setSortColumn(columnIndex);

			// Actually dispatch the search.
			ListView_SortItems(listView, PatchColumnLogic_Sort, param);
		}
	}

	inline void OnNotifyFromMainTabControl(HWND hWnd, UINT msg, WPARAM id, LPARAM lParam) {
		const auto hdr = (NMHDR*)lParam;

		if (hdr->code == TCN_SELCHANGING && settings.object_window.clear_filter_on_tab_switch) {
			SetWindowTextA(objectWindowSearchControl, "");
		}
	}

	inline void PatchDialogProc_BeforeNotify(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
		switch (wParam) {
		case CONTROL_ID_LIST_VIEW:
			OnNotifyFromMainListView(hWnd, msg, wParam, lParam);
			break;
		case CONTROL_ID_TABS:
			OnNotifyFromMainTabControl(hWnd, msg, wParam, lParam);
			break;
		}
	}

	void RefreshListView(HWND hWnd) {
		// Fire a refresh function. But disable drawing throughout so we don't get ugly flashes.
		const auto listView = ghWndObjectList::get();
		SendMessageA(listView, WM_SETREDRAW, FALSE, NULL);
		SendMessageA(hWnd, 0x413, 0, 0);
		SendMessageA(listView, WM_SETREDRAW, TRUE, NULL);
		RedrawWindow(listView, NULL, NULL, RDW_ERASE | RDW_FRAME | RDW_INVALIDATE | RDW_ALLCHILDREN);
	}

	inline void OnFilterEditChanged(HWND hWnd) {
		using namespace se::cs::winui;

		// Get current search text.
		auto newText = GetWindowTextA(objectWindowSearchControl);

		// Transform the search text to lowercase and clear stray characters.
		string::to_lower(newText);

		if (!string::equal(currentSearchText, newText)) {
			currentSearchText = std::move(newText);

			// Regex crunching can be slow, so only do it once.
			if (settings.object_window.use_regex) {
				auto flags = std::regex_constants::extended | std::regex_constants::optimize | std::regex_constants::nosubs;
				if (!settings.object_window.case_sensitive) {
					flags |= std::regex_constants::icase;
				}

				try {
					currentSearchRegex = std::regex(currentSearchText, flags);
				}
				catch (const std::regex_error& e) {
					log::stream << "Regex error when searching object window: " << e.what() << std::endl;
					currentSearchRegex = {};

					// TODO: Paint the background of the search input red or something.
				}
			}
			else {
				currentSearchRegex = {};
			}

			RefreshListView(hWnd);
		}
	}

	void PatchDialogProc_BeforeCommand(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
		const auto command = HIWORD(wParam);
		const auto id = LOWORD(wParam);
		switch (command) {
		case BN_CLICKED:
			switch (id) {
			case CONTROL_ID_SHOW_MODIFIED_ONLY_BUTTON:
				modeShowModifiedOnly = SendDlgItemMessageA(hWnd, id, BM_GETCHECK, 0, 0);
				RefreshListView(hWnd);
				break;
			}
			break;
		case EN_CHANGE:
			switch (id) {
			case CONTROL_ID_FILTER_EDIT:
				OnFilterEditChanged(hWnd);
				break;
			}
			break;
		}
	}

	LRESULT CALLBACK PatchDialogProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
		forcedReturnType = {};

		// Handle pre-patches.
		switch (msg) {
		case WM_DESTROY:
			objectWindowSearchControl = NULL;
			break;
		case WM_SIZE:
			PatchDialogProc_BeforeSize(hWnd, msg, wParam, lParam);
			return FALSE;
		case WM_NOTIFY:
			PatchDialogProc_BeforeNotify(hWnd, msg, wParam, lParam);
			break;
		case WM_COMMAND:
			PatchDialogProc_BeforeCommand(hWnd, msg, wParam, lParam);
			break;
		}

		if (forcedReturnType) {
			return forcedReturnType.value();
		}

		// Call original function.
		const auto CS_ObjectWindowDialogProc = reinterpret_cast<WNDPROC>(0x451320);
		auto result = CS_ObjectWindowDialogProc(hWnd, msg, wParam, lParam);

		// Handle post-patches.
		switch (msg) {
		case WM_INITDIALOG:
			PatchDialogProc_AfterCreate(hWnd, msg, wParam, lParam);
			break;
		}

		return forcedReturnType.value_or(result);
	}

	int getTabForObjectType(ObjectType::ObjectType objectType) {
		const auto objectTypesForTab = (ObjectType::ObjectType*)0x6A3CC4;
		for (auto i = 0u; i < Tab::COUNT; ++i) {
			if (objectTypesForTab[i] == objectType) {
				return i;
			}
		}
		return -1;
	}
	
	//
	// Main patching function.
	//

	void installPatches() {
		using memory::genCallEnforced;
		using memory::genJumpEnforced;
		using memory::writeDoubleWordEnforced;
		using memory::writeValueEnforced;

		// Patch: Optimize displaying of objects dialog tabs.
		genCallEnforced(0x43C1B4, 0x401E29, reinterpret_cast<DWORD>(PatchSpeedUpObjectWindow_PauseRedraws));
		genCallEnforced(0x43C1CC, 0x403D8C, reinterpret_cast<DWORD>(PatchSpeedUpObjectWindow_ResumeRedraws));

		// Patch: Extend column support.
		if constexpr (REPLACE_TAB_COLUMN_LOGIC) {
			// Extend controller structure.
			genJumpEnforced(0x40262B, 0x43BF60, reinterpret_cast<DWORD>(PatchColumnLogic_ctor));

			// Patch column creation.
			genJumpEnforced(0x40213F, 0x441050, reinterpret_cast<DWORD>(PatchColumnLogic_SetupColumns));

			// Patch column destruction.
			genJumpEnforced(0x403909, 0x442770, reinterpret_cast<DWORD>(PatchColumnLogic_TearDownColumns));

			// Extend the info display for the list.
			genCallEnforced(0x451A83, 0x402B3A, reinterpret_cast<DWORD>(PatchColumnLogic_GetDisplayInfo));

			// Fixup sorting.
			genJumpEnforced(0x403AF8, 0x43ED10, reinterpret_cast<DWORD>(PatchColumnLogic_Sort));
		}

		// Patch: Extend Object Window message handling.
		genJumpEnforced(0x402FD1, 0x451320, reinterpret_cast<DWORD>(PatchDialogProc));

		// Patch: Allow filtering of object window.
		genJumpEnforced(0x401F0F, 0x43C260, reinterpret_cast<DWORD>(PatchFilterObjectWindow));
	}
}
