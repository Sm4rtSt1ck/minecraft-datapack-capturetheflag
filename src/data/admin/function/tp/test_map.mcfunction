# The point: registry/world.bolt (ADMIN_TP)
from registry:world import ADMIN_TP
_t = ADMIN_TP["test_map"]
function admin:tp/tp {xyz: (f"{_t[0]} {_t[1]} {_t[2]}")}
