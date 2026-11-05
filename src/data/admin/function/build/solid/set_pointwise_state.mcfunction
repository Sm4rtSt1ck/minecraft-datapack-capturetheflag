# admin:build/solid/set_pointwise with the block states s:
#   /function admin:build/solid/set_pointwise_state {b:"oak_stairs", s:{facing:"east"}}
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$data modify storage admin:build a set value {b: "$(b)", s: $(s)}
function admin:build/solid/internal/state
scoreboard players set #mode solid.tmp 1
function admin:build/solid/internal/points
