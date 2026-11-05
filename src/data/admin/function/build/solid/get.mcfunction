# An unbreakable block as an item: it looks like the block b ("SOLID" in its name), it places a barrier
# and the display of b in it (admin:build/solid/internal/placed). Creative only (it is a barrier).
#   /function admin:build/solid/get {b:"stone"}
# A block with states: admin:build/solid/get_state.
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$function admin:build/solid/get_state {b: "$(b)", s: {}}
