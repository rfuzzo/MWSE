#include "CSCell.h"

namespace se::cs {
	bool Cell::getIsInterior() const {
		return cellFlags & CellFlag::Interior;
	}

	int Cell::getGridX() const {
		if (getIsInterior()) {
			return 0;
		}
		return gridX;
	}

	int Cell::getGridY() const {
		if (getIsInterior()) {
			return 0;
		}
		return gridY;
	}
}
