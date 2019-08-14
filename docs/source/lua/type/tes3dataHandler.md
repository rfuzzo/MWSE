# tes3dataHandler

A core game object used for storing both active and non-dynamic gameplay data.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3dataHandler/backgroundThread
    tes3dataHandler/backgroundThreadId
    tes3dataHandler/backgroundThreadRunning
    tes3dataHandler/cellChanged
    tes3dataHandler/centralGridX
    tes3dataHandler/centralGridY
    tes3dataHandler/currentCell
    tes3dataHandler/currentInteriorCell
    tes3dataHandler/exteriorCells
    tes3dataHandler/lastExteriorCell
    tes3dataHandler/mainThread
    tes3dataHandler/mainThreadId
    tes3dataHandler/nonDynamicData
    tes3dataHandler/threadSleepTime
    tes3dataHandler/worldObjectRoot
    tes3dataHandler/worldPickLandscapeRoot
    tes3dataHandler/worldPickObjectRoot
```

#### [backgroundThread](tes3dataHandler/backgroundThread.md)

> A Windows handle to the background processing thread.

#### [backgroundThreadId](tes3dataHandler/backgroundThreadId.md)

> The thread ID for the background processing thread.

#### [backgroundThreadRunning](tes3dataHandler/backgroundThreadRunning.md)

> Access to the running state for the background processing thread.

#### [cellChanged](tes3dataHandler/cellChanged.md)

> A flag set for the frame that the player has changed cells.

#### [centralGridX](tes3dataHandler/centralGridX.md)

> The position of the origin horizontal grid coordinate.

#### [centralGridY](tes3dataHandler/centralGridY.md)

> The position of the origin longitudinal grid coordinate.

#### [currentCell](tes3dataHandler/currentCell.md)

> Access to the cell that the player is currently in.

#### [currentInteriorCell](tes3dataHandler/currentInteriorCell.md)

> Access to the current interior cell, if the player is in an interior.

#### [exteriorCells](tes3dataHandler/exteriorCells.md)

> A table of nine tes3cellExteriorData objects for any loaded exterior cells.

#### [lastExteriorCell](tes3dataHandler/lastExteriorCell.md)

> Access to the last visited exterior cell.

#### [mainThread](tes3dataHandler/mainThread.md)

> A Windows handle to the main execution thread.

#### [mainThreadId](tes3dataHandler/mainThreadId.md)

> The thread ID for the main execution thread.

#### [nonDynamicData](tes3dataHandler/nonDynamicData.md)

> A child structure where core game objects are held.

#### [threadSleepTime](tes3dataHandler/threadSleepTime.md)

> No description available.

#### [worldObjectRoot](tes3dataHandler/worldObjectRoot.md)

> One of the core parent scene graph nodes.

#### [worldPickLandscapeRoot](tes3dataHandler/worldPickLandscapeRoot.md)

> One of the core parent scene graph nodes.

#### [worldPickObjectRoot](tes3dataHandler/worldPickObjectRoot.md)

> One of the core parent scene graph nodes.
