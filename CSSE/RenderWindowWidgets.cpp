#include "RenderWindowWidgets.h"

#include "CSDataHandler.h"
#include "CSRecordHandler.h"
#include "CSModelLoader.h"

#include "NIMatrix33.h"
#include "NILines.h"
#include "NILinesData.h"

#include "LogUtil.h"
#include "MathUtil.h"

namespace se::cs::dialog::render_window {
	WidgetsController::WidgetsController() {
		auto loader = DataHandler::get()->recordHandler->modelLoader;

		root = loader->loadNIF("meshes\\mwse\\widgets.nif");
		if (!root) {
			return;
		}
		{
			auto object = root->getObjectByNameAndType("axisLines", NI::RTTIStaticPtr::NiSwitchNode);
			if (object) {
				axisLines = static_cast<NI::SwitchNode*>(object);
				axisLines->setAppCulled(true);
			}
		}
		{
			auto object = root->getObjectByNameAndType("gridRoot", NI::RTTIStaticPtr::NiNode);
			if (object) {
				gridRoot = static_cast<NI::Node*>(object);
				gridRoot->setAppCulled(true);
			}
		}
		{
			auto object = root->getObjectByNameAndType("unitPlane", NI::RTTIStaticPtr::NiGeometry);
			if (object) {
				debugUnitPlane = static_cast<NI::Geometry*>(object);
				debugUnitPlane->setAppCulled(true);
			}
		}
		{
			auto object = root->getObjectByNameAndType("unitSphere", NI::RTTIStaticPtr::NiGeometry);
			if (object) {
				debugUnitSphere = static_cast<NI::Geometry*>(object);
				debugUnitSphere->setAppCulled(true);
			}
		}
		{
			auto object = root->getObjectByNameAndType("unitArrows", NI::RTTIStaticPtr::NiGeometry);
			if (object) {
				debugUnitArrows = static_cast<NI::Geometry*>(object);
				debugUnitArrows->setAppCulled(true);
			}
		}
		root->update();
		root->updateEffects();
		root->updateProperties();
	}

	WidgetsController::~WidgetsController() {
		if (root) {
			root->detachFromParent();
			DataHandler::get()->recordHandler->modelLoader->releaseNIF(root);
		}
	}

	void WidgetsController::show() {
		if (axisLines) {
			axisLines->setAppCulled(false);
		}
	}

	void WidgetsController::hide() {
		if (axisLines) {
			axisLines->setAppCulled(true);
		}
	}

	bool WidgetsController::isShown() {
		return axisLines && !axisLines->getAppCulled();
	}

	void WidgetsController::setPosition(NI::Vector3& position) {
		if (axisLines) {
			axisLines->localTranslate = position;
			axisLines->update();
		}
		if (gridRoot) {
			gridRoot->localTranslate = position;
			gridRoot->update();
		}
	}

	void WidgetsController::setAxis(WidgetsAxis axis) {
		if (axisLines) {
			axisLines->setSwitchIndex((int)axis);
		}
	}

	void WidgetsController::updateGrid(NI::Vector3& position, float radius, int gridSnap) {
		if (!gridRoot) {
			return;
		}
		// Ensure non-zero grid size.
		float gridSize = std::max(float(gridSnap), 1.0f);

		// Ensure radius is big enough visually to see our grid.
		float gridRadius = std::max(radius, gridSize * 4.0f);

		// Calculate how many vertices we need to fill the grid.
		int g = 2.0f * (gridRadius / gridSize);

		// Needs an even number of vertices for NiLines to work.
		g += (g % 2) != 0; 

		unsigned int vertexCount = g + 2;
		if (vertexCount > 32767) {
			return;
		}

		// Calculate unitized X coordinates for vertices.
		// Based on Bresenham's Circle Drawing Algorithm.
		std::vector<int> grid(vertexCount, 0);
		{
			int x = 0;
			int y = g;
			int d = 1 - g;
			while (x < y) {
				grid[y] = std::max(grid[y], g + x);
				grid[x] = std::max(grid[x], g + y);
				if (d <= 0) {
					d += (x << 1) + 3;
				}
				else {
					d += ((x - y) << 1) + 5;
					y -= 1;
				}
				x += 1;
			}
		}

		auto lines = NI::Lines::create(vertexCount, true, false);
		auto linesData = lines->getModelData();

		auto vertices = linesData->vertex;
		auto colors = linesData->color;
		auto flags = linesData->lineSegmentFlags;

		for (auto i = 0u; i < vertexCount; ++i) {
			auto& v = vertices[i];
			if (i % 2 == 0) {
				v.x = grid[i] * 0.5;
				v.y = i;
				v.z = 0;
			}
			else {
				v.x = -vertices[i - 1].x;
				v.y = vertices[i - 1].y;
				v.z = 0;
			}
			colors[i] = { 255, 255, 255, 255 / 6 };
			flags[i] = (i % 2) == 0;
		}

		for (auto& child : gridRoot->children) {
			if (child->isInstanceOfType(NI::RTTIStaticPtr::NiLines)) {
				auto node = static_cast<NI::Lines*>(child.get());
				node->setModelData(linesData);
			}
		}

		gridRoot->localTranslate = position;
		gridRoot->localScale = gridSize / 2.0f;

		gridRoot->setAppCulled(false);
		gridRoot->update();
		gridRoot->updateEffects();
		gridRoot->updateProperties();
	}

	void WidgetsController::showGrid() {
		if (gridRoot) {
			gridRoot->setAppCulled(false);
		}
	}

	void WidgetsController::hideGrid() {
		if (gridRoot) {
			gridRoot->setAppCulled(true);
		}
	}
}
