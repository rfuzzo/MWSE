# stack

The stack library provides functions to interact with the mwse mwscript stack, for dealing with custom mwscript extensions.

## Functions

```eval_rst
.. toctree::
    :hidden:

    stack/clear
    stack/dump
    stack/empty
    stack/popFloat
    stack/popLong
    stack/popObject
    stack/popShort
    stack/popString
    stack/pushFloat
    stack/pushLong
    stack/pushObject
    stack/pushShort
    stack/pushString
    stack/size
```

#### [clear](stack/clear.md)

> Purges all elements from the stack.

#### [dump](stack/dump.md)

> Prints all values on the stack in hex format to the log file.

#### [empty](stack/empty.md)

> Determines if the stack is empty.

#### [popFloat](stack/popFloat.md)

> Pops a value of mwscript type "float" off of the stack.

#### [popLong](stack/popLong.md)

> Pops a value of mwscript type "long" off of the stack.

#### [popObject](stack/popObject.md)

> Pops a value of mwscript type "long" off of the stack, and tries to reinterpret as a game object.

#### [popShort](stack/popShort.md)

> Pops a value of mwscript type "short" off of the stack.

#### [popString](stack/popString.md)

> Pops a value of mwscript type "long" off of the stack, and tries to reinterpret as a string.

#### [pushFloat](stack/pushFloat.md)

> Pushes a value of mwscript type "float" onto the stack.

#### [pushLong](stack/pushLong.md)

> Pushes a value of mwscript type "long" onto the stack.

#### [pushObject](stack/pushObject.md)

> Pushes a value of mwscript type "long" onto the stack, which matches the address of a given game object.

#### [pushShort](stack/pushShort.md)

> Pushes a value of mwscript type "short" onto the stack.

#### [pushString](stack/pushString.md)

> Adds a string to mwse's string storage, and pushes a value of mwscript type "long" onto the stack that represents the string.

#### [size](stack/size.md)

> Returns the number of elements currently on the stack.
