# string

This library provides generic functions for string manipulation, such as finding and extracting substrings, and pattern matching. When indexing a string in Lua, the first character is at position 1 (not at 0, as in C). Indices are allowed to be negative and are interpreted as indexing backwards, from the end of the string. Thus, the last character is at position -1, and so on.

## Functions

```eval_rst
.. toctree::
    :hidden:

    string/endswith
    string/format
    string/startswith
```

#### [endswith](string/endswith.md)

> Returns true if a string ends with a given pattern.

#### [format](string/format.md)

> This function creates a string, given various values. The format follows the printf format, with the additional option of %q to automatically quote a string.

#### [startswith](string/startswith.md)

> Returns true if a string begins with a given pattern.
