# timer

The timer library provides helper functions for creating delayed executors.

## Values

```eval_rst
.. toctree::
    :hidden:

    timer/active
    timer/expired
    timer/game
    timer/paused
    timer/real
    timer/simulate
```

#### [active](timer/active.md)

> Constant to represent a timer that is actively running.

#### [expired](timer/expired.md)

> Constant to represent a timer that has completed.

#### [game](timer/game.md)

> Constant to represent timers that run based on in-world time.

#### [paused](timer/paused.md)

> Constant to represent a timer that is paused.

#### [real](timer/real.md)

> Constant to represent timers that run in real-time.

#### [simulate](timer/simulate.md)

> Constant to represent timers that run when the game isn't paused.

## Functions

```eval_rst
.. toctree::
    :hidden:

    timer/delayOneFrame
    timer/start
```

#### [delayOneFrame](timer/delayOneFrame.md)

> Creates a timer that will finish the next frame. It defaults to the next simulation frame.

#### [start](timer/start.md)

> Creates a timer.
