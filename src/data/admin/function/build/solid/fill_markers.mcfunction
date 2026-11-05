# The area between the markers A and B (admin:build/get_tools) is filled with unbreakable blocks b
# (see admin:build/solid/fill); the markers stay (admin:build/solid/remove_markers removes it):
#   /function admin:build/solid/fill_markers {b:"stone"}
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

$function admin:build/solid/fill_markers_state {b: "$(b)", s: {}}
