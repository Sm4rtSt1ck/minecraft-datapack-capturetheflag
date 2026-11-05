# The unbreakable blocks at the point markers are removed (see admin:build/solid/remove); the markers
# stay
#   /function admin:build/solid/remove_pointwise
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

scoreboard players set #mode solid.tmp 0
function admin:build/solid/internal/points
