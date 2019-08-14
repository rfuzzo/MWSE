# table

This library provides generic functions for table manipulation. It provides all its functions inside the table table.

## Functions

```eval_rst
.. toctree::
    :hidden:

    table/bininsert
    table/binsearch
    table/choice
    table/copy
    table/deepcopy
    table/find
    table/removevalue
    table/size
```

#### [bininsert](table/bininsert.md)

> Inserts a given value through BinaryInsert into the table sorted by [, comp].
 >
 >If 'comp' is given, then it must be a function that receives two table elements, and returns true when the first is less than the second, e.g. comp = function(a, b) return a > b end, will give a sorted table, with the biggest value on position 1. [, comp] behaves as in table.sort(table, value [, comp]) returns the index where 'value' was inserted

#### [binsearch](table/binsearch.md)

> Performs a binary search for a given value.
 >
 >If the  value is found:
 >	It returns a table holding all the mathing indices (e.g. { startindice,endindice } )
 >	endindice may be the same as startindice if only one matching indice was found
 >If compval is given:
 >	then it must be a function that takes one value and returns a second value2,
 >	to be compared with the input value, e.g.:
 >	compvalue = function( value ) return value[1] end
 >If reversed is set to true:
 >	then the search assumes that the table is sorted in reverse order (largest value at position 1)
 >	note when reversed is given compval must be given as well, it can be nil/_ in this case
 >Return value:
 >	on success: a table holding matching indices (e.g. { startindice,endindice } )
 >	on failure: nil

#### [choice](table/choice.md)

> Returns a random element from the given table.

#### [copy](table/copy.md)

> Shallowly copies a table's contents to a destination table. If no destination table is provided, a new table will be created. Note that sub tables will not be copied, and will still refer to the same data.

#### [deepcopy](table/deepcopy.md)

> Copies a table's contents. All subtables will also be copied, as will any metatable.

#### [find](table/find.md)

> Returns the key for a given value, or nil if the table does not contain the value.

#### [removevalue](table/removevalue.md)

> Removes a value from a given table. Returns true if the value was successfully removed.

#### [size](table/size.md)

> Returns the number of elements inside the table. Unlike the length operator (#) this will work with any table.
