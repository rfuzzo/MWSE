#include "Log.h"

namespace mwse::log {
	static std::ofstream logstream;
	static std::ofstream debugstream;

	void open(const char *path) {
		logstream.open(path);
	}

	void close() {
		logstream.close();
	}

	std::ostream& getLog() {
		return logstream;
	}

	std::ostream& getDebug() {
		return debugstream;
	}

	std::size_t write(const char* str) {
		logstream << str;
		return std::strlen(str);
	}

	std::size_t log(const char* fmt, ...) {
		char buf[4096] = "\0";
		std::size_t result = 0;

		va_list args;
		va_start(args, fmt);

		if (fmt) {
			result = std::vsnprintf(buf, sizeof(buf), fmt, args);
		}
		else {
			result = 4;
			std::strcpy(buf, "mwse::log::log(null)\r\n");
		}

		logstream << buf;

		va_end(args);
		return result;
	}

	std::size_t logLine(const char* fmt, ...) {
		char buf[4096] = "\0";
		std::size_t result = 0;

		va_list args;
		va_start(args, fmt);

		if (fmt) {
			std::vsnprintf(buf, sizeof(buf) - 4, fmt, args);
		}
		else {
			logstream << "mwse::log::logLine(null)" << std::endl;
			return 4;
		}

		logstream << buf << std::endl;

		va_end(args);
		return result;
	}

	std::size_t logBinary(void* addr, std::size_t sz) {
		char buf[128];
		BYTE* ptr = (BYTE*)addr;

		for (std::size_t y = 0; y < sz; y += 16, ptr += 16) {
			std::size_t n = (sz - y < 16) ? (sz - y) : 16;
			char* s = buf;

			s += std::sprintf(s, "  ");
			for (std::size_t x = 0; x < n; ++x) {
				s += std::sprintf(s, "%02X ", (unsigned int)ptr[n]);
			}

			s += std::sprintf(s, "    ");
			for (std::size_t x = 0; x < n; ++x) {
				if (std::isprint(ptr[n])) {
					*s++ = (char)ptr[n];
				}
				else {
					*s++ = '.';
				}
			}

			s += std::sprintf(s, "\r\n");
			write(buf);
		}

		return sz;
	}

	void prettyDump(const void* data, const size_t length) {
		constexpr unsigned int LINE_WIDTH = 16u;

		// Prepare log.
		auto& log = getLog();
		log << std::hex << std::setfill('0');

		unsigned long address = size_t(data);
		const size_t dataEnd = address + length;
		while (address < size_t(data) + length) {
			// Show address
			log << std::setw(8) << address;

			// Show the hex codes
			for (unsigned int offset = 0; offset < LINE_WIDTH; offset++) {
				if (address + offset < dataEnd) {
					log << ' ' << std::setw(2) << unsigned int(*reinterpret_cast<const unsigned char*>(address + offset));
				}
				else {
					log << "   ";
				}
			}

			// Show printable characters
			log << "  ";
			for (unsigned int offset = 0; offset < LINE_WIDTH; offset++) {
				if (address + offset < dataEnd) {
					if (*reinterpret_cast<const unsigned char*>(address + offset) < 32u) log << '.';
					else log << *reinterpret_cast<const char*>(address + offset);
				}
			}

			log << std::endl;
			address += 0x10;
		}
	}
}