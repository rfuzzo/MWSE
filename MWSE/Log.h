#pragma once

namespace mwse::log {
	void OpenLog(const char* path);
	void CloseLog();

	std::ostream& getLog();
	std::ostream& getDebug(); //outputs to OutputDebugString

	template<class ...Args>
	void print(std::format_string<Args...> fmt, Args&&... args) {
		getLog() << std::format(fmt, std::forward<Args>(args)...);
	}

	template<class ...Args>
	void println(std::format_string<Args...> fmt, Args&&... args) {
		getLog() << std::format(fmt, std::forward<Args>(args)...) << std::endl;
	}

	void prettyDump(const void* data, const size_t length);

	template<class T> void prettyDump(const T* data) {
		prettyDump(data, sizeof(T));
	};
}
