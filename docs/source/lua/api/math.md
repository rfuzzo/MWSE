# math

This library is an interface to the standard C math library. It provides all its functions inside the table math.

## Functions

```eval_rst
.. toctree::
    :hidden:

    math/clamp
    math/remap
    math/round
```

#### [clamp](math/clamp.md)

> Returns a value, limited by upper and lower bounds.

#### [remap](math/remap.md)

> Returns a value, scaled from expected values [lowIn, highIn] to [lowOut, highOut].
 >
 >For example, a value of 7 remapped from [0,10] to [0,100] would be 70.

#### [round](math/round.md)

> Rounds a number to a given count of digits.
