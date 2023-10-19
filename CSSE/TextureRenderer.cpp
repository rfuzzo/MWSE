#include "TextureRenderer.h"

#include "MemoryUtil.h"
#include "WinUIUtil.h"

namespace se::cs {
	/// <summary>
	/// The CS by default uses the BLACKONWHITE bitmap stretching mode. For larger textures this will
	/// just result in a black rectangle. We change that to use HALFTONE, to average blocks of pixels
	/// that are stretched down to fit the button render area.
	/// 
	/// TODO: Alpha blending can be used to improve this rendering with item icons.
	/// </summary>
	void TextureRenderer::drawItem(DRAWITEMSTRUCT* drawItem) const {
		using winui::GetRectHeight;
		using winui::GetRectWidth;

		if (bitmapInfo == nullptr) {
			return;
		}

		// BLACKONWHITE won't work for us here.
		SetStretchBltMode(drawItem->hDC, HALFTONE);
		SetBrushOrgEx(drawItem->hDC, 0, 0, nullptr);

		// Actually render our texture.
		const auto rcItem = &drawItem->rcItem;
		StretchDIBits(drawItem->hDC,
			rcItem->left, rcItem->top, GetRectWidth(rcItem), GetRectHeight(rcItem),
			0, 0, width, height,
			bitmapInfo->bmiColors, bitmapInfo,
			DIB_RGB_COLORS, SRCCOPY);
	}

	void TextureRenderer::installPatches() {
		using memory::genJumpEnforced;

		// Patch: Fix rendering of textures larger than the target rectangle.
		auto drawItem = &TextureRenderer::drawItem;
		genJumpEnforced(0x402D38, 0x475A80, *reinterpret_cast<DWORD*>(&drawItem));
	}
}
