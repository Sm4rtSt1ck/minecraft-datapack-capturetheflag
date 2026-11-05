# admin:build/solid/fill with the block states s:
#   /function admin:build/solid/fill_state {p:[x1, y1, z1, x2, y2, z2], b:"oak_stairs", s:{facing:"east", half:"top"}}
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$data modify storage admin:build a set value {p: $(p), b: "$(b)", s: $(s)}
scoreboard players set #mode solid.tmp 1
function admin:build/solid/internal/run
