# mwseTimer

A Timer is a class used to keep track of callback that should be invoked at a later time.

## Values

```eval_rst
.. toctree::
    :hidden:

    mwseTimer/duration
    mwseTimer/iterations
    mwseTimer/state
    mwseTimer/timeLeft
    mwseTimer/timing
```

#### [duration](mwseTimer/duration.md)

> The amount of time left on the timer.

#### [iterations](mwseTimer/iterations.md)

> The amount of iterations left for the timer.

#### [state](mwseTimer/state.md)

> The state of the timer, matching timer.active, timer.paused, or timer.expired.

#### [timeLeft](mwseTimer/timeLeft.md)

> The amount of time left before this timer will complete.

#### [timing](mwseTimer/timing.md)

> When this timer ends, or the time remaining if the timer is paused.

## Functions

```eval_rst
.. toctree::
    :hidden:

    mwseTimer/callback
    mwseTimer/cancel
    mwseTimer/pause
    mwseTimer/reset
    mwseTimer/resume
```

#### [callback](mwseTimer/callback.md)

> The callback that will be invoked when the timer elapses.

#### [cancel](mwseTimer/cancel.md)

> Cancels the timer.

#### [pause](mwseTimer/pause.md)

> Pauses the timer.

#### [reset](mwseTimer/reset.md)

> Resets the timer completion time, as if it elapsed. Only works if the timer is active.

#### [resume](mwseTimer/resume.md)

> Resumes a paused timer.
