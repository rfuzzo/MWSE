#include "DialogActorAIWindow.h"

#include "CSCell.h"
#include "CSDataHandler.h"
#include "CSRecordHandler.h"

#include "LogUtil.h"

namespace se::cs::dialog::actor_ai_window {

	constexpr auto ENABLE_ALL_OPTIMIZATIONS = true;
	constexpr auto LOG_PERFORMANCE_RESULTS = false;

	//
	// Main patching function.
	//

	std::optional<LRESULT> forcedReturnType = {};

	auto initializationTimer = std::chrono::high_resolution_clock::now();

	void CALLBACK PatchDialogProc_BeforeInit(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
		// Begin measure of initialization time.
		if constexpr (LOG_PERFORMANCE_RESULTS) {
			initializationTimer = std::chrono::high_resolution_clock::now();
		}

		// Disable redraw.
		if constexpr (ENABLE_ALL_OPTIMIZATIONS) {
			SendMessageA(GetDlgItem(hWnd, CONTROL_ID_ADD_PACKAGE_COMBO), WM_SETREDRAW, FALSE, NULL);
			SendMessageA(GetDlgItem(hWnd, CONTROL_ID_TRAVEL_SERVICE_1_COMBO), WM_SETREDRAW, FALSE, NULL);
			SendMessageA(GetDlgItem(hWnd, CONTROL_ID_TRAVEL_SERVICE_2_COMBO), WM_SETREDRAW, FALSE, NULL);
			SendMessageA(GetDlgItem(hWnd, CONTROL_ID_TRAVEL_SERVICE_3_COMBO), WM_SETREDRAW, FALSE, NULL);
			SendMessageA(GetDlgItem(hWnd, CONTROL_ID_TRAVEL_SERVICE_4_COMBO), WM_SETREDRAW, FALSE, NULL);
		}
	}

	void CALLBACK PatchDialogProc_AfterInit(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
		// Reenable redraw.
		if constexpr (ENABLE_ALL_OPTIMIZATIONS) {
			SendMessageA(GetDlgItem(hWnd, CONTROL_ID_ADD_PACKAGE_COMBO), WM_SETREDRAW, TRUE, NULL);
			SendMessageA(GetDlgItem(hWnd, CONTROL_ID_TRAVEL_SERVICE_1_COMBO), WM_SETREDRAW, TRUE, NULL);
			SendMessageA(GetDlgItem(hWnd, CONTROL_ID_TRAVEL_SERVICE_2_COMBO), WM_SETREDRAW, TRUE, NULL);
			SendMessageA(GetDlgItem(hWnd, CONTROL_ID_TRAVEL_SERVICE_3_COMBO), WM_SETREDRAW, TRUE, NULL);
			SendMessageA(GetDlgItem(hWnd, CONTROL_ID_TRAVEL_SERVICE_4_COMBO), WM_SETREDRAW, TRUE, NULL);
		}

		// Finish measure of initialization time.
		if constexpr (LOG_PERFORMANCE_RESULTS) {
			auto timeToInitialize = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::high_resolution_clock::now() - initializationTimer);
			log::stream << "Total dialogue window initialization time: " << timeToInitialize.count() << "ms" << std::endl;
		}
	}

	LRESULT CALLBACK PatchDialogProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
		forcedReturnType = {};

		// Handle pre-patches.
		switch (msg) {
		case WM_INITDIALOG:
			PatchDialogProc_BeforeInit(hWnd, msg, wParam, lParam);
			break;
		}

		if (forcedReturnType) {
			return forcedReturnType.value();
		}

		// Call original function.
		const auto CS_ObjectWindowDialogProc = reinterpret_cast<WNDPROC>(0x4A7900);
		auto result = CS_ObjectWindowDialogProc(hWnd, msg, wParam, lParam);

		// Handle post-patches.
		switch (msg) {
		case WM_INITDIALOG:
			PatchDialogProc_AfterInit(hWnd, msg, wParam, lParam);
			break;
		}

		return forcedReturnType.value_or(result);
	}

	void installPatches() {
		using memory::genJumpEnforced;
		using memory::genNOPUnprotected;

		// Patch: Extend Object Window message handling.
		genJumpEnforced(0x403378, 0x4A7900, reinterpret_cast<DWORD>(PatchDialogProc));
	}
}