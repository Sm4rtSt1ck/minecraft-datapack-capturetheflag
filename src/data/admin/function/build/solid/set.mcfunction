# One unbreakable block (see admin:build/solid/fill):
#   /function admin:build/solid/set {p:[x, y, z], b:"stone"}
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$function admin:build/solid/fill_state {p: $(p), b: "$(b)", s: {}}
