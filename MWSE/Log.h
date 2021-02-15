/************************************************************************
			   Log.h - Copyright (c) 2008 The MWSE Project
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

#pragma once

namespace mwse::log {
	void open(const char *path);
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
