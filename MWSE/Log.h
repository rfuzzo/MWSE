#pragma once

namespace mwse::log {
	void open(const char* path);
	void close();

	//
	// ostream access
	//

	// Outputs to mwse.log
	std::ostream& getLog();

	// Outputs to OutputDebugString
	std::ostream& getDebug();

	//
	// sprinf-style logging
	//

	std::size_t write(const char* str);
	std::size_t log(const char* fmt, ...);
	std::size_t logLine(const char* fmt, ...);
	std::size_t logBinary(void* addr, std::size_t sz);

	//
	// Object dumping.
	//

	void prettyDump(const void* data, const size_t length);

	template<class T> void prettyDump(const T* data) {
		prettyDump(data, sizeof(T));
	};
}
