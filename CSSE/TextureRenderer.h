#pragma once

namespace se::cs {
	struct TextureRenderer {
		unsigned int width; // 0x0
		unsigned int height; // 0x4
		BITMAPINFO* bitmapInfo; // 0x8

		TextureRenderer() = delete;
		TextureRenderer(const char* path) = delete;
		~TextureRenderer() = delete;

		void drawItem(DRAWITEMSTRUCT* drawItem) const;

		static void installPatches();
	};
	static_assert(sizeof(TextureRenderer) == 0xC, "TextureRenderer failed size validation");
}
