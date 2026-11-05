# One unbreakable block with the block states s (see admin:build/solid/fill_state):
#   /function admin:build/solid/set_state {p:[x, y, z], b:"oak_stairs", s:{facing:"east"}}
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$function admin:build/solid/fill_state {p: $(p), b: "$(b)", s: $(s)}
