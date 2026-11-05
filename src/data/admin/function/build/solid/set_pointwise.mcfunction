# Every point marker (admin:build/get_tools) gets an unbreakable block b (see admin:build/solid/fill);
# the markers stay:
#   /function admin:build/solid/set_pointwise {b:"stone"}
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$function admin:build/solid/set_pointwise_state {b: "$(b)", s: {}}
