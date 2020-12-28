/************************************************************************
			   Log.cpp - Copyright (c) 2008 The MWSE Project
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

#include "Log.h"

using namespace mwse;
using namespace log;

//debug output stream
template <class CharT, class TraitsT = std::char_traits<CharT> >
class basic_debugbuf :
	public std::basic_stringbuf<CharT, TraitsT>
{
public:
	virtual ~basic_debugbuf()
	{
		sync();
	}

protected:
	int sync()
	{
	}
	void output_debug_string(const CharT *text)
	{
	}
};

template<>
int basic_debugbuf<char>::sync()
{
	OutputDebugStringA(str().c_str());
	return 0;
}

template<class CharT, class TraitsT = std::char_traits<CharT> >
class basic_dostream : 
	public std::basic_ostream<CharT, TraitsT>
{
public:

	basic_dostream() : std::basic_ostream<CharT, TraitsT>
				(new basic_debugbuf<CharT, TraitsT>()) {}
	~basic_dostream() 
	{
//        delete rdbuf(); 
	}
};

typedef basic_dostream<char>	odstream;


namespace mwse::log {
	static std::ofstream logstream;
	static odstream debugstream;

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

		write(buf);

		va_end(args);
		return result;
	}

	std::size_t logLine(const char* fmt, ...) {
		char buf[4096] = "\0";
		std::size_t result = 0;

		va_list args;
		va_start(args, fmt);

		if (fmt) {
			result = std::vsnprintf(buf, sizeof(buf) - 4, fmt, args);
			std::strcat(buf + result, "\r\n");
		}
		else {
			result = 4;
			std::strcpy(buf, "mwse::log::logLine(null)\r\n");
		}

		write(buf);

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

	std::ostream& dump(std::ostream& output, void *data, size_t size) {
		unsigned char *cp = reinterpret_cast<unsigned char *>(data);
		for (size_t i = 0; i < size; i++) {
			if (i % 16 == 0 && i != 0) output << std::endl;
			output << std::hex << std::setw(2) << std::setfill('0') << *cp++;
		}
		output << std::endl;

		return output;
	}
}