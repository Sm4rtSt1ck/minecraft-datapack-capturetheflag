# admin:build/solid/fill_markers with the block states s:
#   /function admin:build/solid/fill_markers_state {b:"oak_stairs", s:{facing:"east"}}
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$data modify storage admin:build a set value {b: "$(b)", s: $(s)}
scoreboard players set #mode solid.tmp 1
function admin:build/solid/internal/between
