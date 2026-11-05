# The walk starts at the lowest corner {x, y, z}. "positioned" with whole numbers centers x and z
# (x.5), "align xyz" puts it back on the block corner (x.0 y.0 z.0): the displays don't shift.
$execute positioned $(x) $(y) $(z) align xyz run function admin:build/solid/internal/x
