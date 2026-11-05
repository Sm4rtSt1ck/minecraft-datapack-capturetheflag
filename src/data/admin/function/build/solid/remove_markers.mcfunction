# The unbreakable blocks between the markers A and B are removed (see admin:build/solid/remove); the
# markers stay
#   /function admin:build/solid/remove_markers
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

data modify storage admin:build a set value {}
scoreboard players set #mode solid.tmp 0
function admin:build/solid/internal/between
