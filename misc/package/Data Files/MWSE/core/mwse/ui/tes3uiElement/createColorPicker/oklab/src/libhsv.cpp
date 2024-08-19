// HSV <-> sRGB conversions code is from: https://stackoverflow.com/a/36209005
// The only difference is that here color structs use floats instead of doubles.

#include <algorithm>
#include <cmath>
#include <cstdint>

struct RGB {
	float r;
	float g;
	float b;
};

struct HSV {
	float h;
	float s;
	float v;
};

extern "C" HSV srgb_to_hsv(RGB c)
{
	float Cmax = std::max(std::max(c.r, c.g), c.b);
	float Cmin = std::min(std::min(c.r, c.g), c.b);
	float delta = Cmax - Cmin;
	HSV out;
	out.v = Cmax;
	if (delta < 0.00001f)
	{
		out.s = 0;
		out.h = 0;
		return out;
	}

	if (Cmax > 0.0)
	{
		out.s = delta / Cmax;
	}
	else
	{
		out.s = 0;
		out.h = NAN;
		return out;
	}

	if (c.r >= Cmax)
	{
		out.h = (c.g - c.b) / delta;
	}
	else if (c.g >= Cmax)
	{
		out.h = 2.0f + (c.b - c.r) / delta;
	}
	else
	{
		out.h = 4.0f + (c.r - c.g) / delta;
	}
	out.h *= 60.0f;

	if (out.h < 0.0f)
	{
		out.h += 360.0;
	}
	return out;
}

extern "C" RGB hsv_to_srgb(HSV c)
{
	float H = c.h;
	float S = c.s;
	float V = c.v;
	RGB out;
	if (std::abs(H - 360) < 0.0001)
	{
		H = 0;
	}
	else
	{
		H /= 60.0f;
	}
	float fract = H - std::floor(H);

	float P = V * (1.0f - S);
	float Q = V * (1.0f - S * fract);
	float T = V * (1.0f - S * (1.0f - fract));

	if (0.0f <= H && H < 1.0f)
	{
		out.r = V;
		out.g = T;
		out.b = P;
	}
	else if (1.0f <= H && H < 2.0f)
	{
		out.r = Q;
		out.g = V;
		out.b = P;
	}
	else if (2.0f <= H && H < 3.0f)
	{
		out.r = P;
		out.g = V;
		out.b = T;
	}
	else if (3.0f <= H && H < 4.0f)
	{
		out.r = P;
		out.g = Q;
		out.b = V;
	}
	else if (4.0f <= H && H < 5.0f)
	{
		out.r = T;
		out.g = P;
		out.b = V;
	}
	else if (5.0f <= H && H < 6.0f)
	{
		out.r = V;
		out.g = P;
		out.b = Q;
	}
	else
	{
		out.r = 0.0f;
		out.g = 0.0f;
		out.b = 0.0f;
	}
	return out;
}

extern "C" void generate_main_picker(const double hue, RGB *data, const std::uint32_t width, const std::uint32_t height)
{
	HSV hsv = { static_cast<float>(hue), 0.f, 0.f };
	const float heightf = static_cast<float>(height);
	const float widthf = static_cast<float>(width);

	for (std::uint32_t y = 0; y < height; ++y)
	{
		const std::uint32_t offset = y * width;
		hsv.v = 1 - y / heightf;

		for (std::uint32_t x = 1; x <= width; ++x)
		{
			hsv.s = x / widthf;
			data[offset + x] = hsv_to_srgb(hsv);
		}
	}
}

extern "C" void generate_saturation_picker(const double hue, const double value, RGB *data, const std::uint32_t width, const std::uint32_t height)
{
	HSV hsv = { static_cast<float>(hue), 1.f, static_cast<float>(value) };
	const float heightf = static_cast<float>(height);

	for (std::uint32_t y = 0; y < height; ++y)
	{
		const std::uint32_t offset = y * width;
		hsv.s = 1 - y / heightf;

		for (std::uint32_t x = 1; x <= width; ++x)
		{
			data[offset + x] = hsv_to_srgb(hsv);
		}
	}
}

float color_blend(float cA, float cB, double alphaA, double alphaB, double inverse, double alphaO)
{
	return (cA * alphaA + cB * alphaB * inverse) / alphaO;
}

extern "C" void generate_preview_image(const RGB color, const double alpha, RGB *destination, double *alphas, RGB *checkers, const std::uint32_t width, const std::uint32_t height)
{
	for (std::uint32_t y = 0; y < height; ++y)
	{
		const std::uint32_t offset = y * width;
		for (std::uint32_t x = 1; x <= width; ++x)
		{
			const std::uint32_t i = offset + x;
			auto &p1 = destination[i];
			auto &p2 = checkers[i];
			// Background is always opaque here.
			constexpr double a2 = 1.0;

			double inverse = 1.0 - alpha;
			double alphaOut = alpha + a2 * inverse;
			p1.r = color_blend(color.r, p2.r, alpha, a2, inverse, alphaOut);
			p1.g = color_blend(color.g, p2.g, alpha, a2, inverse, alphaOut);
			p1.b = color_blend(color.b, p2.b, alpha, a2, inverse, alphaOut);
			alphas[i] = alphaOut;
		}
	}
}
